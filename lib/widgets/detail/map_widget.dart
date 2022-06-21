import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  final Location location;

  const MapWidget({
    super.key,
    required this.location,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  double zoom = 16;
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    String mapStyle = themeMode.getThemeDark ? 'dark-v10' : 'light-v10';
    LatLng location =
        LatLng(widget.location.latitude!, widget.location.longitude!);

    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: location,
              zoom: zoom,
              minZoom: 0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/mapbox/$mapStyle/tiles/{z}/{x}/{y}?access_token=${ApiKey.mapbox}',
                additionalOptions: {
                  'accessToken': ApiKey.mapbox,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: location,
                    builder: (ctx) => const Icon(
                      Icons.push_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: themeMode.getThemeDark
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.5),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.add,
                    color: theme.textColor,
                  ),
                  onTap: () {
                    setState(() {
                      if (zoom < 18) zoom++;
                      mapController.move(location, zoom);
                    });
                  },
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  child: Icon(
                    Icons.remove,
                    color: theme.textColor,
                  ),
                  onTap: () {
                    setState(() {
                      if (zoom > 1) zoom--;
                      mapController.move(location, zoom);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
