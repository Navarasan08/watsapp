part of views;

//class CameraScreen extends StatefulWidget {
//  @override
//  _CameraScreenState createState() => _CameraScreenState();
//}
//
//class _CameraScreenState extends State<CameraScreen>
//    with WidgetsBindingObserver {
//  CameraController controller;
//  String imagePath;
//  String videoPath;
//  VideoPlayerController videoController;
//  VoidCallback videoPlayerListener;
//
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
//
//  @override
//  void initState() {
//    super.initState();
//    WidgetsBinding.instance.addObserver(this);
//    controller = CameraController(cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }
//
//  @override
//  void dispose() {
//    controller?.dispose();
//    WidgetsBinding.instance.removeObserver(this);
//    super.dispose();
//  }
//
//  IconData getCameraLensIcon(CameraLensDirection direction) {
//    switch (direction) {
//      case CameraLensDirection.back:
//        return Icons.camera_rear;
//      case CameraLensDirection.front:
//        return Icons.camera_front;
//      case CameraLensDirection.external:
//        return Icons.camera;
//    }
//    throw ArgumentError('Unknown lens direction');
//  }
//
//  void logError(String code, String message) =>
//      print('Error: $code\nError Message: $message');
//
//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    // App state changed before we got the chance to initialize.
//    if (controller == null || !controller.value.isInitialized) {
//      return;
//    }
//    if (state == AppLifecycleState.inactive) {
//      controller?.dispose();
//    } else if (state == AppLifecycleState.resumed) {
//      if (controller != null) {
//        onNewCameraSelected(controller.description);
//      }
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (!controller.value.isInitialized) {
//      return Container();
//    }
//
//    return AspectRatio(
//        aspectRatio: controller.value.aspectRatio,
//        child: Scaffold(
//          key: _scaffoldKey,
//          body: Stack(
//            children: [
//              CameraPreview(controller),
//              Positioned(
//                bottom: 70.0,
//                left: (MediaQuery.of(context).size.width / 2) - 60.0,
//                child: IconButton(
//                  icon: Icon(
//                    Icons.fiber_manual_record,
//                    color: Colors.red,
//                    size: 100.0,
//                  ),
//                  onPressed: controller != null &&
//                      controller.value.isInitialized
//                      ? onTakePictureButtonPressed
//                      : null,
//                ),
//              ),
//              Positioned(
//                bottom: 30.0,
//                right: 30.0,
//                child: IconButton(
//                  icon: Icon(
//                    Icons.repeat,
//                    color: Colors.white,
//                    size: 30.0,
//                  ),
//                  onPressed: () {},
//                ),
//              ),
//            ],
//          ),
//        ));
//  }
//
//  void onNewCameraSelected(CameraDescription cameraDescription) async {
//    if (controller != null) {
//      await controller.dispose();
//    }
//    controller = CameraController(
//      cameraDescription,
//      ResolutionPreset.medium,
//    );
//
//    // If the controller is updated then update the UI.
//    controller.addListener(() {
//      if (mounted) setState(() {});
//      if (controller.value.hasError) {
//        showInSnackBar('Camera error ${controller.value.errorDescription}');
//      }
//    });
//
//    try {
//      await controller.initialize();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//    }
//
//    if (mounted) {
//      setState(() {});
//    }
//  }
//
//  void onTakePictureButtonPressed() {
//    takePicture().then((String filePath) {
//      if (mounted) {
//        setState(() {
//          imagePath = filePath;
//          videoController?.dispose();
//          videoController = null;
//        });
//        if (filePath != null) showInSnackBar('Picture saved to $filePath');
//      }
//    });
//  }
//
//  Future<String> takePicture() async {
//    if (!controller.value.isInitialized) {
//      showInSnackBar('Error: select a camera first.');
//      return null;
//    }
//    final Directory extDir = await getApplicationDocumentsDirectory();
//    final String dirPath = '${extDir.path}/Pictures/flutter_test';
//    await Directory(dirPath).create(recursive: true);
//    final String filePath = '$dirPath/${timestamp()}.jpg';
//
//    if (controller.value.isTakingPicture) {
//      // A capture is already pending, do nothing.
//      return null;
//    }
//
//    try {
//      await controller.takePicture(filePath);
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      return null;
//    }
//    return filePath;
//  }
//
//  void _showCameraException(CameraException e) {
//    logError(e.code, e.description);
//    showInSnackBar('Error: ${e.code}\n${e.description}');
//  }
//
//  void showInSnackBar(String message) {
//    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
//  }
//}

class CameraExampleHome extends StatefulWidget {
  @override
  _CameraExampleHomeState createState() {
    return _CameraExampleHomeState();
  }
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraExampleHomeState extends State<CameraExampleHome>
    with WidgetsBindingObserver {
  CameraController controller;
  String imagePath;
  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller.description);
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      key: _scaffoldKey,
      body: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            CameraPreview(controller),
            Positioned(
              bottom: 70.0,
              left: (MediaQuery.of(context).size.width / 2) - 60.0,
              child: IconButton(
                icon: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 100.0,
                ),
                onPressed: controller != null && controller.value.isInitialized
                    ? onTakePictureButtonPressed
                    : null,
              ),
            ),
            Positioned(
              bottom: 30.0,
              right: 30.0,
              child: IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    final List<Widget> toggles = <Widget>[];

    if (cameras.isEmpty) {
      return const Text('No camera found');
    } else {
      for (CameraDescription cameraDescription in cameras) {
        toggles.add(
          SizedBox(
            width: 90.0,
            child: RadioListTile<CameraDescription>(
              title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
              groupValue: controller?.description,
              value: cameraDescription,
              onChanged: controller != null && controller.value.isRecordingVideo
                  ? null
                  : onNewCameraSelected,
            ),
          ),
        );
      }
    }

    return Row(children: toggles);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: enableAudio,
    );

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          videoController?.dispose();
          videoController = null;
        });
        if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) showInSnackBar('Saving video to $filePath');
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Video recorded to: $videoPath');
    });
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Video recording paused');
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Video recording resumed');
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    await _startVideoPlayer();
  }

  Future<void> pauseVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.pauseVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.resumeVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imagePath = null;
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraExampleHome(),
    );
  }
}

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(CameraApp());
}
