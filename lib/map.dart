  // ignore_for_file: non_constant_identifier_names, file_names, library_private_types_in_public_api

  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:SmartBin/profile.dart';
  
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
    //final MarkerController _markerController = MarkerController();
    late GoogleMapController mapController;

    bool _sheetOpened = false;
    //MarkerId? _selectedMarker;

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
            return const SizedBox(
              height: 100.0,
              child: Center(
                child: Text('Results'),                
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
    // appBar: AppBar(
    //   title: const Text('SmartBin'),
    // ),
    body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.77483, -122.41942),
            zoom: 16,
          ),
          onMapCreated: _onMapCreated,
          markers: _markers,
          polylines: _polylines,
        ),
        Positioned(
          bottom: _sheetOpened ? 105.0 : 16.0,
          right: 16.0,
          child: SizedBox(
            width: 375.0,
            height: 65.0,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                user_profile();
                // if (_sheetOpened) {
                // Navigator.of(context).pop();
                // setState(() {
                // _sheetOpened = false;
                // });
                // }
                },
              //child: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
 }
}