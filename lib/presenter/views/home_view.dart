import 'package:medchat/constants/apps_theme_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medchat/presenter/views/widgets/container_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String capitalizeFirstLetter(String name) {
      if (name.isEmpty) {
        return name;
      }

      return name[0].toUpperCase() + name.substring(1);
    }

    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE d MMMM').format(now);

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: appsTheme['light']),
          child: Image.asset(
            'assets/images/Whangaehu 1.png',
            color: Colors.grey,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height * 53) / 844,
                    right: MediaQuery.of(context).size.width * 24.0 / 390,
                    left: MediaQuery.of(context).size.width * 24.0 / 390),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //'Janvier le 16',
                          capitalizeFirstLetter(formattedDate),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: appsTheme['dark']['w800']),
                        ),
                        Text(
                          'Salut, Zahra',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: appsTheme['dark']['w800']),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/Group 150.svg'),
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: (MediaQuery.of(context).size.height * 13.0) / 844.0),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width * 147) /
                                        390,
                                height:
                                    (MediaQuery.of(context).size.height * 164) /
                                        844,
                                decoration: BoxDecoration(
                                    color: appsTheme['dark']['w560'],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Bienvenue',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: appsTheme['light']),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              13 /
                                              390),
                                      child: Text('Hello',
                                          style: TextStyle(
                                              fontSize: 12 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  390,
                                              fontWeight: FontWeight.w400,
                                              color: appsTheme['light'])),
                                    ),
                                  ],
                                )),
                            Container(
                              width: (MediaQuery.of(context).size.width * 147) /
                                  390,
                              height:
                                  (MediaQuery.of(context).size.height * 164) /
                                      844,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.asset(
                                      'assets/images/medical-robot.png',
                                    ).image,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: (((MediaQuery.of(context).size.height *
                                                    164) /
                                                844) *
                                            129) /
                                        164,
                                    left: (((MediaQuery.of(context).size.width *
                                                    147) /
                                                390) *
                                            51) /
                                        147,
                                    right:
                                        (((MediaQuery.of(context).size.width *
                                                        147) /
                                                    390) *
                                                42) /
                                            147),
                                child: Text(
                                  'Dr DAN',
                                  style: TextStyle(
                                      color: appsTheme['light'],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0 *
                                          MediaQuery.of(context).size.width /
                                          390),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 27.0) /
                                    844.0),
                        Text(
                          'Quelques structures',
                          style: TextStyle(
                              color: appsTheme['primary'],
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 16.0) /
                              844.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ContainerListViewWidget(
                                onPressed: () {
                                  Get.toNamed('/login');
                                  //Navigator.pushNamed(context, '/login');
                                },
                                iconName: 'Group 156',
                                containerName: 'Médecins'),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 15.0) /
                                      390.0,
                            ),
                            ContainerListViewWidget(
                                onPressed: () {
                                  Get.toNamed('/home_structure');
                                },
                                iconName: 'Group 157',
                                containerName: 'Pharmacies'),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 15.0) /
                                      390.0,
                            ),
                            ContainerListViewWidget(
                                onPressed: () {
                                  Get.toNamed('/home_structure');
                                },
                                iconName: 'Group-2',
                                containerName: 'Hôpitaux'),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 15.0) /
                                      390.0,
                            ),
                            ContainerListViewWidget(
                                onPressed: () {
                                  Get.toNamed('/home_structure');
                                },
                                iconName: 'Group-3',
                                containerName: 'Cliniques'),
                            const SizedBox(width: 100.0),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 27.0) / 844.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * 24 / 390),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: (MediaQuery.of(context).size.height * 184.0) /
                              844.0,
                          width: (MediaQuery.of(context).size.width * 342.0) /
                              390.0,
                          decoration: BoxDecoration(
                              color: appsTheme['light'],
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 3.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: (MediaQuery.of(context).size.height *
                                        184.0 /
                                        844.0) *
                                    24.0 /
                                    184,
                                left: 24.0,
                                right: 24.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Vous avez des doutes ou des inquiétudes liés à votre santé? Recevez gratuitement le conseil de notre chatbot médical',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontFamily: 'Lexend Deca'),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height:
                                      (((MediaQuery.of(context).size.height *
                                                      184.0) /
                                                  844.0) *
                                              24) /
                                          184,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          292 /
                                          390,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              52 /
                                              844,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.toNamed('/chat');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            backgroundColor: appsTheme['dark']
                                                ['w560'],
                                          ),
                                          child: Text(
                                            'Posez votre question',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: appsTheme['light']),
                                          ))),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: (MediaQuery.of(context).size.height * 19) /
                                844.0),
                        Text(
                          'Actualité',
                          style: TextStyle(
                              color: appsTheme['primary'],
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 13.0) /
                                    844.0),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width * 342) / 390,
                            height: (MediaQuery.of(context).size.height * 195) /
                                844,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Image.asset(
                                    'assets/images/Rectangle 15-2.jpeg',
                                  ).image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(28)),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(255, 255, 255, 0.00),
                                          Color.fromRGBO(144, 144, 144, 0.46),
                                          Color.fromRGBO(33, 33, 33, 0.92),
                                        ],
                                      )),
                                ),
                                Positioned(
                                  bottom:
                                      (((MediaQuery.of(context).size.height *
                                                      195.0) /
                                                  844.0) *
                                              20) /
                                          195.0,
                                  left: (((MediaQuery.of(context).size.width *
                                                  342.0) /
                                              390.0) *
                                          24.0) /
                                      342.0,
                                  right: (((MediaQuery.of(context).size.width *
                                                  342.0) /
                                              390.0) *
                                          90.0) /
                                      342.0,
                                  child: Text(
                                    'Ce que vous devez savoir sur le coeur',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: appsTheme['light'],
                                        fontSize: 19.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 116.0) /
                              844,
                        )
                      ],
                    ),
                  ),
                ],
              )))
            ],
          ),
          extendBody: true,
        )
      ],
    );
  }
}
