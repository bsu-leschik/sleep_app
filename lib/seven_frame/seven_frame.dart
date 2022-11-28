import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SevenFrame extends StatefulWidget {
  const SevenFrame({super.key});

  @override
  State<SevenFrame> createState() => _SevenFrameState();
}

class _SevenFrameState extends State<SevenFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: SafeArea(
        top: false,
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 86, right: 17, left: 17),
                child: SizedBox(
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current mix",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        // color: Colors.red,
                        width: 23,
                        height: 23,
                        child: InkWell(
                          // alignment: Alignment.topRight,
                          // padding: const EdgeInsets.all(0),
                          onTap: () => {(print("close"))},
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          // child: const Icon(
                          //   Icons.close,
                          //   color: Colors.white,
                          //   size: 23,
                          // ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
                color: Colors.black,
                // margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: const ClearSaveMix(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearSaveMix extends StatelessWidget {
  const ClearSaveMix({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 42,
          width: 78,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  "Clear",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 42,
          width: 105,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  "Save mix",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
