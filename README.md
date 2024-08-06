<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Easy to use
only call widget name

## Features

Animated container supports expansion and collapse with smooth animations and allows you to display text and images inside it.

### Demo Video

Watch the demo video to see the package in action:

[Watch the demo video](https://youtube.com/shorts/MDRjUiyMXVU?si=_n18rUwhZnqzBcKW)

## Getting started

- In the `pubspec.yaml` of your flutter project, add the following dependency:

    ```yaml
    dependencies:
      flexible_animated_container: ^0.0.1
    ```
- In your library add the following import:

    ```dart
    import 'package:flexible_animated_container/flexible_animated_container.dart';
    ```

## Usage

Easy to use
only call widget name

```dart
import 'package:flexible_animated_container/flexible_animated_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  // Keeps track of which item is currently expanded.
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return FlexableAnimatedContainer(
                  pictureDescribeText: Text(
                    'Item $index', // Text displayed in the container.
                    overflow: TextOverflow
                        .ellipsis, // Adds ellipsis if the text overflows.
                    style: const TextStyle(
                      color: Colors.amber, // Text color.
                      fontSize: 20, // Text size.
                    ),
                  ),

                  // In this example we use NetworkImage
                  imageProvider: const NetworkImage(
                    'https://img.freepik.com/free-photo/representation-user-experience-interface-design-smartphone_23-2150165977.jpg?t=st=1722952880~exp=1722956480~hmac=e9c5cdd7e4f91dbc6e0f1bcec2c3f2d2c7e29dbdd17957fd7a7384e01fa20759&w=900', // URL for the image (placeholder).
                  ),
                  isExpanded: expandedIndex ==
                      index, // Determines if the container is expanded.
                  onTap: () {
                    setState(
                      () {
                        // Toggles the expansion of the container when tapped.
                        expandedIndex = expandedIndex == index ? null : index;
                      },
                    );
                  },
                  onDoubleTap: () {
                    // Navigates to SeconedView when the container is double-tapped.
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
      appBar: AppBar(
        title: const Text('Seconed view'), // Title of the AppBar.
      ),
      body: const Center(
        child: Text(
          'Content of the second view', // Placeholder text for the second view.
          style: TextStyle(fontSize: 24), // Style of the placeholder text.
        ),
      ),
    );
  }
}

```

## Important
- You can use onDoubleTap to make any actions you do as onTap is used to expand and collapse container.


## Thanks
- Thank you for using the package ❤❤





