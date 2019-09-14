part of mapbox_gl;

class CircleLayer {
  @visibleForTesting
  CircleLayer(this._id, this._options);

  final String _id;
  String get id => _id;

  CircleLayerOptions _options;

  CircleLayerOptions get options => _options;
}

class CircleLayerOptions {
  const CircleLayerOptions({this.points});

  final List<LatLng> points;

  static const CircleLayerOptions defaultOptions = CircleLayerOptions();

  CircleLayerOptions copyWith(CircleLayerOptions changes) {
    if (changes == null) {
      return this;
    }

    return CircleLayerOptions(points: changes.points ?? points);
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
