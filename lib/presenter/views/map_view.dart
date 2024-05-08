//import 'package:fajma_mobile/presenter/views/home_structure_view.dart';
//import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:medchat/presenter/views/widgets/container_structure_list_view.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:fajma_mobile/constants/apps_theme_config.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:location/location.dart' as Location;
import 'package:medchat/utilities/services/google_maps_services.dart';

import '../../constants/apps_theme_config.dart';

class MapView extends StatefulHookConsumerWidget {
  ConsumerState<ConsumerStatefulWidget> createState() => _mapViewState();
}

class _mapViewState extends ConsumerState<MapView> {
  late GoogleMapController mapController;
  late LatLng _center = LatLng(14.744707336262783, -17.45634013454025);

  GoogleMapServices mapServices = GoogleMapServices();

  //Few exampls of markers
  final Marker _pharmacie1 = Marker(
      markerId: MarkerId('SainteFace'),
      infoWindow: InfoWindow(title: 'Pharmacie Sainte Face'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(14.744707336262783, -17.45634013454025));
  final Marker _pharmarcie2 = Marker(
      markerId: MarkerId('FatouIdeuSy'),
      infoWindow: InfoWindow(title: 'Pharmacie Fatou Ideu Sy'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(14.743608729016927, -17.458915413278735));

  final Marker _pharmarcie3 = Marker(
      markerId: MarkerId('ibrahima'),
      infoWindow: InfoWindow(title: 'Pharmacie Ibrahima'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(14.741656039023445, -17.456360410896846));

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: appsTheme['light'],
            image: DecorationImage(
                image: Image.asset(
                  'assets/images/Whangaehu 1.png',
                ).image,
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcATop))),
      ),
      Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: appsTheme['black'],
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Maps', // Utilisation de l'opérateur de coalescence nulle (??) pour éviter une valeur nulle
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GoogleMap(
              markers: {_pharmacie1, _pharmarcie2, _pharmarcie3},
              onMapCreated: _onMapCreated,
              myLocationEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center as LatLng,
                zoom: 15.0,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 70.0 / 844.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 130.0 / 844.0,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 19.0,
                        ),
                        ContainerStructureListView(
                          border_radius: 16.0,
                          hasText: false,
                          //container_height: Get.height * 115.0 / 844.0,
                          container_width:
                              MediaQuery.of(context).size.width * 304.0 / 390.0,
                        ),
                        SizedBox(
                          width: 19.0,
                        ),
                        ContainerStructureListView(
                          border_radius: 16.0,
                          hasText: false,

                          //container_height: Get.height * 115.0 / 844.0,
                          container_width:
                              MediaQuery.of(context).size.width * 304.0 / 390.0,
                        ),
                        SizedBox(
                          width: 19.0,
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
