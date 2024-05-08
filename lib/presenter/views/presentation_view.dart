/* //import 'package:fajma_mobile/presenter/widgets/appbar_widget.dart';
import 'package:medchat/presenter/views/Layout/presentation_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medchat/constants/apps_theme_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class Presentation extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _presentationState();
}

class _presentationState extends ConsumerState<Presentation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 29.0, horizontal: 30.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/doctor.gif',
          ),
          Container(
            height: Get.height * 46.0 / 844.0,
            width: Get.width * 262.0 / 390.0,
            child: Text(
              'Vous n\'avez pas encore réalisé de consultation chez Fajma',
              style: TextStyle(
                  fontSize: Get.height * 15.0 / 844.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: Get.height * 72.0 / 844.0,
            width: Get.width * 315.0 / 390.0,
            child: Text(
              'Vous pouvez dès maintenant prendre rendez-vous avec un professionnel de santé ou rechercher directement une spécialité spécifique',
              style: TextStyle(
                  fontSize: Get.height * 12.0 / 844.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
              height: Get.height * 55.0 / 844.0,
              width: Get.width * 221 / 390.0,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login');
                    ref.watch(currentIndex.notifier).state = 1;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    elevation: 0,
                    side: BorderSide(color: appsTheme['primary']),
                    backgroundColor: appsTheme['light'],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset('assets/icons/calendar.svg'),
                      Text(
                        'Prendre un rendez-vous',
                        style: TextStyle(
                            fontSize: Get.width * 12.0 / 390.0,
                            color: appsTheme['primary'],
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
 */