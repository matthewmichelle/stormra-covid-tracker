import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:covidtracker/src/resources/exceptions.dart';
import 'package:http/http.dart' show Client, Response;

class MovieApiProvider {
  Client client = Client();
  Future<CoronaCaseCountry> fetchCountryList() async {
    try {
      Response response;
      response = await client
          .get(
              "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/1/query?f=json&where=(Confirmed%3E%200)%20OR%20(Deaths%3E0)%20OR%20(Recovered%3E0)&returnGeometry=false&spatialRef=esriSpatialRelIntersects&outFields=*&orderByFields=Country_Region%20asc,Province_State%20asc&resultOffset=0&resultRecordCount=250&cacheHint=false")
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        
        // If the call to the server was successful, parse the JSON
        return CoronaCaseCountry.fromJson(json.decode(response.body));
      } else {
        // If that call was not successful, throw an error.
        throw FetchDataException('Failed to load post');
      }
    } on SocketException {
      //return CoronaCaseCountry();
      throw FetchDataException('No Internet connection');
    }
  }
}
