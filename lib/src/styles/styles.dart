
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidtracker/src/styles/styles_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' as flutt;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChangeTextStyleMainMajor extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;

  ChangeTextStyleMainMajor(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        style: TextStyle(
          
          fontFamily: 'Montserrat',
          color: color,
          fontSize: mainMajorTextSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
        ));
  }
}

class ChangeTextStyleMajor extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  ChangeTextStyleMajor(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: color,
          fontSize: majorTextSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
        ));
  }
}

class ChangeTextStyleLarge extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  ChangeTextStyleLarge(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: largeTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class ChangeTextStyleMedium extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;
  ChangeTextStyleMedium(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        maxLines: maxLine,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: mediumTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class ChangeTextStyleSmall extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;

  ChangeTextStyleSmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        maxLines: maxLine,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: smallTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class ChangeTextStyleXSmall extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;
  ChangeTextStyleXSmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        maxLines: this.maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: xSmallTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class ChangeTextStyleTinySmall extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;
  ChangeTextStyleTinySmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        maxLines: this.maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: tinySmallTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class ChangeTextStyleXTinySmall extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLine;
  ChangeTextStyleXTinySmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: textAlign,
        maxLines: this.maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: color,
            fontSize: tinySmallTextSize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}

class HomeTitleSection extends StatelessWidget {
  const HomeTitleSection({@required this.title, this.onPressed, this.seeAll});

  final String title;
  final Function onPressed;
  final bool seeAll;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChangeTextStyleLarge(
              title: title,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
            Visibility(
              visible: seeAll == null ? true : false,
              child: ChangeTextStyleMedium(
                title: "See All",
                color: primaryDarkColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainLoader extends StatefulWidget {
  const MainLoader({
    Key key,
  }) : super(key: key);

  @override
  _MainLoaderState createState() => _MainLoaderState();
}

class _MainLoaderState extends State<MainLoader> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(8.0),
            child: Image.asset("assets/corona_virus.png")
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageNet extends StatelessWidget {
  ImageNet({this.imageUrl});
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class NoInternetConnection extends StatelessWidget {
  NoInternetConnection({
    this.onRefresh,
  });

  Function onRefresh;

  @override
  Widget build(BuildContext context) {
    var dataSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: dataSize.width,
        color: whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              flutt.FlutterIcons.wifi_off_fea,
              size: 100,
              color: primaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            ChangeTextStyleLarge(
              title: "No Internet Connections",
              color: primaryDarkColor,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 100,
              child: PrimaryButton(
                color: primaryColor,
                onTap: onRefresh,
                title: "Refresh",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({@required this.title, this.onTap, this.color});

  final String title;
  final Function onTap;
  final Color color;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color),
          ),
        ),
      ),
      child: Container(
        child: Center(
          child: ChangeTextStyleMedium(
            title: widget.title,
            color: widget.color,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              width: 2.0, color: widget.color, style: BorderStyle.solid),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class ArrowBack extends StatelessWidget {
//   arrowBack({arrowBack});
// Color arrowColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        flutt.MaterialCommunityIcons.arrow_left,
        color: primaryDarkColor,
        size: 25,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}


class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {@required this.title,
      this.titleColor,
      this.onTap,
      this.color,
      this.reduis,
      this.fontWeight});

  final String title;
  final Color titleColor;
  final Function onTap;
  final Color color;
  final FontWeight fontWeight;
  final double reduis;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color),
          ),
        ),
      ),
      child: Container(
        child: Center(
          child: ChangeTextStyleMedium(
            title: widget.title,
            color: widget.titleColor == null ? whiteColor : widget.titleColor,
            fontWeight: widget.fontWeight == null
                ? FontWeight.normal
                : widget.fontWeight,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.reduis == null ? 5 : widget.reduis),
          ),
        ),
      ),
    );
  }
}

class MessageNoData extends StatelessWidget {
  MessageNoData({this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              flutt.FlutterIcons.database_lock_mco,
              color: primaryDarkColor,
              size: 60,
            ),
            SizedBox(
              height: 20,
            ),
            ChangeTextStyleMedium(
              textAlign: TextAlign.center,
              title: message,
              color: grayColor,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class arrowBack extends StatelessWidget {
//   arrowBack({arrowBack});
// Color arrowColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        flutt.MaterialCommunityIcons.arrow_left,
        color: primaryDarkColor,
        size: 25,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}