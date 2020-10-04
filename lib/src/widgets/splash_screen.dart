

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:watsapp/src/constants/my_images.dart';
import 'package:flutter/services.dart';
import 'package:watsapp/src/services/router.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsFlutterBinding.ensureInitialized();
    availableCameras().then((value) {
      cameras = value;
      Navigator.pushReplacementNamed(context, AppRouter.home);
    }).catchError((err) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(MyImages.splash),
    );
  }
}
