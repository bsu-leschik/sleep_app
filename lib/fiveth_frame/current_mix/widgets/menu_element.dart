// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class MenuElement extends StatefulWidget {
//   PageController pageController;
//   MenuElement(this.pageController, {super.key});

//   @override
//   _MenuElementState createState() => _MenuElementState(pageController);
// }

// class _MenuElementState extends State<MenuElement> {
//   PageController _pageController;
//   _MenuElementState(this._pageController);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (() {
//         setState(() {
//           _pageController.jumpToPage(0);
//         });
//       }),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 // width: screenWidth * 0.06,
//                 // height: screenHeight * 0.03,
//                 // constraints: BoxConstraints,
//                 child: Image.asset(
//                   "assets/images/mix.png",
//                   color: Colors.white,
//                 ),
//               ),
//               const Text("1")
//             ],
//           ),
//           const FittedBox(
//             fit: BoxFit.contain,
//             child: Text(
//               "Mix",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   }
// }
