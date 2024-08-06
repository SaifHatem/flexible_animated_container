import 'package:device_preview/device_preview.dart';
import 'package:flexible_animated_container/flexible_animated_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    //const MyApp(),
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Adjust itemCount based on your data
              itemBuilder: (context, index) {
                return FlexableAnimatedContainer(
                  pictureDescribeText: Text(
                    'Item $index',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.red),
                  ),
                  imageProvider: const NetworkImage(
                    'https://images.unsplash.com/photo-1722185128411-456d36207767?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  isExpanded: expandedIndex == index,
                  onTap: () {
                    setState(
                      () {
                        expandedIndex = expandedIndex == index ? null : index;
                      },
                    );
                  },
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SeconedView();
                    }));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SeconedView extends StatelessWidget {
  const SeconedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        title: const Text('AppBar'),
      ),
    );
  }
}
