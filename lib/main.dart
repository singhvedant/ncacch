import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/DataProvider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/HomeScreen.dart';
import 'pages/SplashScreen.dart';
import 'pages/ResourceScreen.dart';
import 'pages/TabsScreen.dart';
import 'pages/CovidResource.dart';
import "pages/UserPage.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(136, 14, 79, .1),
      100: const Color.fromRGBO(136, 14, 79, .2),
      200: const Color.fromRGBO(136, 14, 79, .3),
      300: const Color.fromRGBO(136, 14, 79, .4),
      400: const Color.fromRGBO(136, 14, 79, .5),
      500: const Color.fromRGBO(136, 14, 79, .6),
      600: const Color.fromRGBO(136, 14, 79, .7),
      700: const Color.fromRGBO(136, 14, 79, .8),
      800: const Color.fromRGBO(136, 14, 79, .9),
      900: const Color.fromRGBO(136, 14, 79, 1),
    };
    final Future<FirebaseApp> initialization = Firebase.initializeApp();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => DataProvider(),
          ),
        ],
        child: FutureBuilder(
          future: initialization,
          builder: (context, appSnapshot) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: MaterialColor(0xff1a1c20, color))
                    .copyWith(secondary: MaterialColor(0xfff9813a, color)),
              ),
              home: appSnapshot.connectionState != ConnectionState.done
                  ? const SplashScreen()
                  : const TabsScreen(),
              routes: {
                HomeScreen.routeName: (ctx) => const HomeScreen(),
                TabsScreen.routeName: (ctx) => const TabsScreen(),
                ResourceScreen.routeName: (ctx) => const ResourceScreen(),
                CovidResource.routeName: (ctx) => const CovidResource(),
                UserPage.routeName: (ctx) => const UserPage(),
              },
            );
          },
        ));
  }
}
