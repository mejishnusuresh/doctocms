import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/controller/tabcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/pages/home/patients/patientdetails.dart';
import 'package:project1/pages/home/patients/tabs/clinicnote/clinicalnote.dart';

class AddClinicNote extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  AddClinicNote({
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddClinicNote> createState() => _AddClinicNoteState(patientName: patientName, clinicId: clinicId, userId: userId, patientId: patientId);
}

class _AddClinicNoteState extends State<AddClinicNote> {
  String clinicId, userId, patientId, patientName;

  _AddClinicNoteState({
    required this.patientName,
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  String? valueChoose;
  String? selectedValue;
  String tab = 'clinicnote';
  String? doctorId;
  String _selectedcomplaint = '';
  String _selecteddiagnosis = '';
  String _selectedinvestigation = '';
  String _selectedobservation = '';

  List listItem = [];

  final DoctorController = Get.put(doctorController());
  final TabController= Get.put(tabController());
  
  TextEditingController _complaintController = TextEditingController();
  TextEditingController _observationController = TextEditingController();
  TextEditingController _investigationController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> _complaintOptions = [
    'Fever',
    'Cold',
    'Headache',
    'RCT',
    'Filling',
  ];

  List<String> _observationOptions = [
    'Pain in teeth',
    'Cataract removal surgery',
    'Prostate surgery',
  ];

  List<String> _investigationOptions = [
    'RVG',
    'PVG',
    'Patient is suffering from bleeding disorders',

  ];

  List<String> _diagnosisOptions = [
    'Cavity',
    'Malocclusion',
    'Spinal tenosis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF01BFE1),
        title: const Text('doctosmart'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Add clinic note",
                      style: TextStyle(fontSize: 20,color: Color(0xFF01BFE1)),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: FutureBuilder(
                        future: DoctorController.listdoctor(
                          userId,
                          clinicId,
                        ),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic>? userData = snapshot.data;
                            ListDoctorModel user = userData!['user'];
                            listItem = user.result!
                                .map((doctor) => doctor.doctorName)
                                .toList();
                            valueChoose = listItem.isNotEmpty ? listItem[0] : null;
                            return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return DropdownButton(
                                  hint: const Text('Select doctor'),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 36,
                                  isExpanded: true,
                                  value: selectedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue.toString();
                                      selectedValue = valueChoose;
                                      doctorId = userData['user']
                                          .result!
                                          .firstWhere((doctor) =>
                                      doctor.doctorName == newValue)
                                          .userId;
                                    });
                                  },
                                  items: listItem.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error occurred while fetching data");
                          } else {
                            return const LinearProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Complaint',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _complaintController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              onSelected: _selectcomplaint,
                              itemBuilder: (BuildContext context) {
                                return _complaintOptions.map((String list) {
                                  return PopupMenuItem<String>(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Observation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _observationController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              onSelected: _selectobservation,
                              itemBuilder: (BuildContext context) {
                                return _observationOptions.map((String list) {
                                  return PopupMenuItem<String>(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Investigation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _investigationController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              onSelected: _selectinvestigation,
                              itemBuilder: (BuildContext context) {
                                return _investigationOptions.map((String list) {
                                  return PopupMenuItem<String>(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Diagnosis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _diagnosisController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              onSelected: _selectdiagnosis,
                              itemBuilder: (BuildContext context) {
                                return _diagnosisOptions.map((String list) {
                                  return PopupMenuItem<String>(
                                    value: list,
                                    child: Text(list),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      _onSaveButtonPressed();
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

  void _selectcomplaint(String list) {
    setState(() {
      _selectedcomplaint = list;
      _complaintController.text = _selectedcomplaint;
    });
  }

  void _selectobservation(String list) {
    setState(() {
      _selectedobservation = list;
      _observationController.text = _selectedobservation;
    });
  }

  void _selectinvestigation(String list) {
    setState(() {
      _selectedinvestigation = list;
      _investigationController.text = _selectedinvestigation;
    });
  }

  void _selectdiagnosis(String list) {
    setState(() {
      _selecteddiagnosis = list;
      _diagnosisController.text = _selecteddiagnosis;
    });
  }

  void _onSaveButtonPressed(){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Future<Map<String, dynamic>>
      successfulMessage =
      TabController.addclinicalnote(patientId, clinicId, userId, doctorId);// complaints, observation, investigation, diagnosis);
      print(doctorId);

      successfulMessage.then((response) {
        print("response :" + response.toString());

        if (response['status']) {
          print(response);
          TabController.changeTab(tab);
          Navigator.pop(context);
        }
      });
    }
  }

}
