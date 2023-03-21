  // ignore_for_file: non_constant_identifier_names, file_names, library_private_types_in_public_api

  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  
  void map_run() {
    runApp(const Map());
  }

  class Map extends StatelessWidget {
  const Map({super.key});

    @override
    
    Widget build(BuildContext context) {
      return const MaterialApp(
        title: 'Custom Marker Example',
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
    //final MarkerController _markerController = MarkerController();
    late GoogleMapController mapController;

    @override
    void initState() {
      super.initState();
      _loadMapStyle();
      _loadMarkerImage();
    }

    Future<void> _loadMapStyle() async {
      String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
      mapController.setMapStyle(style);
    }

    Future<void> _loadMarkerImage() async {

      // Load custom marker image
      final imageAsset = await rootBundle.load('assets/bin.png');
      final uint8List = imageAsset.buffer.asUint8List();
      var markerIcon = BitmapDescriptor.fromBytes(uint8List);

      // Add a custom marker to the map
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId("marker_1"),
            position: const LatLng(37.77423, -122.41622),
            icon: markerIcon, 
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("marker_2"),
            position: const LatLng(37.77163, -122.41622),
            icon: markerIcon, 
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("marker_3"),
            position: const LatLng(37.77163, -122.41942),
            icon: markerIcon, 
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("marker_4"),
            position: const LatLng(37.77423, -122.41942),
            icon: markerIcon, 
          ),
        );

        // Connect the markers using a polyline
        final List<LatLng> polylineCoordinates = [
          const LatLng(37.77423, -122.41622),
          const LatLng(37.77163, -122.41622),
          const LatLng(37.77163, -122.41942),
          const LatLng(37.77423, -122.41942),
          const LatLng(37.77423, -122.41622),
        ];

        _polylines.add(
          Polyline(
            polylineId: const PolylineId("marker_polyline"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 10,
          ),
        );

      }); 
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('SmartBin'),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.77483, -122.41942),
            zoom: 16,
          ),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          markers: _markers,
          polylines: _polylines,
        ),
      );
    }
  }