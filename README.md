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
                    'imageUrl',
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
```

## Importnt
- You can use onDOubleTap to make any actions you do as onTap used to expand and collapse container.


## Thanks
- Thank you for using the package ❤❤





