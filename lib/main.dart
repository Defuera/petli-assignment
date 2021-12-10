import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:petli_assignment/feature/di.dart';
import 'package:petli_assignment/feature/list/images_list_screen.dart';

const expiredId = '6289a7bb-a1a8-40d5-bed1-bff3a5f62ee6';
const validId = '092cc8ac-5e12-4654-8fed-1bcfe802771d';

// 1. Home assignment. Create the following Flutter app:
// A) Create Infinite scroll list with images ( use https://jsonplaceholder.typicode.com photos as API source)
// B) Each image in the list has a Title, an image Preview and a Like button
// C) By tapping on a Preview image user is shown a full-sized Image in a popup
// D) User can like and unlike Images by tapping Like button
// E) Like state persist between app launches
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
