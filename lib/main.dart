import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/Binding/intialbinding.dart';
import 'package:test_digisol_flutter/core/services/services.dart';
import 'package:test_digisol_flutter/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digisol Test',
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
