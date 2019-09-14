
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'page.dart';
import 'dart:convert';

class PlaceHeatmapLayerPage extends Page {
  PlaceHeatmapLayerPage() : super(const Icon(Icons.check_circle), 'Place Heatmap Layer');

  @override
  Widget build(BuildContext context) {
    return const PlaceCircleLayerBody();
  }
}

class PlaceCircleLayerBody extends StatefulWidget {
  const PlaceCircleLayerBody();

   @override
  State<StatefulWidget> createState() => PlaceCircleLayerBodyState();
}

class PlaceCircleLayerBodyState extends State<PlaceCircleLayerBody> {
  PlaceCircleLayerBodyState();

  static LatLng center = const LatLng(-33.86711, 151.1947171);
  
   MapboxMapController controller;

   void _onMapCreated(MapboxMapController controller) {
     this.controller = controller;
   }

   void _add() {
     List<LatLng> points = List();
     points.add(center);
      points.add(center);
      
     controller.addHeatmapLayer(
       HeatmapLayerOptions(points: points)
     );
   }

   @override
   Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 300.0,
            height: 200.0,
            child: MapboxMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-33.852, 151.211),
                zoom: 11.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('add'),
                          onPressed: _add,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
   }
}