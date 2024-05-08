import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medchat/constants/apps_theme_config.dart';
import 'package:flutter_svg/svg.dart';

class ContainerStructureListView extends StatelessWidget {
  const ContainerStructureListView({
    super.key,
    this.hasText = true,
    //this.container_height,
    this.container_width,
    this.border_radius = 6.0,
  });
  final bool hasText;
  final double? container_width;
  //final double? container_height;
  final double border_radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/details');
      },
      child: Container(
        width: container_width, //Get.width * 380.0 / 390.0,
        //height: container_height, //Get.height * 191.0 / 844.0,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 9.0,
                spreadRadius: 2.0,
                //offset: Offset(0, 0),
              )
            ],
            color: appsTheme['light'],
            borderRadius: BorderRadius.circular(border_radius)),
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 20.0 / 390.0,
              right: MediaQuery.of(context).size.width * 20.0 / 390.0,
              top: MediaQuery.of(context).size.height *
                  9.0 /
                  844.0) /* EdgeInsets.symmetric(
              horizontal: Get.width * 20.0 / 390.0,
              vertical: Get.height * 9.0 / 844.0) */
          ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/images/doctor_arms.png',
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 7.0 / 390.0),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hopital Dalal Jaam',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat'),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                10.0 /
                                844.0,
                          ),
                          const Text('Hopital Généraliste',
                              style: TextStyle(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat'))
                        ]),
                  ]),
                  Visibility(
                    child: SvgPicture.asset('assets/icons/arrows.svg'),
                    visible: !hasText,
                  )
                ],
              ),
              if (hasText)
                SizedBox(
                    height: MediaQuery.of(context).size.height * 10.0 / 844.0),
              if (hasText)
                const Text(
                  'Lorem ipsum dolor sit amet. Qui ipsum galisum est ullam repudiandae ea maxime deserunt. Id dolore velit ex molestiae mollitia.',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Montserrat'),
                ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 8.0 / 390,
                    ),
                    const Text(
                      'Guédiawaye, Dakar-Sénégal',
                      style: TextStyle(
                          fontSize: 9.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  Container(
                    decoration: BoxDecoration(
                        color: appsTheme['super-light'],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: appsTheme['defaultPadding'] - 8,
                          vertical: appsTheme['defaultPadding'] - 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            height: MediaQuery.of(context).size.height *
                                14.0 /
                                844.0,
                            width: MediaQuery.of(context).size.width *
                                13.0 /
                                390.0,
                          ),
                          Text(
                            'Ouvert',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    9.0 /
                                    390,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
