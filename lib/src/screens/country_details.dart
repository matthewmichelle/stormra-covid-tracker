import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:covidtracker/src/styles/styles.dart';
import 'package:covidtracker/src/styles/styles_values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryDetails extends StatefulWidget {

  Attributes selectedAttributes;


  CountryDetails({this.selectedAttributes});
  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: ChangeTextStyleMedium(
          title: "HH",
          color: primaryDarkColor,
          // fontWeight: FontWeight.w700,
        ),
        leading: arrowBack(),
      ),
      body: Container(),
    );
  }
}
