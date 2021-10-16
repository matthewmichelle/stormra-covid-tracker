import 'dart:async';
import 'package:covidtracker/src/models/corona_case_country.dart';

import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<CoronaCaseCountry> fetchAllConuntry() => moviesApiProvider.fetchCountryList();


}
