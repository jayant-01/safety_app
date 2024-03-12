import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppPermissionManagement {
  Future<void> openAppSettings(BuildContext context) async {
    // Replace with the appropriate URL scheme based on the device's OS
    final appSettingsUrl = 'app-settings://';
    if (await canLaunch(appSettingsUrl)) {
      await launch(appSettingsUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open app settings'),
        ),
      );
    }
  }

  Future<void> openOsSettings(BuildContext context) async {
    // Replace with the correct URL scheme for the OS's permission management page
    final osSettingsUrl = 'https://example.com/permissions';
    if (await canLaunch(osSettingsUrl)) {
      await launch(osSettingsUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open OS settings'),
        ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Permission Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => AppPermissionManagement().openAppSettings(context),
                child: const Text('Open App Settings'),
              ),
              ElevatedButton(
                onPressed: () => AppPermissionManagement().openOsSettings(context),
                child: const Text('Open OS Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
