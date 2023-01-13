import 'package:flutter/material.dart';

import 'widget/bar_widget.dart';
import 'widget/category_toogle.dart';
import 'widget/first_lock.dart';

class FivethFrame extends StatefulWidget {
  const FivethFrame({super.key});

  @override
  State<FivethFrame> createState() => _FivethFrameState();
}

class _FivethFrameState extends State<FivethFrame> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Column(
        children: [
          const BarWidget(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          const TypeMusic(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          FirstLock()
        ],
      ),
    );
  }
}
