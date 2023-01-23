import 'package:flutter/material.dart';

import '../../fiveth_frame/widget/bottom_bar.dart';

class CloseButt extends StatelessWidget {
  const CloseButt({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.close,
        color: Color(0xFFFFFFFF),
        size: 20,
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        )
      },
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../subscription_widget/bottom_bar/bottom_bar.dart';

// class CloseButt extends StatelessWidget {
//   const CloseButt({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         SizedBox(
//           height: screenHeight * 0.024,
//           width: screenWidth * 0.05,
//           child: InkWell(
//             child: const Icon(
//               Icons.close,
//               color: Color(0xFFFFFFFF),
//               size: 20,
//             ),
//             onTap: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const BottomBar()),
//               )
//             },
//           ),
//         ),
//         SizedBox(
//           width: screenWidth * 0.08,
//         )
//       ],
//     );
//   }
// }
