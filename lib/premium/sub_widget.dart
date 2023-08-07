import 'package:flutter/material.dart';
import '../../premium/widget/close_button.dart';
import 'widget/bottom_prem.dart';
import 'widget/moon_sheep_cloud.dart';
import 'widget/pay_button.dart';
import 'widget/plus_premium.dart';
import 'widget/sweet_dreams_premium.dart';

class SubscribeWidget extends StatefulWidget {
  const SubscribeWidget({Key? key}) : super(key: key);

  @override
  State<SubscribeWidget> createState() => _SubscribeWidgetState();
}

class _SubscribeWidgetState extends State<SubscribeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff141733),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/premium/background.png",
                ),
                fit: BoxFit.cover),
          ),
          child: const Stack(
            children: [
              MoonSheepCloud(),
              Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 28,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 21,
                    child: Align(
                        alignment:
                            Alignment(360 / 390 * 2 - 1, 28 / 844 * 2 - 1),
                        child: CloseButt()),
                  ),
                  Expanded(
                    flex: 157,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 98,
                    child: SweetDreamsPremium(),
                  ),
                  Expanded(
                    flex: 36,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 115,
                    child: Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: PlusPremium(),
                    ),
                  ),
                  Expanded(
                    flex: 29,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 198,
                    child: PayButton(),
                  ),
                  Expanded(
                    flex: 47,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 16,
                    child: BottomPremium(),
                  ),
                  Expanded(
                    flex: 30,
                    child: SizedBox(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
