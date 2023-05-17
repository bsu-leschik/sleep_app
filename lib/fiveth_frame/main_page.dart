import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_themes/types_list.dart';
import 'package:sleep_app/fiveth_frame/music_themes/types_list_model.dart';
import 'package:sleep_app/fiveth_frame/sound_widgets/sounds_model.dart';
import '../data_type.dart';
import 'data_fiveth.dart';
import 'widget/bar_widget.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF141733),
        title: const BarWidget(),
      ),
      body: Container(
        color: const Color(0xFF141733),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            /// CUSTOM TABBAR
            SizedBox(
              // color: Colors.red, цвет для теста
              width: double.infinity,
              height: 72,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // длинна списка типа музыки
                  itemCount: context.read<DataTypeList>().items.length,
                  // (items.length),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(left: 17),
                          width: 80,
                          height: 42,
                          decoration: BoxDecoration(
                            color: current == index
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF141733),
                            borderRadius: BorderRadius.circular(59),
                            border: Border.all(
                              color: const Color(0xFF8E9FCC),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              //  текст типа музыки
                              context.read<DataTypeList>().items[index],
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  height: 21.82 / 16,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: current == index
                                      ? const Color(0xFF281343)
                                      : const Color(0xFF8E9FCC),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(26, 20, 26, 40),
                      color: Colors.transparent,
                      height: 284,
                      width: screenWidth,
                      child: TypesList(TypesListModel.list),
                    ),
                    Divider(
                      color: const Color(0xFF8E9FCC),
                      thickness: 1,
                      indent: screenWidth * 0.11,
                      endIndent: screenWidth * 0.11,
                    ),

                    /// MAIN BODY
                    Positioned(
                      top: 30,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: TypesList(SoundsModel.list),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LockIcon extends StatelessWidget {
  const LockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
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
    );
  }
}
