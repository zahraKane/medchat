// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContainerListViewWidget extends StatelessWidget {
  ContainerListViewWidget(
      {super.key,
      this.containerName = '',
      this.iconName = '',
      required this.onPressed});
  final String iconName;
  final Function() onPressed;
  final String containerName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 1 / 844),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          //height: 84,
          width: (MediaQuery.of(context).size.width * 84) / 390,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical:
                    (((MediaQuery.of(context).size.height * 100) / 844) * 14) /
                        107),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/$iconName.svg',
                  height:
                      MediaQuery.of(context).size.height * 84 / 844 * 32 / 84,
                  width:
                      (MediaQuery.of(context).size.width * 84) / 390 * 23 / 100,
                ),
                Text(
                  containerName,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ((MediaQuery.of(context).size.width * 84) /
                          390 *
                          11.0 /
                          100.0)),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 3.0,
              spreadRadius: 2.0,
              //offset: Offset(0, 0),
            )
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
