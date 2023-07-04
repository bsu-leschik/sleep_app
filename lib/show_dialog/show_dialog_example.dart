import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FirstDialog(),
        ),
      ),
    );
  }
}

class FirstDialog extends StatelessWidget {
  const FirstDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Rain"),
              IconButton(
                  onPressed: () => context.pop(), icon: const Icon(Icons.close))
            ],
          ),
          content: const Text(
              'https://Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Hendrerit \net dignissim donec donec neque \ndonec tempor.'),
        ),
      ),
      child: const Icon(Icons.info, size: 52, color: Colors.black),
      // child: Container(
      //   height: 78,
      //   width: 267,
      //   decoration: const BoxDecoration(
      //       color: Colors.black,
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(60), bottomLeft: Radius.circular(60))),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Image.asset(
      //         'assets/images/Heart@1x.png',
      //       ),
      //       const Icon(Icons.info, size: 52, color: Colors.white),
      //       const Icon(Icons.delete_outlined, size: 52, color: Colors.white)
      //     ],
      //   ),
      // ),
    );
  }
}

class SecondDialog extends StatelessWidget {
  const SecondDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 22 / 16,
              ),
            ),
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            )
          ]),
          backgroundColor: Colors.transparent,
          content: const Text(
              "https://Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Hendrerit\net dignissim donec donec neque\ndonec tempor."),
        ),
      ),
      child: Container(
        height: 78,
        width: 267,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), bottomLeft: Radius.circular(60))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/Heart@1x.png',
            ),
            const Icon(Icons.info, size: 52, color: Colors.white),
            const Icon(Icons.delete_outlined, size: 52, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
