import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Sevena extends StatefulWidget {
  const Sevena({super.key});

  @override
  State<Sevena> createState() => _SevenaState();
}

class _SevenaState extends State<Sevena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 1),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: const [
            TopBar(),
            SizedBox(height: 25),
            SaveType(),
            PlayList(),
            LikeMusic(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 86, left: 17, right: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Current mix",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 23,
            ),
          ),
          InkWell(
            onTap: () => {print("Close frame")},
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SaveType extends StatefulWidget {
  const SaveType({super.key});

  @override
  State<SaveType> createState() => _SaveTypeState();
}

class _SaveTypeState extends State<SaveType> {
  bool isSelected = false; // нажатие кнопки и активность кнопки
  void select() {
    setState(() {
      isSelected = !isSelected; // присваивание противоположного значения
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: SizedBox(
        // color: Colors.red,
        height: 72,
        width: 390,
        child: Row(
          children: [
            SizedBox(
              height: 42,
              width: 78,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff8E9FCC),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Color(0xff8E9FCC),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 42,
              width: 105,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff8E9FCC),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Save mix",
                    style: TextStyle(
                      color: Color(0xff8E9FCC),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  double _rating1 = 1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 19),
                  child: SizedBox(
                    width: 241,
                    height: 27,
                    // color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
                    value: _rating1,
                    min: 0,
                    max: 100,
                    onChanged: (double newRating) {
                      setState(() {
                        _rating1 = newRating;
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
    ]);
  }
}

class LikeMusic extends StatelessWidget {
  const LikeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> like = [
      "Rain",
      "Snow",
      "Cry",
      "Fun",
      "Step",
      "Classic",
      "Liriq",
      "Shopen"
    ];
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 338,
        child: ListView.builder(
          itemCount: like.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
                // key: const ValueKey(0),
                endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: const [
                      SlidableAction(
                        autoClose: false,
                        flex: 3,
                        onPressed: doNothing,
                        icon: Icons.heart_broken_rounded,
                      ),
                    ]),
                child: LikesMusic(title: like[index]));
            // return Dismissible(
            //     key: ValueKey(like[index]),
            //     background: Container(
            //       height: 78,
            //       width: 267,
            //       decoration: const BoxDecoration(
            //           color: Color(0xFF0C0E1F),
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(50),
            //               bottomLeft: Radius.circular(50))),
            //       child: Row(
            //         children: const [Icon(Icons.heat_pump_rounded)],
            //       ),
            //     ),
            // secondaryBackground: Container(
            //   height: 78,
            //   width: 267,
            //   decoration: const BoxDecoration(
            //       color: Color(0xFF0C0E1F),
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(50),
            //           bottomRight: Radius.circular(50))),
            // ),
            // child: LikesMusic(title: like[index]));
            // return LikesMusic(title: like[index]);
          },
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

class LikesMusic extends StatefulWidget {
  final String title;
  const LikesMusic({super.key, required this.title});

  @override
  State<LikesMusic> createState() => _LikesMusicState();
}

class _LikesMusicState extends State<LikesMusic> {
  double _rating2 = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 19),
                child: SizedBox(
                  width: 241,
                  height: 27,
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
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
                  value: _rating2,
                  min: 0,
                  max: 100,
                  onChanged: (double newRating2) {
                    setState(() {
                      _rating2 = newRating2;
                    });
                  },
                  // label: "$_rating",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
