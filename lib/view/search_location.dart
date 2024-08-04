import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:gropare/constt.dart';
import '../address/form_address.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

const kGoogleApiKey = 'AIzaSyBs2GNrSwJzRKFHE2Sg4cIqEaRQ_OmPwX8';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(21.7679, 78.8718), zoom: 6);

  Set<Marker> markersList = {};

  late GoogleMapController googleMapController;

  final Mode _mode = Mode.overlay;

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
                                  'Your Location',
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
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text('Select location'),
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
            markers: markersList,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          ElevatedButton(
            onPressed: _handlePressButton, 
            child: const Text("Search Places"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 123, 193, 68),),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country,"in"),Component(Component.country,"usa")]);


    displayPrediction(p!,homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {

    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markersList.clear();
    markersList.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat, lng),infoWindow: InfoWindow(title: detail.result.name)));

    setState(() {});

     googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

  }
}