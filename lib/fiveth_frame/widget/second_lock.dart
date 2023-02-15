import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/data.dart';

class GridSecond extends StatelessWidget {
  final String title;
  const GridSecond({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(59),
                    ),
                    border: Border.all(
                      color: const Color(0xff8e9fcc),
                      width: 1,
                    ),
                  ),
                  child: Image.asset("assets/images/Fire.png"),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8E9FCC),
                ),
              ),
              // const BottomBar(),
            ],
          ),
          Positioned(
            top: 0,
            right: screenWidth * 0.05,
            child: SizedBox(
              width: screenWidth * 0.07,
              height: screenHeight * 0.03,
              child: const CircleAvatar(
                backgroundColor: Color(0xFF003293),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.lock,
                    size: 15,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondLock extends StatefulWidget {
  const SecondLock({super.key});

  @override
  State<SecondLock> createState() => _SecondLockState();
}

class _SecondLockState extends State<SecondLock> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<String> locks = [
      "ALL",
      "Favorite",
      "Music",
      "Nature",
      "Urban",
      "Animals",
      "White noise",
      "Home",
      "Baby",
      "Single",
    ];

    // List<MuzModOne> vstavka =
    //     type[context.read<DataLock>().type.values.map((e) => e),];
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.32,
      child: GridView.builder(
        itemCount: locks.length,
        primary: false,
        padding: const EdgeInsets.all(10),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GridSecond(
            title: locks[index],
          );
        },
      ),
    );
  }
}
