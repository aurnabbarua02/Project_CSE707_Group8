import 'package:cse707_group8/app.dart';
import 'package:cse707_group8/config/dependency/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection().dependencies();

  runApp(const App());
}
