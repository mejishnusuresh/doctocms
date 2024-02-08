import 'package:flutter/material.dart';
import 'package:project1/pages/home/patients/tabs/treatment/addtreatment.dart';

class AddTreatmentPlan extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;
  const AddTreatmentPlan({
    super.key,
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddTreatmentPlan> createState() => _AddTreatmentPlanState();
}

class _AddTreatmentPlanState extends State<AddTreatmentPlan> {

  String? selectedValue;

  Map<String, int> itemValues = {
    'Hormone Therapy': 123,
    'Fever': 100,
    'RCT': 15,
    'Cold': 100,
    'Pain': 150,
  };

  int value = 1;
  void incrementValue() {
    setState(() {
      value++;
    });
  }
  void decrementValue() {
    if (value > 1) {
      setState(() {
        value--;
      });
    }
  }
  void onSaveButtonPressed() {
    // final selectedAmount = itemValues[selectedValue ?? ''] ?? 0;
    // final selectedTreatment = selectedValue ?? '';

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddTreatment(clinicId: '', patientId: '', userId: '', patientName: '',
          // selectedAmount: selectedAmount,
          // selectedTreatment: selectedTreatment,
        ),
      ),
    );
  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int selectedAmount = (itemValues[selectedValue ?? ''] ?? 0) * value;
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
                      "Add Treatment Plan",
                      style: TextStyle(fontSize: 20,color: Color(0xFF01BFE1)),
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
                      items: itemValues.keys.map((String value) {
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

                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          " Unit",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Amount ",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: 130,
                          height: 50,
                          child: Card(
                            color: const Color(0xFF01BFE1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: decrementValue,
                                    child: const Text(
                                      '-',
                                      style: TextStyle(fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '$value',
                                        style: const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold,),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: incrementValue,
                                    child: const Text(
                                      '+',
                                      style: TextStyle(fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          child: Card(
                            color: const Color(0xFF01BFE1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "$selectedAmount",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
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
