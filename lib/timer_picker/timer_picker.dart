import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text("AlertDialog Sample")),
        body: const Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          titlePadding: const EdgeInsets.all(10),
          backgroundColor: const Color(0xFF01308C),
          title: Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(5),
            // color: Colors.red,
            child: InkWell(
              // alignment: Alignment.topRight,
              // color: const Color(0xFFFFFFFF),
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            ),
          ),
          content: const Text("AlertDialog description"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, "Cancel"),
              child: const Text("Cancel", style: TextStyle()),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, "OK"),
              child: const Text("OK"),
            ),
          ],
        ),
      ),
      child: const Text("Show Dialog"),
    );
  }
}
