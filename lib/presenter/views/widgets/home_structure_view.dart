import 'dart:async';

//import 'package:fajma_mobile/presenter/widgets/appbar_widget.dart';
import 'package:medchat/presenter/views/widgets/container_listview_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medchat/constants/apps_theme_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medchat/presenter/views/widgets/container_structure_list_view.dart';

final currentLocation = StateProvider<Position?>((ref) => null);

class HomeStrcutureView extends StatefulHookConsumerWidget {
  const HomeStrcutureView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _homeStrcutureViewState();
}

class _homeStrcutureViewState extends ConsumerState<HomeStrcutureView> {
  /*  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }
    ref.watch(currentLocation.notifier).state ==
        Geolocator.getCurrentPosition();
    return await ref.watch(currentLocation as ProviderListenable<
        FutureOr<Position>>); //Geolocator.getCurrentPosition();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hopital Dalal Jamm'),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(color: appsTheme['light']),
              child: Image.asset(
                'assets/images/Whangaehu 1.png',
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.0,
                left: 15.0,
                right: 15.0,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nos hôpitaux partenaires',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextButton(
                        child: Text('Tout voir ',
                            style: TextStyle(
                                color: appsTheme['primary'],
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat')),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 200 / 844,
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ContainerStructureListView(
                            //container_height: Get.height * 163.0 / 844.0,
                            container_width: Get.width * 353.0 / 390.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ContainerStructureListView(
                            //container_height: Get.height * 163.0 / 844.0,
                            container_width: Get.width * 353.0 / 390.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: Get.height * 6.0 / 844.0,
                        width: Get.width * 25 / 390,
                        decoration: BoxDecoration(
                            color: appsTheme['primary'],
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: Get.width * 8.0 / 390,
                      ),
                      Container(
                        height: Get.height * 6.0 / 844.0,
                        width: Get.width * 25 / 390,
                        decoration: BoxDecoration(
                            color: appsTheme['dark']['w400'],
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 35.0 / 844.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hôpitaux autour de vous',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextButton(
                        child: Text('Tout voir ',
                            style: TextStyle(
                                color: appsTheme['primary'],
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat')),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            //getCurrentLocation();
            Get.toNamed('/map');
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.31),
                    blurRadius: 26.0,
                    offset: Offset(0, 4),
                  )
                ],
                color: appsTheme['primary'],
                borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 10.0 / 390.0,
                  vertical: Get.height * 10.0 / 844.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/map.svg',
                    height: Get.height * 14.0 / 844.0,
                    width: Get.width * 14.0 / 390.0,
                  ),
                  SizedBox(width: Get.width * 0.008),
                  Text(
                    'Voir la carte',
                    style: TextStyle(
                        fontSize: Get.width * 15.0 / 390.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: appsTheme['light']),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
