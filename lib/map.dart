// ignore_for_file: non_constant_identifier_names, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_bin/profile.dart';
import 'package:smart_bin/qr.dart';

void map_run() {
  runApp(const Map());
}

class Map extends StatelessWidget {
const Map({super.key});

  @override
  
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmartBin',
      home: MyMapWidget(),
    );
  }
}

class MyMapWidget extends StatefulWidget {
const MyMapWidget({super.key});

  @override
  _MyMapWidgetState createState() => _MyMapWidgetState();
}

class _MyMapWidgetState extends State<MyMapWidget> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  late GoogleMapController mapController;

  bool _sheetOpened = false;

  @override
  void initState() {
    super.initState();
    _loadMarkerImage();
  }

  Future<String> readJson() async {
  final String jsonString = await rootBundle.loadString('assets/map_style.json');
    return jsonString;
  } 
  void _onMapCreated(GoogleMapController controller) async{
      String jsonStr = await readJson();
      controller.setMapStyle(jsonStr);
  }

  Future<void> _loadMarkerImage() async {

    final imageAsset = await rootBundle.load('assets/bin.png');
    final uint8List = imageAsset.buffer.asUint8List();
    var markerIcon = BitmapDescriptor.fromBytes(uint8List);

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("marker_1"),
          position: const LatLng(37.77423, -122.41622),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () { // Handle marker tap event
            _showSheet(const MarkerId("marker_1"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_2"),
          position: const LatLng(37.77163, -122.41622),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_2"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_3"),
          position: const LatLng(37.77163, -122.41942),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_3"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_4"),
          position: const LatLng(37.77423, -122.41942),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_4"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_5"),
          position: const LatLng(37.773080634229224, -122.42192777627538),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_5"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_6"),
          position: const LatLng(37.7699501475169, -122.42272610808192),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_6"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_7"),
          position: const LatLng(37.774602496494786, -122.42289451240352),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_7"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_8"),
          position: const LatLng(37.769359348956264, -122.42001274785382),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_8"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_9"),
          position: const LatLng(37.77220721889182, -122.42259039320821),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_9"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_10"),
          position: const LatLng(37.7778567193911, -122.42269098330219),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_10"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_11"),
          position: const LatLng(37.77764482572333, -122.41743486334514),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_11"));
          },
          icon: markerIcon, 
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId("marker_12"),
          position: const LatLng(37.77747787876944, -122.42010760440522),
          infoWindow: const InfoWindow(
            title: 'San Francisco',
            snippet: 'Welcome to San Francisco',
          ),
          onTap: () {
            _showSheet(const MarkerId("marker_12"));
          },
          icon: markerIcon, 
        ),
      );

      // Connect the markers using a polyline
      final List<LatLng> polylineCoordinates1 = [
        const LatLng(37.77423, -122.41622),
        const LatLng(37.77163, -122.41622),
        const LatLng(37.77163, -122.41942),
        const LatLng(37.77423, -122.41942),
        const LatLng(37.77423, -122.41622),
      ];

      _polylines.add(
        Polyline(
          polylineId: const PolylineId("marker_polyline"),
          points: polylineCoordinates1,
          color: Colors.blue,
          width: 5,
        ),
      );

    }); 
  }

  void _showSheet(MarkerId markerId) {
    setState(() {
      _sheetOpened = true;
    });
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250.0,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_drop_down_sharp, color: Colors.black), 
                          onPressed: () { 
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Show related',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 120,
                        icon: Image.asset(
                          'assets/qr.png',
                        ),
                        onPressed: () async {
                          final result = await Navigator.push<String>(
                            context,
                            MaterialPageRoute(builder: (context) => const QRScreen()),
                          );
                          if (result != null) {
                            print(result);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).then((value) {
        setState(() {
          _sheetOpened = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {   
  return Scaffold(
  body: Stack(
    children: [
      GoogleMap(
        mapType: MapType.normal,
        mapToolbarEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.77483, -122.41942),
          zoom: 16,
        ),
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        markers: _markers,
        polylines: _polylines,
      ),
        Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: _sheetOpened ? 260.0 : 10.0,
            child: SizedBox(
              width: 375.0,
              height: 65.0,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  user_profile();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
}
}


