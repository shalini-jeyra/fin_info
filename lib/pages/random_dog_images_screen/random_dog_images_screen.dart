


import 'package:fin_info/services/services.dart';
import 'package:flutter/material.dart';

class RandomDogImagesScreen extends StatefulWidget {
  const RandomDogImagesScreen({super.key});

  @override
  _RandomDogImagesScreenState createState() => _RandomDogImagesScreenState();
}

class _RandomDogImagesScreenState extends State<RandomDogImagesScreen> {
 late Future<String> _randomImageUrlFuture;

  @override
  void initState() {
    super.initState();
     _randomImageUrlFuture =ApiService(). fetchRandomImageUrl();
  }
 void _refreshRandomImage() {
    setState(() {
      _randomImageUrlFuture = ApiService(). fetchRandomImageUrl();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: _randomImageUrlFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final imageUrl = snapshot.data;
                  return Column(
                    children: [
                      Image.network(
                        imageUrl!,
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _refreshRandomImage,
                        child: const Text('Refresh'),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
