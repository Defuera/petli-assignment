import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:petli_assignment/feature/di.dart';
import 'package:petli_assignment/feature/list/photos_list_screen.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      await DiModule.setup();
      runApp(const App());
    },
    (error, stacktrace) => Logger('main').severe('Error occurred running app', error, stacktrace),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const PhotosListScreen(),
      );
}
