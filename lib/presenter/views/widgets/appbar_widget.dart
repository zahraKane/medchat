/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medchat/constants/apps_theme_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar appBarWidegt(String title) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: appsTheme['black'],
    ),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ??
          '', // Utilisation de l'opérateur de coalescence nulle (??) pour éviter une valeur nulle
      style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
    ),
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: SvgPicture.asset('assets/icons/Arrow_back.svg'),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      )
    ],
  );
}
 */