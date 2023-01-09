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
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: Stack(
        // alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Image.asset(
            "assets/images/premium/bg4.png",
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          // const Positioned(
          //   top: 320,
          //   right: 50,
          //   left: 50,
          //   child: SweetDreamsPremium(),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                height: 43,
              ),
              CloseButt(),
              MoonSheepCloud(),
              SweetDreamsPremium(), // высота строки 44 должна быть
              PlusPremium(
                image: "assets/images/shopping/Corona.png",
                title: "Full acces to the sleep library",
              ),
              SizedBox(
                height: 20,
              ),
              PlusPremium(
                image: "assets/images/shopping/Music.png",
                title: "Relaxing music",
              ),
              SizedBox(
                height: 20,
              ),
              PlusPremium(
                image: "assets/images/shopping/Flower.png",
                title: "Sleep medidations",
              ),
              SizedBox(
                height: 31,
              ),
              PayButton(),
              SizedBox(
                height: 12,
              ),
              TwoPayButton(
                close: "\$15.99",
                sum: "\$15.99",
                period: "per month",
              ),
              SizedBox(
                height: 12,
              ),
              TwoPayButton(
                close: "\$207.48",
                sum: "\$99.99",
                period: "per year",
              ),
              SizedBox(
                height: 32,
              ),
              BottomPremium(),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class MoonWidget extends StatefulWidget {
//   const MoonWidget({super.key});

//   @override
//   State<MoonWidget> createState() => _MoonWidgetState();
// }

// class _MoonWidgetState extends State<MoonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Stack(
//         children: [
//           Positioned(
//             top: 60,
//             right: 58,
//             child: Image.asset("assets/images/shopping/Sheep.png"),
//           ),
//           Positioned(
//             left: MediaQuery.of(context).size.width / 2 - 126,
//             top: 82,
//             child: Image.asset(
//               "assets/images/shopping/Moon.png",
//               color: Colors.red,
//             ),
//           ),
//           Positioned(
//             top: 197,
//             left: 65,
//             child: Image.asset(
//               "assets/images/shopping/Leftbottomcloud.png",
//             ),
//           ),
//           Positioned(
//             top: 105,
//             right: 0,
//             child: Image.asset("assets/images/shopping/Rightbottomcloud.png"),
//           ),
//           Positioned(
//             top: 103,
//             left: 0,
//             child: Image.asset("assets/images/shopping/Lefttopcloud.png"),
//           ),
          // const Positioned(
          //   top: 252,
          //   right: 89,
          //   child: WordsWidget(),
          // ),
          // const Positioned(
          //   top: 374,
          //   right: 59,
          //   child: AboutPremiumWidget(),
          // ),
          // const Positioned(
          //   top: 500,
          //   left: 30,
          //   child: PayBottonWidget(),
          // ),
          // const Positioned(
          //   top: 700,
          //   right: 37,
          //   child: BottomBarWidget(),
          // )
//         ],
//       ),
//     );
//   }
// }

// class WordsWidget extends StatelessWidget {
//   const WordsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             children: const [
//               Text(
//                 "Sweet dreams",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 33,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           const Text(
//             "PREMIUM",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 33,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AboutPremiumWidget extends StatelessWidget {
//   const AboutPremiumWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               Image.asset("assets/images/shopping/Corona.png"),
//               const SizedBox(
//                 width: 20,
//               ),
//               const Text(
//                 "Full acces to the sleep library",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               Image.asset("assets/images/shopping/Music.png"),
//               const SizedBox(
//                 width: 20,
//               ),
//               const Text(
//                 "Relaxing music",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               Image.asset("assets/images/shopping/Flower.png"),
//               const SizedBox(
//                 width: 20,
//               ),
//               const Text(
//                 "Sleep medidations",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PayBottonWidget extends StatefulWidget {
//   const PayBottonWidget({super.key});

//   @override
//   State<PayBottonWidget> createState() => _PayBottonWidgetState();
// }

// class _PayBottonWidgetState extends State<PayBottonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           OutlinedButton(
//             onPressed: () {},
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/shopping/Pay1.png"),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           OutlinedButton(
//             onPressed: () {},
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/shopping/Pay2.png"),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           OutlinedButton(
//             onPressed: () {},
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/shopping/Pay3.png"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BottomBarWidget extends StatefulWidget {
//   const BottomBarWidget({super.key});

//   @override
//   State<BottomBarWidget> createState() => _BottomBarWidgetState();
// }

// class _BottomBarWidgetState extends State<BottomBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(
//           children: [
//             Tooltip(
//               message: "You have no purchases to restore",
//               child: TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Restore Purchases",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: const [
//             InkWell(
//               // onPressed: () {},
//               // focusNode: FocusNode(
//               //   canRequestFocus: false,
//               //   descendantsAreFocusable: false,
//               //   descendantsAreTraversable: false,
//               // ),
//               child: Text(
//                 "Therms of Use",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Privacy Police",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
