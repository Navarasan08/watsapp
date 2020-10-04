


import 'package:flutter/material.dart';
import 'package:watsapp/src/config/styles.dart';
import 'package:watsapp/src/constants/app_constants.dart';
import 'package:watsapp/src/services/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppTheme.appPrimaryTheme,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
