import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

  

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({super.key});

  @override
  State<GlucoseScreen> createState() => _GlucoseScreenState();
}

class _GlucoseScreenState extends State<GlucoseScreen> {

  final _dateController = TextEditingController();
  final momentController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  //  String dropdownValue = list.first;
   String dropdownValue = "Desayuno";

  List<String> list = <String>[
    "Desayuno",
    "Almuerzo",
    "Cena"
  ];



  void saveGlucose(){
    final newGlucose = <String, dynamic>{
    "date": _dateController.text,
    "medication_moment": dropdownValue,
    // "glucose": int.tryParse(_glucoseController.text) ?? 0
    "glucose": int.parse(_glucoseController.text)
  };
    _db.collection("glucose").add(newGlucose).then((DocumentReference doc) =>
      print('DocumentSnaps added with ID: ${doc.id}'));
    
    print(_dateController.text);
    print(dropdownValue);
    print(_glucoseController.text);
    _dateController.clear();
    _glucoseController.clear();
    setState(() {
      dropdownValue;
    });
  }

  saveList() {
    String momentController = "Desayuno";

    var medicationMoment = [
      "Desayuno",
      "Almuerzo",
      "Cena"
    ];
    
    return DropdownButton(
      value: momentController,
      items: medicationMoment.map((String medicationMoment) {
        return DropdownMenuItem(
          value: medicationMoment,
          child: Text(
            medicationMoment,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      }).toList(), onChanged: (String? newValue) {
        setState(() {
          momentController = newValue!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Center(
          child: Text('Glucosa'),
        )
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SafeArea(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'G L U C O S A',
                  style: TextStyle(
                    fontSize: 36 
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Fecha: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DateTextFieldGlucose(
                          controller: _dateController,
                          obscureText: false
                        ),
                      ),                                 
                    ],
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                       const Expanded(
                        flex: 2,
                        child: Text(
                          'Momento de medición: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        // child: DropDownGlucose(),
                        // child: saveList(),
                        child: DropdownButton(
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // items: [
                          //   DropdownMenuItem(value: 'Desayuno', child: Text('Desayuno')),
                          //   DropdownMenuItem(value: 'Almuerzo', child: Text('Almuerzo')),
                          //   DropdownMenuItem(value: 'Cena', child: Text('Cena')),
                          // ],
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                              print(value);
                            });
                          },
                        )
                      ),                  
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Glucosa: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldGlucose(
                          controller: _glucoseController,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          suffix: const Text('mg/dL'),
                        ),
                      ),                  
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ButtonGlucose(
                  text: 'Guardar',
                  onTap: saveGlucose
                ),
              ],              
            ),
          ),
        ),
      ),
    );
  }
}