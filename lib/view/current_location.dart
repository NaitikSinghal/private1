import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gropare/constt.dart';
import '../address/form_address.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(21.7679, 78.8718), zoom: 6);

  Set<Marker> markers = {};

  String? _currentAddress;
  Position? _currentPosition;

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
                margin: EdgeInsets.only(top:10, left: 15, right: 15),
                height: 120,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only( bottom: 10,),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  child: Icon(
                                    Icons.location_on,
                                    size: 30,
                                  ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'Your Location ${_currentAddress ?? ""}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                          child: Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 123, 193, 68),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                              onPressed: () async {
                                Navigator.push(context,MaterialPageRoute(builder: (context) =>  FormAddress()),);
                              },
                              child: Text("Enter Complete Address", style: kText1,)
                            ),
                          ),
                    ),
                  ],
                ),
            ),
          elevation: 0,
          shape: CircularNotchedRectangle(),
      ),
      appBar: AppBar(
        title: Text('Current Location'),
        backgroundColor:  Color.fromARGB(255, 123, 193, 68),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: initialCameraPosition,
                markers: markers,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) async {
                  googleMapController = controller;
                  Position position = await _determinePosition();
        
                  googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));
        
                  markers.clear();
        
                  markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));
        
                  setState(() {
                  });
                },
              ),
              // Positioned(
              //   child: SizedBox(
              //     width: 200,
              //     height: 200,
              //     child: Align(
              //     alignment: FractionalOffset.bottomCenter,
              //       child: Padding(
              //         padding: EdgeInsets.only(bottom: 10.0),
              //           child: Container(
              //             color: Colors.white,
              //             child: Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Text(
              //                 'Saved Addresses',
              //                 style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     Position position = await _determinePosition();

      //     googleMapController
      //         .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


      //     markers.clear();

      //     markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

      //     setState(() {});

      //   },
      //   label: const Text("Current Location"),
      //   icon: const Icon(Icons.location_history),
      // ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}