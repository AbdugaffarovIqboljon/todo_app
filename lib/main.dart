import 'package:flutter/material.dart';

import 'app.dart';
import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const TodoApp());
}