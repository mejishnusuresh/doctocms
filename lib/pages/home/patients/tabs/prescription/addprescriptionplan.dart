import 'package:flutter/material.dart';
import 'package:project1/pages/home/patients/tabs/prescription/addprescription.dart';
import 'package:project1/pages/home/patients/tabs/treatment/addtreatment.dart';

class AddPrescriptionPlan extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;
  const AddPrescriptionPlan({
    super.key,
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddPrescriptionPlan> createState() => _AddPrescriptionPlanState();
}

class _AddPrescriptionPlanState extends State<AddPrescriptionPlan> {

  String? selectedValue;
  String selectedF = '';
  String? selectedDur;

  List<String> items = [
    'Club Drug',
    'Dolo',
    'Batadin',
    'Paracetamol',
    'Pantop',
  ];
  List<String> duration = [
    'Days',
    'Weeks',
    'Month',
  ];

  void onSaveButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPrescription(clinicId: '', patientId: '', userId: '', patientName: '',

        ),
      ),
    );
  }
  void _onFSelected(String f) {
    setState(() {
      selectedF = f;
    });
  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF01BFE1),
        title: const Text('doctosmart'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Add Prescription",
                      style: TextStyle(fontSize: 20,color: Color(0xFF01BFE1)),
                    ),
                  ),
                ),

                Container(
                  child: const Text(
                    'Medicine',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF01BFE1),
                      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton<String?>(
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items: items.map<DropdownMenuItem<String?>>((String value) {
                        return DropdownMenuItem<String?>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      dropdownColor: Colors.white,
                      isExpanded: true,
                    ),
                  ),
                ),


                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Dosage',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Color(0xFF01BFE1),
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Frequency',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Color(0xFF01BFE1),
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Column(
                  children: [

                    Row(
                      children: [

                        FButton(
                          label: 'BF',
                          isSelected: selectedF == 'BF',
                          onSelected: () => _onFSelected('BF'),
                        ),
                        const SizedBox(width: 20),
                        FButton(
                          label: 'AF',
                          isSelected: selectedF == 'AF',
                          onSelected: () => _onFSelected('AF'),
                        ),

                      ],
                    ),

                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  child: const Text(
                    'Duration',
                    style: TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Row(
                  children: [

                    Container(
                      width: 150,
                      height: 50,
                      child: Card(
                        color: Color(0xFF01BFE1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 100,
                      height: 50,
                      child: Card(
                        color: Color(0xFF01BFE1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String?>(
                            value: selectedDur,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDur = newValue;
                              });
                            },
                            items: duration.map<DropdownMenuItem<String?>>((String value) {
                              return DropdownMenuItem<String?>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {

                      onSaveButtonPressed();

                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: const Color.fromRGBO(0, 191, 225, 1),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class FButton extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onSelected;

  const FButton({
    required this.isSelected,
    required this.label,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 100,
        height: 50,
        child: Card(
            color: isSelected ? const Color.fromRGBO(0, 191, 225, 1) : Colors.white,
            child: Center(
                child: Text(label, style: TextStyle(fontSize: 15),)
            )
        ),
      ),
    );
  }
}