import 'package:flutter/material.dart';

class MultiSelectChipSymptoms extends StatefulWidget {
  final List<Symptoms> nameMeds;
  final Function(List<Symptoms>) onSelectionChanget;
  const MultiSelectChipSymptoms(this.nameMeds,
      {super.key, required this.onSelectionChanget});

  @override
  State<MultiSelectChipSymptoms> createState() =>
      _MultiSelectChipSymptomsState();
}

class _MultiSelectChipSymptomsState extends State<MultiSelectChipSymptoms> {
  List<Symptoms> selectedChoises = [];
  final List<Symptoms> nameMeds = [];

  _builderChoiceList() {
    List<Widget> choices = [];

    for (var tx in widget.nameMeds) {
      choices.add(
        ChoiceChip(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),

          elevation: 10,
          selectedColor: const Color(0xffA9ACB2),
          backgroundColor: const Color(0xffC7CACF),
          labelPadding:
              const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),

          label: Text(
            tx.symptom,
            style: const TextStyle(fontSize: 16),
          ),
          // ),
          selected: selectedChoises.contains(tx),
          onSelected: (selected) {
            setState(() {
              selectedChoises.contains(tx)
                  ? selectedChoises.remove(tx)
                  : selectedChoises.add(tx);
              widget.onSelectionChanget(selectedChoises);
            });
          },
        ),
      );
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: _builderChoiceList(),
    );
  }
}