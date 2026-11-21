package hamburg.veloroute.josm;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.openstreetmap.josm.data.osm.DataSet;
import org.openstreetmap.josm.gui.MainApplication;
import org.openstreetmap.josm.gui.MapFrame;
import org.openstreetmap.josm.gui.layer.Layer;
import org.openstreetmap.josm.gui.layer.LayerPositionStrategy;
import org.openstreetmap.josm.gui.layer.MainLayerManager;
import org.openstreetmap.josm.gui.layer.OsmDataLayer;
import org.openstreetmap.josm.gui.progress.NullProgressMonitor;
import org.openstreetmap.josm.gui.util.GuiHelper;
import org.openstreetmap.josm.io.Compression;
import org.openstreetmap.josm.io.IllegalDataException;
import org.openstreetmap.josm.io.OsmReader;
import org.openstreetmap.josm.plugins.Plugin;
import org.openstreetmap.josm.plugins.PluginInformation;
import org.openstreetmap.josm.tools.Logging;

/**
 * Loads the video index layers in the background once the map is shown, hidden and read-only,
 * without progress dialogs and without changing the active layer.
 * The files are passed as comma separated paths in the system property {@code veloroute.video_layers}.
 */
public class VideoLayersPlugin extends Plugin {
    private static final String PROPERTY = "veloroute.video_layers";

    private boolean started;

    public VideoLayersPlugin(PluginInformation info) {
        super(info);
    }

    @Override
    public void mapFrameInitialized(MapFrame oldFrame, MapFrame newFrame) {
        String files = System.getProperty(PROPERTY);
        if (started || newFrame == null || files == null || files.isBlank()) {
            return;
        }
        started = true;
        Thread thread = new Thread(() -> loadAll(files.split(",")), "veloroute-video-layers");
        thread.setDaemon(true);
        thread.start();
    }

    private static void loadAll(String[] paths) {
        long start = System.nanoTime();
        for (String path : paths) {
            load(new File(path));
        }
        Logging.info("veloroute: loaded {0} video layers in {1} ms", paths.length, (System.nanoTime() - start) / 1_000_000);
    }

    private static void load(File file) {
        DataSet dataSet;
        try (InputStream in = Compression.getUncompressedFileInputStream(file)) {
            // The video files' negative ids are above the ids of map.osm, so the reader assigns
            // fresh ids from the atomic generator and does not race with edits on the EDT.
            dataSet = OsmReader.parseDataSet(in, NullProgressMonitor.INSTANCE);
        } catch (IOException | IllegalDataException e) {
            Logging.error("veloroute: failed to load video layer " + file);
            Logging.error(e);
            return;
        }
        dataSet.lock();

        OsmDataLayer layer = new OsmDataLayer(dataSet, file.getName(), file) {
            @Override
            public LayerPositionStrategy getDefaultLayerPosition() {
                return LayerPositionStrategy.AFTER_LAST_DATA_LAYER;
            }
        };
        layer.setVisible(false);

        GuiHelper.runInEDT(() -> {
            MainLayerManager layerManager = MainApplication.getLayerManager();
            Layer active = layerManager.getActiveLayer();
            layerManager.addLayer(layer, false);
            if (active != null && layerManager.containsLayer(active)) {
                layerManager.setActiveLayer(active);
            }
        });
    }
}
