import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:covidtracker/src/styles/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoMapWindow extends StatefulWidget {
  double pinPillPosition;
  Attributes selectedAttributes;
  Function onTap;

  InfoMapWindow({this.pinPillPosition, this.selectedAttributes, this.onTap});

  @override
  State<StatefulWidget> createState() => InfoMapWindowState();
}

class InfoMapWindowState extends State<InfoMapWindow> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.selectedAttributes.countryRegion == null ? false : true,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset.zero,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  child: ImageNet(
                    imageUrl:
                        "https://www.countryflags.io/${widget.selectedAttributes.countryRegion == null ? 'eg' : widget.selectedAttributes.countryRegion.substring(0, 2)}/flat/64.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ChangeTextStyleLarge(
                          title:
                              "${widget.selectedAttributes.countryRegion ?? ""}",
                          fontWeight: FontWeight.bold,
                        ),
                        ChangeTextStyleMedium(
                          title:
                              "Latitude : ${widget.selectedAttributes.lat ?? ""}",
                          fontWeight: FontWeight.w400,
                        ),
                        ChangeTextStyleMedium(
                          title:
                              "Longitude : ${widget.selectedAttributes.long ?? ""}",
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
