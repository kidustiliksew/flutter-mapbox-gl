part of mapbox_gl;

class HeatmapLayer {
  @visibleForTesting
  HeatmapLayer(this._id, this._options);

  final String _id;
  
  String get id => _id;

  HeatmapLayerOptions _options;

  HeatmapLayerOptions get options => _options;
}

class HeatmapLayerOptions {
  const HeatmapLayerOptions({this.points});

  final List<LatLng> points;

  static const HeatmapLayerOptions defaultOptions = HeatmapLayerOptions();

  HeatmapLayerOptions copyWith(HeatmapLayerOptions changes) {
    if(changes == null) {
      return this;
    }

    return HeatmapLayerOptions(points: changes.points ?? points);
  }

  dynamic _toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    void addIfPresent(String fieldName, dynamic value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    var geoPoints = [];

    points.forEach((p) => geoPoints.add(p._toJson()));

    addIfPresent('points', geoPoints);

    return json;
  }
} 