import 'dart:async';
import 'package:covidtracker/src/models/corona_case_country.dart';

import 'covid_api_provider.dart';

class Repository {
  final moviesApiProvider = CovidApiProvider();

  Future<CoronaCaseCountry> fetchAllConuntry() => moviesApiProvider.fetchCountryList();


}
