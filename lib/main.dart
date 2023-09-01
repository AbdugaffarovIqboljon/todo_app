import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await serviceLocator();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('en', 'US'),
      child: const TodoApp(),
    ),
  );
}
