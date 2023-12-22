import 'package:chatkhuldi/app/controllers/auth_controller.dart';
import 'package:chatkhuldi/app/utils/error_page.dart';
import 'package:chatkhuldi/app/utils/loading_page.dart';
import 'package:chatkhuldi/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorPage();

          if (snapshot.connectionState == ConnectionState.done) {
            // return const SplashScreen();
            return GetMaterialApp(
              title: 'chatapp',
              initialRoute: Routes.LOGIN,
              getPages: AppPages.routes,
            );
            
            return FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(() => GetMaterialApp(
                          title: "Chat App",
                          initialRoute: authC.isSkipIntro.isTrue
                              ? authC.isAuth.isTrue
                                  ? Routes.HOME
                                  : Routes.LOGIN
                              : Routes.INTRODUCTION,
                          getPages: AppPages.routes,
                        ));
                  }
                  return const SplashScreen();
                });
          }

          return LoadingPage();
        });
  }
}
