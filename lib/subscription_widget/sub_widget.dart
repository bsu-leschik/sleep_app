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
              // AboutPremiumWidget(),
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
          const Positioned(
            top: 252,
            right: 89,
            child: WordsWidget(),
          ),
          const Positioned(
            top: 394,
            right: 59,
            child: AboutPremiumWidget(),
          ),
          const Positioned(
            top: 520,
            left: 30,
            child: PayBottonWidget(),
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
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: const [
              Text(
                "Sweet dreams",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                "PREMIUM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutPremiumWidget extends StatelessWidget {
  const AboutPremiumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Image.asset("assets/images/shopping/Corona.png"),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Full acces to the sleep library",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Image.asset("assets/images/shopping/Music.png"),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Relaxing music",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Image.asset("assets/images/shopping/Flower.png"),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Sleep medidations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class PayBottonWidget extends StatefulWidget {
  const PayBottonWidget({super.key});

  @override
  State<PayBottonWidget> createState() => _PayBottonWidgetState();
}

class _PayBottonWidgetState extends State<PayBottonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/shopping/Pay1.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/shopping/Pay2.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/shopping/Pay3.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
