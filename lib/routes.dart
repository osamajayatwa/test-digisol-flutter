import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_digisol_flutter/core/constant/routes.dart';
import 'package:test_digisol_flutter/core/mymiddleware/middleware.dart';
import 'package:test_digisol_flutter/view/screen/Auth/login.dart';
import 'package:test_digisol_flutter/view/screen/home/home.dart';
import 'package:test_digisol_flutter/view/screen/splash/splash.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SplashScreen(),
      middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.splashscreen, page: () => const SplashScreen()),
];
