import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safety_app/Presentation/components/app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: title),
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.mic),
              ),
              onTap: () async {
                PermissionStatus microphoneStatus =
                    await Permission.microphone.request();

                if (microphoneStatus == PermissionStatus.granted) {}
                if (microphoneStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("this permission is recommened")));
                }
                if (microphoneStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }
              },
              title: const Text("mic permission"),
              subtitle: Text("status of permission: "),
            ),

            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.camera),
              ),
              onTap: () async {
                PermissionStatus cameraStatus =
                    await Permission.camera.request();

                if (cameraStatus == PermissionStatus.granted) {}
                if (cameraStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("this permission is recommened")));
                }
                if (cameraStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }
              },
              title: const Text("camera permission"),
              subtitle: Text("status of permission : "),
            ),

            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.folder),
              ),
              title: const Text("folder permission"),
              subtitle: Text("status of permission: "),
              onTap: () async {
                PermissionStatus storageStatus =
                    await Permission.storage.request();

                if (storageStatus == PermissionStatus.granted) {}
                if (storageStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("this permission is recommened")));
                }
                if (storageStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }
              },
            ),

            // new buttons to be  added here.....
          ],
        ),
      ),
    );
  }
}



/// Get from gallery



