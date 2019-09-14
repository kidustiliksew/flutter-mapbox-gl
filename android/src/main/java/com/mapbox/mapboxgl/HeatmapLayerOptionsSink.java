package com.mapbox.mapboxgl;

import com.mapbox.geojson.Point;

import java.util.List;

interface HeatmapLayerOptionsSink {
    void setPoints(List<Point> points);
}
