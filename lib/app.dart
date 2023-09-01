import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learn_storage/presentation/screens/home_page.dart';

import 'core/service_locator.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(repository: repository),
    );
  }
}
