import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption:
        'Fugiat aliquip esse ea reprehenderit excepteur ea tempor aliqua enim aute ea veniam sint reprehenderit. Et incididunt ipsum occaecat occaecat. Voluptate cupidatat ad non sunt ea ea duis reprehenderit et consectetur. Sit aliqua sit dolore elit sint sint mollit tempor aliquip duis. Commodo dolor aliqua mollit ut irure eiusmod sit magna do mollit aliquip et sunt voluptate. Reprehenderit ut nostrud amet tempor voluptate reprehenderit fugiat. Exercitation mollit cillum deserunt labore dolore exercitation laboris cupidatat deserunt do sit consectetur sint.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega la comida',
    caption:
        'Proident mollit deserunt occaecat occaecat do fugiat excepteur aliqua culpa. Sunt sit fugiat pariatur deserunt ex. Ex cupidatat laborum quis occaecat qui aliqua exercitation.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Reprehenderit do sit excepteur eu duis fugiat minim cupidatat proident. Adipisicing deserunt fugiat Lorem occaecat. Lorem non cupidatat aliquip officia non nostrud pariatur.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      final lastPageIndex = slides.length - 1;
      final newEndReached = page >= lastPageIndex;
      if (endReached != newEndReached) {
        setState(() {
          endReached = newEndReached;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),

          if (endReached)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}