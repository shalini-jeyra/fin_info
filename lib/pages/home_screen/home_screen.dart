import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RandomDogImagesScreen(),
                  ),
                );
              },
              child: const Text('Random Dog Images'),
            ),
            ElevatedButton(
              onPressed: () {
                enableBluetooth();
              },
              child: const Text('Enable Bluetooth'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> enableBluetooth() async {
    const platform = MethodChannel('your_channel_name');
    try {
      await platform.invokeMethod('enableBluetooth');
    } on PlatformException catch (e) {
      print('Failed to enable Bluetooth: ${e.message}');
    }
  }
}
