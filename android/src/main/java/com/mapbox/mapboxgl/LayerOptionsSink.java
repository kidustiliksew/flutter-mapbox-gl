package com.mapbox.mapboxgl;

import com.mapbox.geojson.Point;

import java.util.List;

interface LayerOptionsSink {
    void setPoints(List<Point> points);
}
