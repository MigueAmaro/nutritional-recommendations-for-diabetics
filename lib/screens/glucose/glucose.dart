import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({super.key});

  @override
  State<GlucoseScreen> createState() => _GlucoseScreenState();
}

class _GlucoseScreenState extends State<GlucoseScreen> {

  final dateController = TextEditingController();
  final momentController = TextEditingController();
  final glucoseController = TextEditingController();

  void saveGlucose(){}

  @override
  void initState() {
    super.initState();
    dateController.text = "";
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
                          controller: dateController,
                          obscureText: false
                        ),
                      ),                                 
                    ],
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                       Expanded(
                        flex: 2,
                        child: Text(
                          'Momento de medición: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropDownGlucose(),
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
                          controller: glucoseController,
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