import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.maplibre.mlt.converter.ConversionConfig;
import org.maplibre.mlt.converter.FeatureTableOptimizations;
import org.maplibre.mlt.converter.MltConverter;
import org.maplibre.mlt.converter.mvt.MvtUtils;
import org.maplibre.mlt.metadata.tileset.MltTilesetMetadata;

public class Converter {
  public static void main(String[] args) throws IOException {
    if (args.length != 1) {
      System.err.println("expected exactly 1 argument to input directory, but got: " + java.util.Arrays.toString(args));
      System.exit(1);
    }

    Path inputPath = Paths.get(args[0]);

    if (!Files.exists(inputPath) || !Files.isDirectory(inputPath)) {
      System.err.println("directory doesn't exist: " + inputPath.toAbsolutePath());
      System.exit(1);
    }
    List<Path> pbfFiles;
    try (Stream<Path> paths = Files.walk(inputPath)) {
      pbfFiles = paths.filter(Files::isRegularFile)
          .filter(path -> path.toString().toLowerCase().endsWith(".pbf"))
          .collect(Collectors.toList());
    }

    var optimization = new FeatureTableOptimizations(true, true, List.of());
    var optimizations = Map.of(
        "water", optimization,
        "transportation", optimization,
        "routes", optimization,
        "building", optimization);
    var config = new ConversionConfig(true, true, optimizations);

    int total = pbfFiles.size();
    AtomicInteger counter = new AtomicInteger(0);
    final int barWidth = 40; // width of the progress bar

    var coreCount = Runtime.getRuntime().availableProcessors() / 3;
    System.setProperty("java.util.concurrent.ForkJoinPool.common.parallelism", String.valueOf(coreCount));
    pbfFiles.parallelStream().forEach(pbfPath -> {
      try {
        byte[] mvtData = Files.readAllBytes(pbfPath);
        var mvtTile = MvtUtils.decodeMvt(mvtData);

        var tilesetMetadata = MltConverter.createTilesetMetadata(
            mvtTile, Map.of(), true);

        byte[] mltData = MltConverter.convertMvt(mvtTile, tilesetMetadata, config, null);

        String mltPath = pbfPath.toString().replace(".pbf", ".mlt");
        Files.write(Paths.get(mltPath), mltData);

        int done = counter.incrementAndGet();
        double progress = (double) done / total;
        int filled = (int) (progress * barWidth);

        String bar = "=".repeat(filled) + " ".repeat(barWidth - filled);
        System.out.printf("\r[%s] %d/%d converting to MLT", bar, done, total);
        System.out.flush();
      } catch (IOException | IllegalArgumentException e) {
        System.err.println("-- failed\nError processing " + pbfPath + ": " + e.getMessage());
        System.exit(1);
      }
    });

    System.out.println(" -- done\n");
  }
}

// byte[] mvtData = Files.readAllBytes(pbfPath);
// var mvtTile = MvtUtils.decodeMvt(mvtData);
// var tilesetMetadata = MltConverter.createTilesetMetadata(mvtTile, Map.of(),
// true);
// var config = new ConversionConfig(true, true, Map.of());
// byte[] mltData = MltConverter.convertMvt(mvtTile, tilesetMetadata, config,
// null);

// String mltPath = pbfPath.toString().replace(".pbf", ".mlt");
// Files.write(Paths.get(mltPath), mltData);

// import org.maplibre.mlt.converter.FeatureTableOptimizations;
// import java.util.Map;

// var optimization = new FeatureTableOptimizations(true, true, columnMappings);
// var optimizations = Map.of(
// "water", optimization,
// "roads", optimization,
// "buildings", optimization
// );

// var config = new ConversionConfig(true, true, optimizations);

// byte[] mltData = MltConverter.convertMvt(mvtTile, tilesetMetadata, config,
// null);
