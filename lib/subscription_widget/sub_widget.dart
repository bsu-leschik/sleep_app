import 'package:flutter/material.dart';

class SubscribeWidget extends StatefulWidget {
  const SubscribeWidget({Key? key}) : super(key: key);

  @override
  State<SubscribeWidget> createState() => _SubscribeWidgetState();
}

class _SubscribeWidgetState extends State<SubscribeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/shopping/Stars.png",
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Column(
            children: const [
              CloseButton(),
              MoonWidget(),
              WordsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.only(right: 10, top: 25),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => null,
        ));
  }
}

class MoonWidget extends StatefulWidget {
  const MoonWidget({super.key});

  @override
  State<MoonWidget> createState() => _MoonWidgetState();
}

class _MoonWidgetState extends State<MoonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Positioned(
            top: 105,
            right: 58,
            child: Image.asset("assets/images/shopping/Sheep.png"),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 126,
            top: 82,
            child: Image.asset(
              "assets/images/shopping/Moon.png",
              // color: Colors.red,
            ),
          ),
          Positioned(
            top: 197,
            left: 65,
            child: Image.asset(
              "assets/images/shopping/Leftbottomcloud.png",
            ),
          ),
          Positioned(
            top: 105,
            right: 0,
            child: Image.asset("assets/images/shopping/Rightbottomcloud.png"),
          ),
          Positioned(
            top: 103,
            left: 0,
            child: Image.asset("assets/images/shopping/Lefttopcloud.png"),
          ),
        ],
      ),
    );
  }
}

class WordsWidget extends StatelessWidget {
  const WordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // color: Colors.red,
        alignment: Alignment.bottomCenter,
        child: Column(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Sweet dreams",
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "PREMIUM",
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    );
  }
}
