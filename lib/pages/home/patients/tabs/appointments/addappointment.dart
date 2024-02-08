import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/appointmentcontroller.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/controller/tabcontroller.dart';
import 'package:project1/model/appointment/listappointmentmodel.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/pages/home/patients/tabs/appointments/appointmentdetails.dart';

class AddAppointment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  AddAppointment({
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddAppointment> createState() => _AddAppointmentState(patientName: patientName, clinicId: clinicId, userId: userId, patientId: patientId);
}

class _AddAppointmentState extends State<AddAppointment> {
  String clinicId, userId, patientId, patientName;

  _AddAppointmentState({
    required this.patientName,
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  String? valueChoose;
  String? selectedValue;
  String tab = 'appointment';

  String appointmentId = 'appointment';
  String startDate = " ";
  String purposeVisit = " ";
  String time = "";
  String? doctorId;

  List listItem = [];

  final AppointmentController = Get.put(appointmentController());
  final TabController = Get.put(tabController());
  final DoctorController = Get.put(doctorController());

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay _timeofday = TimeOfDay(hour: 8, minute: 30);

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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Text(
                      "Add appointments",
                      style: TextStyle(fontSize: 20,color: Color(0xFF01BFE1)),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Color(0xFF01BFE1),
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
                                  hint: Text('Select doctor'),
                                  icon: Icon(Icons.arrow_drop_down),
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
                            return Text("Error occurred while fetching data");
                          } else {
                            return LinearProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      color: Color(0xFF01BFE1),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            startDate,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: _showTimePicker,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      color: Color(0xFF01BFE1),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _timeofday.format(context).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  child: const Text(
                    'Purpose Of Visit',
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
                    color: Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) => purposeVisit = value!,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),

                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20),
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
                        color: Color.fromRGBO(0, 191, 225, 1),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Confirm",
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

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate = selectedDate.year.toString() +
            "-" +
            selectedDate.month.toString() +
            "-" +
            selectedDate.day.toString();
      });
    }

  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => setState(() {
      _timeofday = value!;
    }));
  }

  void _onConfirmButtonPressed(){

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Future<Map<String, dynamic>>
      successfulMessage =
      TabController.addappointment(patientId, clinicId, userId, startDate, patientName, purposeVisit);

      successfulMessage.then((response) {
          print(response);
          TabController.changeTab(tab);
          Navigator.pop(context);
        }
      );
    }

  }

}
