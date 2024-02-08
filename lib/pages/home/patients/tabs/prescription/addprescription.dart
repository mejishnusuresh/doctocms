import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/appointmentcontroller.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/pages/home/patients/tabs/prescription/addprescriptionplan.dart';
import 'package:project1/pages/home/patients/tabs/treatment/addtreatmentplan.dart';

class AddPrescription extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  const AddPrescription({
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {

  String? valueChoose;
  String? selectedValue;
  String tab = 'prescription';
  String? doctorId;

  final _formKey = GlobalKey<FormState>();

  List listItem = [];
  final AppointmentController = Get.put(appointmentController());
  final DoctorController = Get.put(doctorController());

  TextEditingController _complaintController = TextEditingController();
  TextEditingController _observationController = TextEditingController();
  TextEditingController _investigationController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();

  String _selectedcomplaint = '';
  String _selectedobservation = '';
  String _selectedinvestigation = '';
  String _selecteddiagnosis = '';

  bool showClinicNote = false;
  bool showDialogFlag = false;

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
    String patientName = widget.patientName;
    String patientId = widget.patientId;
    String clinicId = widget.clinicId;
    String userId = widget.userId;

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
                  child: Row(
                    children: [

                      Checkbox(
                        value: showClinicNote,
                        onChanged: (newValue) {
                          setState(() {
                            showClinicNote = newValue ?? false;
                          });
                        },
                      ),
                      const Text("Add clinic note")
                    ],
                  ),
                ),
                if (showClinicNote) ...[

                  Column(
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

                    ]
                  ),
                ],

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

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 160,
                    height: 50,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  AddPrescriptionPlan(clinicId: clinicId, patientId: patientId, userId: userId, patientName: patientName,

                            ),
                          ),
                        );
                      },
                      child: const Card(
                        color: Color(0xFF01BFE1),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Add",
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
                ),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTreatmentPlan(clinicId: clinicId, patientId: patientId, userId: userId, patientName: patientName,

                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    child: Card(
                      color: const Color(0xFF85d4eb),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paracetamol',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'BF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '1Week',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showDialogFlag = true;
                                });
                                _showDeleteConfirmationDialog();
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),

                          ],
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
                      _onSaveButton1Pressed();
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

  void _selectobservation(String list) {
    setState(() {
      _selectedobservation = list;
      _observationController.text = _selectedobservation;
    });
  }

  void _selectcomplaint(String list) {
    setState(() {
      _selectedcomplaint = list;
      _complaintController.text = _selectedcomplaint;
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

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure to delete'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  showDialogFlag = false;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                  width: 80,
                  height: 50,
                  child: Card(
                      color: Colors.blue,
                      child: Center(
                          child: Text('No', style: TextStyle(color: Colors.white))
                      )
                  )
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  showDialogFlag = false;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                width: 80,
                height: 50,
                child: Card(
                  color: Colors.blue,
                  child: Center(
                      child: Text('Yes', style: TextStyle(color: Colors.white))
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onSaveButtonPressed(){

  }
  void _onSaveButton1Pressed(){

  }

}
