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
        child: SizedBox(
          // color: Colors.amber,
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
                          onTap: () => {(debugPrint("close"))},
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
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
                // color: Colors.black,
                // margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: const ClearSaveMix(),
              ),
              const SizedBox(
                height: 25,
              ),
              const PlayingMusic(),
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

class PlayingMusic extends StatefulWidget {
  const PlayingMusic({super.key});

  @override
  State<PlayingMusic> createState() => _PlayingMusicState();
}

class _PlayingMusicState extends State<PlayingMusic> {
  double _rating = 1;
  double _rating1 = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // color: Colors.amber,
          width: 338,
          height: 78,
          child: Row(
            children: [
              Stack(children: [
                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff8E9FCC),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    // color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(59),
                      ),
                      color: Color(0xff003293),
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ]),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 19),
                    child: SizedBox(
                      width: 241,
                      height: 27,
                      // color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meditation music",
                            style: TextStyle(
                              color: Color(0xff8E9FCC),
                            ),
                          ),
                          Icon(
                            Icons.menu,
                            color: Color(0xffFFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 241,
                    height: 15,
                    // margin: const EdgeInsets.all(0),
                    // color: Colors.green,
                    child: Slider(
                      activeColor: const Color(0xff7E44FA),
                      inactiveColor: const Color(0xff01308C),
                      divisions: 100,
                      value: _rating,
                      min: 0,
                      max: 100,
                      onChanged: (double newRating) {
                        setState(() {
                          _rating = newRating;
                        });
                      },
                      // label: "$_rating",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          // color: Colors.amber,
          width: 338,
          height: 78,
          child: Row(
            children: [
              Stack(children: [
                Container(
                  width: 78,
                  height: 78,
                  decoration: const BoxDecoration(
                    color: Color(0xff7E44FA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(57),
                    ),
                    // color: Colors.red,
                  ),
                ),
              ]),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 19),
                    child: SizedBox(
                      width: 241,
                      height: 27,
                      // color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rain",
                            style: TextStyle(
                              color: Color(0xff8E9FCC),
                            ),
                          ),
                          Icon(
                            Icons.menu,
                            color: Color(0xffFFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 241,
                    height: 15,
                    // margin: const EdgeInsets.all(0),
                    // color: Colors.green,
                    child: Slider(
                      activeColor: const Color(0xff7E44FA),
                      inactiveColor: const Color(0xff01308C),
                      divisions: 100,
                      value: _rating1,
                      min: 0,
                      max: 100,
                      onChanged: (double newRating1) {
                        setState(() {
                          _rating1 = newRating1;
                        });
                      },
                      // label: "$_rating",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
