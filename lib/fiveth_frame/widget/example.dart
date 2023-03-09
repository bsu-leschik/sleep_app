import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_type.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TabBarTypeMusic>(
            create: (context) => TabBarTypeMusic())
      ],
      child: const MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: context.read<TabBarTypeMusic>().scafbar.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
            controller: _tabController,
            tabs: context.watch<TabBarTypeMusic>().tabBar),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TabBarView(
            controller: _tabController,
            children: context.watch<TabBarTypeMusic>().scafbar),
      ),
    );
  }
}
