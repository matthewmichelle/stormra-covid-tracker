import 'dart:typed_data';

import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:covidtracker/src/screens/country_details.dart';
import 'package:covidtracker/src/styles/info_map_window.dart';
import 'package:covidtracker/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../blocs/country_bloc.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'dart:ui' as ui;

class CountryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountryListState();
  }
}

class CountryListState extends State<CountryList> {
  CoronaCaseCountry coronaCaseCountry;
  final Map<String, Marker> _markers = {};
  String mapStyle;
  GoogleMapController mapController;
  BitmapDescriptor mapIcon;
  Attributes selectedAttributes;
  final Location location = Location();
  bool loading = false;

  LocationData locationData;
  String error;
 

 ////// get location function easy way and shot function
  Future<void> _getLocation() async {
    setState(() {
      error = null;
      loading = true;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        locationData = _locationResult;
        loading = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        error = err.code;
        loading = false;
      });
    }
  }
  ///////// set red icon in map
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
   ///////// set custom red icon in map
  setCustomMapPin() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/record.png', 30);
    mapIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  ///initlization map with covid map point
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(mapStyle);
    if (coronaCaseCountry == null) {
      return;
    }

    setState(() {
      _markers.clear();

      coronaCaseCountry.features.forEach((element) {
        // final totalCount = element;
        final title =
            '${element.attributes.provinceState} ${element.attributes.countryRegion}';
        final marker = Marker(
          icon: mapIcon,
          onTap: () {
            setState(() {
              selectedAttributes = element.attributes;
            });
          },
          markerId: MarkerId(title),
          position: LatLng(element.attributes.lat ?? 26.762258,
              element.attributes.long ?? 31.499145),
        );
        _markers[title] = marker;
      });
    });
  }

  @override
  void initState() {
    _getLocation();
    setCustomMapPin();
    selectedAttributes = Attributes();
    /// change map styles to gray style
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
    bloc.fetchAllMovies();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "COVID TRACKER",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: bloc.allConuntry,
        builder: (context, AsyncSnapshot<CoronaCaseCountry> snapshot) {
          //print("snapshot${snapshot.hasError}");
          if (snapshot.hasData) {
            coronaCaseCountry = snapshot.data;
            return Stack(
              children: [
                locationData != null ? GoogleMap(
                  onMapCreated: onMapCreated,
                  //// my location :)
                  initialCameraPosition: CameraPosition(
                    target: LatLng(locationData.latitude ?? 26.762258,
                        locationData.longitude ?? 31.499145),
                    zoom: -50,
                  ),
                  markers: _markers.values.toSet(),
                ) : Container(
                  child: MessageNoData(message: "Some Error Occure",),
                ) ,
                //// pop for show country brief
                InfoMapWindow(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryDetails(
                          selectedAttributes: selectedAttributes,
                        ),
                      ),
                    );
                  },
                  pinPillPosition: 0,
                  selectedAttributes: selectedAttributes,
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return MainLoader();
        },
      ),
    );
  }
}
