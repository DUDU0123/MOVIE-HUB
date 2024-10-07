import 'package:flutter/material.dart';
import 'package:movie_hub/core/service_locator/service_locator.dart';
import 'package:movie_hub/features/root_widget_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
   const RootWidgetPage(
    ),
  );
}

