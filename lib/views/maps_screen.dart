import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _mapController;
  final LatLng _sourceLocation = LatLng(37.7749, -122.4194); // Example coordinates
  final LatLng _destinationLocation = LatLng(34.0522, -118.2437); // Example coordinates
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    // Additional setup can go here
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onZoomIn() {
    _mapController.animateCamera(CameraUpdate.zoomIn());
  }

  void _onZoomOut() {
    _mapController.animateCamera(CameraUpdate.zoomOut());
  }

  void _onMapTypeChanged(MapType mapType) {
    setState(() {
      _currentMapType = mapType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      Marker(
        markerId: MarkerId('source'),
        position: _sourceLocation,
        infoWindow: InfoWindow(title: 'Source'),
      ),
      Marker(
        markerId: MarkerId('destination'),
        position: _destinationLocation,
        infoWindow: InfoWindow(title: 'Destination'),
      ),
    };

    final Set<Polyline> polylines = {
      Polyline(
        polylineId: PolylineId('route'),
        points: [_sourceLocation, _destinationLocation],
        color: Colors.blue,
        width: 5,
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Directions'),
        actions: [
          PopupMenuButton<MapType>(
            onSelected: _onMapTypeChanged,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MapType.normal,
                child: Text('Normal'),
              ),
              PopupMenuItem(
                value: MapType.satellite,
                child: Text('Satellite'),
              ),
              PopupMenuItem(
                value: MapType.terrain,
                child: Text('Terrain'),
              ),
              PopupMenuItem(
                value: MapType.hybrid,
                child: Text('Hybrid'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _sourceLocation,
              zoom: 10,
            ),
            onMapCreated: _onMapCreated,
            mapType: _currentMapType,
            markers: markers,
            polylines: polylines,
            // Disable interactive map features
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            bottom: 50,
            left: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _onZoomIn,
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _onZoomOut,
                  child: Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
