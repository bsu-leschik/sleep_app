import 'package:flutter/material.dart';

import 'exp2.dart';

class UserSymptom extends StatefulWidget {
  const UserSymptom({super.key});

  @override
  State<UserSymptom> createState() => _UserSymptomState();
}

class _UserSymptomState extends State<UserSymptom> {
  final List<Symptoms> nameSymptom = [
    Symptoms(symptom: 'Runny nose'),
    Symptoms(symptom: 'Sore throat'),
    Symptoms(symptom: 'Fever'),
    Symptoms(symptom: 'Headache'),
    Symptoms(symptom: 'Dizziness'),
    Symptoms(symptom: 'Chills'),
    Symptoms(symptom: 'Weakness'),
    Symptoms(symptom: 'Sore eyes'),
    Symptoms(symptom: 'Toothache'),
    Symptoms(symptom: 'Diarrhea'),
    Symptoms(symptom: 'Sleepiness'),
    Symptoms(symptom: 'Muscle pain'),
    Symptoms(symptom: 'Loss of smell'),
    Symptoms(symptom: 'Flatulence'),
    Symptoms(symptom: 'Nausea'),
    Symptoms(symptom: 'Stomachache'),
    Symptoms(symptom: 'Loss of taste'),
  ];
  List<Symptoms> selectedSymptom = [];
  void _addNewSymptom(String txSymptom) {
    final newTx = Symptoms(symptom: txSymptom);
    setState(() {
      nameSymptom.add(newTx);
    });
  }

  _showChoseDialog() {
    
    showModalBottomSheet(
        backgroundColor: const Color(0xffC7CACF),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Image(
                        image: AssetImage(
                          'assets/images/home/line_mini.png',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'CHOOSE SYMPTOMS',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    MultiSelectChipSymptoms(nameSymptom,
                        onSelectionChanget: (selectList) {
                      setState(() {
                        selectedSymptom = selectList;
                      });
                    }),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 6, top: 29),
                      child: Text("DIDN'T FIND THE RIGHT ONE? ADD YOURS!"),
                    ),
                    NewSymptom(_addNewSymptom),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color(0xffA9ACB2),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.only(
                                left: 107, right: 107, top: 12, bottom: 12),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}