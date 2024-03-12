import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      // Access camera if permission is granted
    } else if (status.isDenied) {
      // Inform the user that the permission was denied
    } else if (status.isPermanentlyDenied) {
      // Explain how users can grant the permission from device settings
    }
  }

  Future<void> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (status.isGranted) {
      // Access microphone if permission is granted
    } else if (status.isDenied) {
      // Inform the user that the permission was denied
    } else if (status.isPermanentlyDenied) {
      // Explain how users can grant the permission from device settings
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera and Microphone Access'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: requestCameraPermission,
              child: const Text('Request Camera Permission'),
            ),
            ElevatedButton(
              onPressed: requestMicrophonePermission,
              child: const Text('Request Microphone Permission'),
            ),
          ],
        ),
      ),
    );
  }
}
