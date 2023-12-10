#include <mbgl/map/map.hpp>
#include <mbgl/map/map_options.hpp>
#include <mbgl/util/image.hpp>
#include <mbgl/util/run_loop.hpp>
#include <mbgl/util/premultiply.hpp>
#include <mbgl/storage/network_status.hpp>
#include <mbgl/gfx/headless_frontend.hpp>
#include <mbgl/style/expression/dsl.hpp>
#include <mbgl/style/filter.hpp>
#include <mbgl/style/style.hpp>

#include <webp/encode.h>

#include <args.hxx>

#include <fstream>
#include <list>
#include <map>

#define FIXED_WIDTH_UINT(value) char((value) >> 24), char((value) >> 16), char((value) >> 8), char((value) >> 0)

bool file_exists(const std::string &name) {
    std::ifstream f(name.c_str());
    return f.good();
}

std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}
void printError(const std::string &msg) {
    const std::string prefix = "error: ";
    const char length[4] = {FIXED_WIDTH_UINT(prefix.size() + msg.size())};
    std::cout.write(length, 4);
    std::cout << prefix << msg;
}

void die(const std::string &msg) {
    printError(msg);
    exit(1);
}

void printImage(const std::string &img) {
    const char length[4] = {FIXED_WIDTH_UINT(img.size())};
    std::cout.write(length, 4);
    std::cout << img;
}

std::map<std::string, std::string> cache;
std::list<std::string> cacheLRU;
const int cacheCapacity = 120;

void mapRenderLoop(std::string style, std::string asset_root, double maxZoom, uint32_t maxDimension) {
    using namespace mbgl;

    // {width, height}, pixelRatio
    HeadlessFrontend frontPr1({123, 123}, static_cast<float>(1));
    HeadlessFrontend frontPr2({123, 123}, static_cast<float>(2));

    Map mapPr1(frontPr1,
               MapObserver::nullObserver(),
               MapOptions().withMapMode(MapMode::Static).withPixelRatio(1),
               ResourceOptions().withAssetPath(asset_root));
    mapPr1.getStyle().loadURL(style);
    frontPr1.render(mapPr1);

    Map mapPr2(frontPr2,
               MapObserver::nullObserver(),
               MapOptions().withMapMode(MapMode::Static).withPixelRatio(2),
               ResourceOptions().withAssetPath(asset_root));
    mapPr2.getStyle().loadURL(style);
    frontPr2.render(mapPr2);

    const std::array<HeadlessFrontend *, 2> frontends = {&frontPr1, &frontPr2};
    const std::array<Map *, 2> maps = {&mapPr1, &mapPr2};

    std::string line;
    while (std::getline(std::cin, line)) {
        // ignore Erlang message length indicator and instead rely on newline detection
        line.erase(0, 4);

        auto cachedImage = cache.find(line);
        if (cachedImage != cache.end()) {
            printImage(cachedImage->second);
            continue;
        }

        auto args = split(line, ' ');
        std::size_t expected = 9;
        if (args.size() != expected) {
            printError("invalid argument count. Expected " + std::to_string(expected) + ", but got " +
                       std::to_string(args.size()) + ". Line given: " + line);
            continue;
        }

        int cnt = 0;
        double lon = std::stod(args[cnt++]);
        double lat = std::stod(args[cnt++]);
        double zoom = std::min(maxZoom, std::stod(args[cnt++]));
        uint32_t pixelRatio = std::stod(args[cnt++]);
        uint32_t width = std::stoi(args[cnt++]);
        uint32_t height = std::stoi(args[cnt++]);
        std::string highlightLayer = args[cnt++];
        std::string highlightProp = args[cnt++];
        std::string highlightVal = args[cnt++];

        assert(cnt == expected);

        if (width < 1) {
            printError("invalid value for width. Need integer >= 1, but got " + std::to_string(width));
            continue;
        }
        width = std::min(width, maxDimension);

        if (height < 1) {
            printError("invalid value for height. Need integer >= 1, but got " + std::to_string(height));
            continue;
        }
        height = std::min(height, maxDimension);

        if (pixelRatio < 1 || pixelRatio > 2) {
            printError("invalid value for pixelRatio. Needs to be integer 1 or 2, but got " +
                       std::to_string(pixelRatio));
            continue;
        }

        auto map = maps[pixelRatio - 1];
        auto frontend = frontends[pixelRatio - 1];

        const auto size = Size(width, height);
        frontend->setSize(size);
        map->setSize(size);
        map->jumpTo(CameraOptions().withCenter(LatLng{lat, lon}).withZoom(zoom));

        {
            using namespace mbgl::style;
            using namespace mbgl::style::expression::dsl;
            map->getStyle()
                .getLayer(highlightLayer)
                ->setFilter(Filter(eq(get(literal(highlightProp)), literal(highlightVal))));
        }

        try {
            std::atomic_bool finished = false;
            std::thread t([&finished]() {
                std::this_thread::sleep_for(std::chrono::seconds(3));
                if (finished) return;
                die("Rendering timeout. Are all path references local?");
            });
            t.detach();
            auto image = frontend->render((*map)).image;
            finished = true;

            const auto src = util::unpremultiply(image.clone());
            uint8_t *webp_image;
            auto webp_image_size = WebPEncodeLosslessRGBA(
                src.data.get(), src.size.width, src.size.height, src.stride(), &webp_image);
            auto img = std::string(webp_image, webp_image + webp_image_size);
            WebPFree(webp_image);

            if (cache.size() >= cacheCapacity) {
                // evict oldest element
                auto i = --cacheLRU.end();
                cache.erase(*i);
                cacheLRU.erase(i);
            }
            cacheLRU.push_front(line);
            cache[line] = img;

            printImage(img);
        } catch (std::exception &e) {
            printError("failed rendering " + std::string(e.what()));
            continue;
        }
    }
}

int main(int argc, char *argv[]) {
    args::ArgumentParser argumentParser("veloroute.hamburg static map render loop");
    args::HelpFlag helpFlag(argumentParser, "help", "Display this help menu", {"help"});

    args::ValueFlag<std::string> styleValue(argumentParser, "file", "Map stylesheet", {'s', "style"});
    args::ValueFlag<std::string> assetsValue(
        argumentParser, "file", "Directory to which asset:// URLs will resolve", {'a', "assets"});
    args::ValueFlag<double> maxDimensionValue(
        argumentParser, "number", "max image dimensions (width/height)", {'m', "max-dimension"});
    args::ValueFlag<double> maxZoomValue(argumentParser, "number", "max zoom", {'z', "max-zoom"});

    try {
        argumentParser.ParseCLI(argc, argv);
    } catch (const args::Help &) {
        printError(argumentParser.Help());
        exit(0);
    } catch (const args::ParseError &e) {
        die(e.what());
    } catch (const args::ValidationError &e) {
        die(e.what());
    }

    const double maxZoom = maxZoomValue ? args::get(maxZoomValue) : 17;
    const uint32_t maxDimension = maxDimensionValue ? args::get(maxDimensionValue) : 4096;
    const std::string asset_root = assetsValue ? args::get(assetsValue) : ".";

    std::string style = args::get(styleValue);
    if (!file_exists(style)) die("style file " + style + " not found");
    if (style.find("://") == std::string::npos) {
        style = std::string("file://") + style;
    }

    // prefer to fail network calls for forgotten URLs in styles/metadata
    mbgl::NetworkStatus::Set(mbgl::NetworkStatus::Status::Offline);
    mbgl::util::RunLoop loop;
    mapRenderLoop(style, asset_root, maxZoom, maxDimension);
    return 0;
}
