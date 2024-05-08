import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medchat/constants/apps_theme_config.dart';
import 'package:medchat/presenter/views/login_view.dart';
import 'package:medchat/presenter/views/presentation_view.dart';
import 'package:medchat/presenter/views/widgets/appbar_widget.dart';

final currentIndex = StateProvider<int>((ref) => 0);

class PresentationLayoutView extends StatefulHookConsumerWidget {
  const PresentationLayoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _presentationLayoutViewState();
}

class _presentationLayoutViewState
    extends ConsumerState<PresentationLayoutView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
        )
      ],
      /* children: [
        Container(
          width: Get.width,
          height: Get.height,
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
                '', // Utilisation de l'opérateur de coalescence nulle (??) pour éviter une valeur nulle
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat'),
              )),
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,

                  //scale: animation,
                  child: child,
                );
              },
              child: Padding(
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
              )),
        )
      ], */
    );
  }
}
