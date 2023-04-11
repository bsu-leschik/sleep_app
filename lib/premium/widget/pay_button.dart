import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayButton extends StatefulWidget {
  const PayButton({super.key});

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const FirstButton(),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        const TwoPayButton(
          close: "\$15.99",
          sum: "\$15.99",
          period: "per month",
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        const TwoPayButton(
          close: "\$207.48",
          sum: "\$99.99",
          period: "per year",
        ),
        SizedBox(
          height: screenHeight * 0.04,
        ),
      ],
    );
  }
}

class FirstButton extends StatelessWidget {
  const FirstButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        print("Print first button");
      },
      child: Container(
        height: screenHeight * 0.07,
        width: screenWidth * 0.83,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(43),
          border: Border.all(
            color: const Color(0xFFFFFFFF),
          ),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "\$11.99",
                style: TextStyle(
                  fontFamily: 'Poetsen',
                  color: Color(0xFFFFFFFF),
                  fontSize: 32,
                  height: 38.4 / 32,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "per week",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                    height: 24.5 / 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class TwoPayButton extends StatelessWidget {
  final String close;
  final String sum;
  final String period;
  const TwoPayButton({
    super.key,
    required this.close,
    required this.sum,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print("Print first button");
          },
          child: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.83,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(43),
              border: Border.all(
                color: const Color(0xFF8E9FCC),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Text(
                        close,
                        style: const TextStyle(
                          fontFamily: 'Poetsen',
                          color: Color(0xFF8E9FCC),
                          fontSize: 18,
                          height: 21.6 / 18,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.038,
                        height: screenHeight * 0.035,
                        child: Image.asset("assets/images/premium/Splash.png"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Text(
                    sum,
                    style: const TextStyle(
                      fontFamily: 'Poetsen',
                      color: Color(0xFFFA9044),
                      fontSize: 32,
                      height: 38.4 / 32,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Text(
                    period,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xFF8E9FCC),
                        fontSize: 18,
                        height: 24.55 / 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
