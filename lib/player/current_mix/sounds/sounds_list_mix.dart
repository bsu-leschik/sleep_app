import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../storage/mixes/mixes_storage.dart';
import '../widgets/mix_control.dart';
import '../widgets/mix_list.dart';
import '../widgets/no_sounds.dart';

class SoundsListMix extends StatelessWidget {
  const SoundsListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider.of<MixesStorage>(context).mix.isEmpty
        ? const NoSounds()
        : Column(children: [
            Container(
                margin: const EdgeInsets.only(bottom: 25, left: 17, right: 17),
                child: const MixControl()),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                child: const MixList(),
              ),
            ),
          ]);
  }
}
