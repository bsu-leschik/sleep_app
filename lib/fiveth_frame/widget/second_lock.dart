import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/data_fiveth.dart';

class GridSecond extends StatefulWidget {
  final String title;

  final bool activeTap;
  const GridSecond({
    super.key,
    required this.title,
    required this.activeTap,
  });

  @override
  State<GridSecond> createState() => _GridSecondState();
}

class _GridSecondState extends State<GridSecond> {
  // Color _ContainerColor = Colors.transparent;
  // Color(0xFF9747FF);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    debugPrint(widget.activeTap.toString());
    return Stack(
      children: [
        Column(
          children: [
            Center(
              child: InkWell(
                // onTap: () {
                //   setState(() {
                //     widget.activeTap = !widget.activeTap;
                //   });
                //   print("object12");
                // },
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    color: widget.activeTap ? Colors.red : Colors.amber,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(59),
                    ),
                    border: Border.all(
                      color: const Color(0xFF8E9FCC),
                      // const Color(0xff8e9fcc),
                      width: 1,
                    ),
                  ),
                  child: Image.asset("assets/images/Fire.png"),
                ),
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF8E9FCC),
              ),
            ),
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
    );
  }
}

class SecondLock extends StatefulWidget {
  // final ValueChanged<bool> onSelected;
  // final String title;
  const SecondLock({
    super.key,
    // required this.onSelected,
    // required this.title,
  });

  @override
  State<SecondLock> createState() => _SecondLockState();
}

class _SecondLockState extends State<SecondLock> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.32,
      child: GridView.builder(
          itemCount: secondList.length,
          // context.read<DataTypeList>().allList[current].length,
          primary: false,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  secondList[index].isSelected = !secondList[index].isSelected;
                  debugPrint("object 111");
                });
              },
              child: GridSecond(
                activeTap: secondList[index].isSelected,
                title: secondList[index].title,
                // context.read<DataTypeList>().allList[current][index],
              ),
            );
          }),
    );
  }
}

// int checkedIndex = 0;

// List cardNames = [
//   'Sports',
//   'Wild Life',
//   'Night',
//   'LandSpace',
// ];

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: GridView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: cardNames.length,
//       itemBuilder: (BuildContext context, int index) {
//         return buildCard(index);
//       },
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//     ),
//   );
// }

// Widget buildCard(int index) {
//   bool checked = index == checkedIndex;
//   String name = cardNames[index];
//   return GestureDetector(
//     onTap: () {
//       setState(() {
//         checkedIndex = index;
//       });
//     },
//     child: Stack(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Card(
//             color: checked ? Colors.orange : Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Container(
//               child: Center(child: Text(name)),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 12,
//           right: 12,
//           child: Offstage(
//             offstage: !checked,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(width: 2),
//                   shape: BoxShape.circle),
//               child: Icon(
//                 Icons.check,
//                 color: Colors.green,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
