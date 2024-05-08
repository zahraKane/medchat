import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medchat/presenter/views/Layout/presentation_layout.dart';
import 'package:medchat/presenter/views/login_view.dart';
import 'package:medchat/presenter/views/presentation.dart';
import 'package:medchat/presenter/views/presentation_view.dart';

final routerNoParamsProvider =
    Provider<Map<String, Widget Function(BuildContext)>>((ref) {
  return {
    "/login": (context) => LoginPage(),
    "/presentation": (context) => Presentation()
  };
});

final routerWithParamsProvider =
    Provider.family((ref, RouteSettings settings) {});
