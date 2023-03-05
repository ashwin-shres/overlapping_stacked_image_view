import 'package:flutter/material.dart';
import 'package:overlapping__stacked_image_view/overlapping_stacked_image_view/overlapping_stacked_image_configuration.dart';
import 'package:overlapping__stacked_image_view/overlapping_stacked_image_view/overlapping_stacked_image_view.dart';

import 'overlapping_stacked_image_view/overlapping_stacked_image_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlapping Stacked Image View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Overlapping Stacked Image View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OverlappingStackedImageView(
                items: imageUrls(),
                configuration: const OverlappingStackedImageConfiguration(
                    maxImagesToShow: 5,
                    itemSize: 80,
                    itemBorderWidth: 2,
                    borderColor: Colors.green,
                    flow: OverlappingStackedImageFlow.rightToLeft),
              ),
              const SizedBox(
                height: 30,
              ),
              OverlappingStackedImageView(
                items: imageUrls(),
                configuration: const OverlappingStackedImageConfiguration(
                    maxImagesToShow: 5,
                    itemSize: 80,
                    itemBorderWidth: 2,
                    borderColor: Colors.red,
                    flow: OverlappingStackedImageFlow.leftToRight),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> imageUrls() {
    return [
      "https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      "https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "https://images.unsplash.com/photo-1566753323558-f4e0952af115?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1021&q=80",
      "https://images.unsplash.com/photo-1586716402203-79219bede43c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
      "https://images.unsplash.com/photo-1629444291470-b9ad6e7a88e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1619946794135-5bc917a27793?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
    ];
  }
}
