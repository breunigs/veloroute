#include <mbgl/storage/file_source_request.hpp>
#include <mbgl/storage/response.hpp>
#include <mbgl/util/io.hpp>

#include <sys/types.h>
#include <sys/stat.h>

#include <mbgl/util/compression.hpp>

#if defined(_WIN32) && !defined(S_ISDIR)
#define S_ISDIR(m) (((m)&S_IFMT) == S_IFDIR)
#endif

namespace mbgl {

inline bool is_compressed(const std::string& v) {
    return (((uint8_t)v[0]) == 0x1f) && (((uint8_t)v[1]) == 0x8b);
}

void requestLocalFile(const std::string& path, const ActorRef<FileSourceRequest>& req) {
    Response response;
    struct stat buf;
    int result = stat(path.c_str(), &buf);

    if (result == 0 && (S_IFDIR & buf.st_mode)) {
        response.error = std::make_unique<Response::Error>(Response::Error::Reason::NotFound);
    } else if (result == -1 && errno == ENOENT) {
        response.error = std::make_unique<Response::Error>(Response::Error::Reason::NotFound);
    } else {
        auto data = util::readFile(path);
        if (!data) {
            response.error = std::make_unique<Response::Error>(Response::Error::Reason::Other,
                                                               std::string("Cannot read file ") + path);
        } else {
            response.data = std::make_shared<std::string>(std::move(*data));
            if (is_compressed(*response.data)) {
                response.data = std::make_shared<std::string>(util::decompress(*response.data));
            }
        }
    }

    req.invoke(&FileSourceRequest::setResponse, response);
}

} // namespace mbgl
