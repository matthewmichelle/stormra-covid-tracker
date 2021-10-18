import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:covidtracker/src/styles/styles.dart';
import 'package:covidtracker/src/styles/styles_values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CountryDetails extends StatefulWidget {
  Attributes selectedAttributes;

  CountryDetails({this.selectedAttributes});
  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: ChangeTextStyleMedium(
          title: "${widget.selectedAttributes.countryRegion ?? ""}",
          color: primaryDarkColor,
          // fontWeight: FontWeight.w700,
        ),
        leading: arrowBack(),
      ),
      body: Stack(
        children: <Widget>[
          //Country Details
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Flag and Name and More

                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    child: ImageNet(
                      imageUrl:
                          "http://www.geognos.com/api/en/countries/flag/${(widget.selectedAttributes.countryRegion == null ? 'EG' : widget.selectedAttributes.countryRegion.substring(0, 2)).toUpperCase()}.png",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )

                  //Number of Cases
                ],
              ),
            ),
          ),

          //White Details Card
          Positioned(
            top: 150,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  resultDataCases("Total Cases :",
                      widget.selectedAttributes.lastUpdate ?? 0, primaryDarkColor),
                      SizedBox(height: 20,),
                  resultDataCases("Total Deaths :",
                      widget.selectedAttributes.deaths ?? 0, dangerColor),
                      SizedBox(height: 20,),
                  resultDataCases("Total Recovered :",
                      widget.selectedAttributes.recovered ?? 0, successColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row resultDataCases(String title, int value, Color titleColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChangeTextStyleLarge(
          title: title,
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
        AutoSizeText(
          formatter.format(value),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            color: primaryDarkColor,
            fontSize: mediumTextSize,
            letterSpacing: 1.1,
            fontWeight: FontWeight.normal,
          ),
          maxFontSize: mediumTextSize,
        ),
      ],
    );
  }
}
