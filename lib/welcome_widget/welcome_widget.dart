import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../subscription_widget/sub_widget.dart';

void main() {
  return runApp(
    FirstWelcomeWidget(),
  );
}

class FirstWelcomeWidget extends StatelessWidget {
  FirstWelcomeWidget({super.key});
  static const String title = "GoRouter Routes";

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
                const SubscribeWidget(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const PageScreen(),
      ),
    ],
  );
}

class PageScreen extends StatelessWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(FirstWelcomeWidget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => context.go('/page2'),
                  child: const Text('Privacy Police'))
            ],
          ),
        ),
      );
}

class SecondPageScreen extends StatelessWidget {
  const SecondPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(FirstWelcomeWidget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Go Back'))
            ],
          ),
        ),
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
