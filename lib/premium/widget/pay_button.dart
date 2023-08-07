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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FirstButton(),
        BigPayButton(
          close: "\$15.99",
          sum: "\$15.99",
          period: "per month",
        ),
        BigPayButton(
          close: "\$207.48",
          sum: "\$99.99",
          period: "per year",
        ),
      ],
    );
  }
}

class FirstButton extends StatelessWidget {
  const FirstButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(43),
          side: const BorderSide(
            color: Color(0xFFFFFFFF),
          )),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(43),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 73.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "\$11.99",
                style: TextStyle(
                  fontFamily: 'Poetsen',
                  color: Color(0xFFFFFFFF),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
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
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BigPayButton extends StatelessWidget {
  final String close;
  final String sum;
  final String period;
  const BigPayButton({
    super.key,
    required this.close,
    required this.sum,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(43),
          side: const BorderSide(
            color: Color(0xFF8E9FCC),
          )),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(43),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 33.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                    height: 30,
                    child: Image.asset("assets/images/premium/Splash.png"),
                  ),
                ],
              ),
              const SizedBox(width: 12),
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
              const SizedBox(width: 12),
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
    );
  }
}
