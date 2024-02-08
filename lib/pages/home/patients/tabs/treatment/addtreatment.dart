import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/pages/home/patients/tabs/treatment/addtreatmentplan.dart';

class AddTreatment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  const AddTreatment({
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddTreatment> createState() => _AddTreatmentState();
}

class _AddTreatmentState extends State<AddTreatment> {

  String? valueChoose;
  String? selectedValue;
  String? doctorId;
  String tab = 'treatment';

  List listItem = [];

  final DoctorController = Get.put(doctorController());

  final _formKey = GlobalKey<FormState>();

  bool showDialogFlag = false;

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
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Add Treatment Plan",
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
                            builder: (context) => AddTreatmentPlan(clinicId: clinicId, patientId: patientId, userId: userId, patientName: patientName,

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
                        builder: (context) => const AddTreatmentPlan(clinicId: '', patientId: '', userId: '', patientName: '',

                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
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
                                  'Cold',
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
                  height: 50,
                  child: const Card(
                    color: Color(0xFF01BFE1),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(":",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("0",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      _onConfirmButtonPressed();
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
                              "CONFIRM",
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

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure to delete'),
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
                  child: const Card(
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
                child: const Card(
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

  void _onConfirmButtonPressed(){
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //
    //   final Future<Map<String, dynamic>>
    //   successfulMessage =
    //   //appointmentrecord.addappointment(
    //       tab,
    //       startDate,
    //       patientId,
    //       patientName,
    //       purposeVisit,
    //       userId,
    //       clinicId,
    //       doctorId!);
    //   print(doctorId);
    //
    //   successfulMessage.then((response) {
    //     print("response :" + response.toString());
    //
    //     if (response['status']) {
    //       print(response);
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => PatientsDetails(
    //             // doctorName: selectedValue!,
    //             patientName: patientName,
    //             patientId: patientId,
    //             clinicId: clinicId,
    //             userId: userId,
    //           ),
    //         ),
    //       );
    //     }
    //   });
    // }
  }

}
