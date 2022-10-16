import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_strategy/url_strategy.dart';
import 'subscription_widget/sub_widget.dart';

void main() {
  setPathUrlStrategy();
  return runApp(const BoardingGoWidget());
}

class BoardingGoWidget extends StatefulWidget {
  const BoardingGoWidget({super.key});
  static const String title = "GoRouter Routes";

  @override
  State<BoardingGoWidget> createState() => _BoardingGoWidgetState();
}

class _BoardingGoWidgetState extends State<BoardingGoWidget> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      );

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'page2',
            builder: (BuildContext context, GoRouterState state) =>
                const PageTwoWidget(),
          ),
          GoRoute(
            path: 'page3',
            builder: (BuildContext context, GoRouterState state) =>
                const PageOneWidget(),
          ),
          GoRoute(
            path: 'page4',
            builder: (BuildContext context, GoRouterState state) =>
                const SubscribeWidget(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const PageOneWidget(),
      ),
    ],
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}

class BoardingWidget extends StatefulWidget {
  const BoardingWidget({super.key});

  @override
  State<BoardingWidget> createState() => _BoardingWidgetState();
}

class _BoardingWidgetState extends State<BoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/shopping/Stars.png',
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Column(
              children: const [
                PageOneWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PageOneWidget extends StatefulWidget {
  const PageOneWidget({super.key});

  @override
  State<PageOneWidget> createState() => _PageOneWidgetState();
}

class _PageOneWidgetState extends State<PageOneWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 240,
          ),
          const Text(
            "Welcome to the\njorney\nto healthy spleep,\nconcentration\nand generalpeace",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.amber,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 224,
          ),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 50, left: 50),
            color: const Color(
              (0xff141733),
            ),
            borderRadius: BorderRadius.circular(45.0),
            onPressed: () => context.go('/page2'),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class PageTwoWidget extends StatefulWidget {
  const PageTwoWidget({super.key});

  @override
  State<PageTwoWidget> createState() => _PageTwoWidgetState();
}

class _PageTwoWidgetState extends State<PageTwoWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 240,
          ),
          const Text(
            "Pick up the right\nsounds from our\ndatabase and save\ntheme to presets",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.amber,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 224,
          ),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 50, left: 50),
            color: const Color(
              (0xff141733),
            ),
            borderRadius: BorderRadius.circular(45.0),
            onPressed: () => context.go('/page3'),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class PageThreeWidget extends StatefulWidget {
  const PageThreeWidget({super.key});

  @override
  State<PageThreeWidget> createState() => _PageThreeWidgetState();
}

class _PageThreeWidgetState extends State<PageThreeWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 240,
          ),
          const Text(
            "Dive into a peasful\ndeeper sleep",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.amber,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 224,
          ),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 50, left: 50),
            color: const Color(
              (0xff141733),
            ),
            borderRadius: BorderRadius.circular(45.0),
            onPressed: () => context.go('/page4'),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 32.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
