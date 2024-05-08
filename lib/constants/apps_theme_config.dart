import 'package:flutter/material.dart';

/// In this file we declare constants that will be used everywhere in our application

const INTERNET_ICON_ERROR = '';
const INTERNET_MSG_ERROR = 'Impossible de se connecter';

const Map<String, dynamic> appsTheme = {
  "primary": Color.fromRGBO(18, 140, 86, 1),
  "secondary": Color.fromRGBO(18, 140, 86, 0.56),
  "ternary": Color.fromRGBO(72, 152, 117, 1),
  "light": Color.fromRGBO(255, 255, 255, 1),
  "super-light": Color.fromRGBO(218, 236, 228, 1),
  "orange": Color.fromRGBO(236, 160, 13, 1),
  "yellow:": Color.fromRGBO(246, 192, 0, 1),
  "dark": {
    "w50": Color.fromARGB(255, 250, 250, 250),
    "w100": Color.fromARGB(255, 245, 245, 245),
    "w200": Color.fromARGB(255, 238, 238, 238),
    "w300": Color.fromARGB(255, 217, 217, 217),
    "w400": Color.fromARGB(255, 189, 189, 189),
    "w500": Color.fromARGB(255, 158, 158, 158),
    "w550": Color.fromARGB(255, 124, 124, 124),
    "w600": Color.fromARGB(255, 109, 107, 107),
    "w700": Color.fromARGB(255, 97, 97, 97),
    "w800": Color.fromARGB(255, 66, 66, 66),
    "w900": Color.fromARGB(255, 33, 33, 33),
    "w560": Color.fromRGBO(65, 153, 209, 1)
  },
  "black": Color.fromARGB(255, 0, 0, 0),
  "danger": Color.fromARGB(255, 211, 47, 47),
  "red": {"w300": Color.fromARGB(255, 229, 115, 115)},
  "success": {
    "w400": Color.fromARGB(255, 146, 212, 136),
    "w500": Color.fromARGB(255, 80, 180, 65),
    "w600": Color.fromARGB(255, 35, 181, 67)
  },
  //"orange": {"w400": Color.fromARGB(255, 220, 164, 53)},
  "icon": {
    "path": "assets/icons/",
    "size": {
      "default": 24.0,
      "small": 18.0,
    },
    "color": {"primary": Color.fromARGB(255, 33, 33, 33)}
  },
  "text": {
    "size": {
      "title": 0.07,
      "subTitle": 0.050,
      "body": 0.036,
      "small": 0.028,
    },
    "color": Color.fromARGB(255, 33, 33, 33)
  },
  "buttonStyle": {
    "large": {"padding": 16.0},
    "defaultButtonRadius": 8.0,
  },
  "defaultPadding": 16.0,
  "defaultRadius": 10.0,
  "defaultSpace": 8.0,
  "defaultHeight": 0.02,
  "imagePath": 'assets/images/',
  "fixturePath": "lib/fixtures/"
};
