import 'dart:html' as html;

import 'package:flutter/material.dart';
import './responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        OutlineButton(
          child: Text('About'),
          onPressed: () {
            html.window.open("https://about.me/jayvirrathi", "Jayvir");
          },
        ),
        OutlineButton(
          child: Text('Work'),
          onPressed: () {
            html.window
                .open("https://www.linkedin.com/in/jayvirrathi/", "Jayvir");
          },
        ),
        OutlineButton(
          child: Text('Contact'),
          onPressed: () {
            html.window.open("https://www.facebook.com/jayvirrathi", "Jayvir");
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              )
            : null,
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                elevation: 10,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ResponsiveWidget.isSmallScreen(context)
          ? Wrap(
              alignment: ResponsiveWidget.isSmallScreen(context)
                  ? WrapAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LiveDot(),
//          Spacer(),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Row(
                    children: navButtons,
                  )
              ],
            )
          : Row(
              mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LiveDot(),
//          Spacer(),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Row(
                    children: navButtons,
                  )
              ],
            ),
    );
  }
}

class LiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Text(
          "JAYVIR RATHI",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.transparent,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("jayvir.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "JAYVIR RATHI \n",
        textScaleFactor: 3,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Experienced Mobile Application Developer and Full Stack Developer. \n\n"
        "Skilled in Mobile Applications, Cross-Platform (Flutter, React Native),\n Core Java, Android, and JavaScript.\n\n"
        "Strong Engineering Professional with a \nMaster of Science in Information Technology (MSc(IT) ) focused in \nComputer Science & Information Technology \nfrom Dhirubhai Ambani Institute of Information and \nCommunication Technology (DA-IICT), Gandhinagar. \n",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {
              html.window.open("https://about.me/jayvirrathi", "About Me");
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {
              html.window
                  .open("https://www.facebook.com/jayvirrathi", "Jayvir");
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      OutlineButton(
        child: Text('Github'),
        onPressed: () {
          html.window.open("https://github.com/Jayvirrathi", "Git");
        },
        color: Colors.blue,
      ),
      OutlineButton(
        child: Text('Twitter'),
        onPressed: () {
          html.window.open("https://twitter.com/Jayvirrathi", "Twitter");
        },
        color: Colors.blue,
      ),
      OutlineButton(
        child: Text('Facebook'),
        onPressed: () {
          html.window.open("https://www.facebook.com/jayvirrathi", "Fb");
        },
        color: Colors.blue,
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Made with ❤️ in India using Flutter Web by Jayvir Rathi.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
