import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/tabcontroller.dart';
import 'package:project1/model/patient/tabs/listappointmentdetailsmodel.dart';
import 'package:project1/pages/home/patients/tabs/appointments/addappointment.dart';

class Appointments extends StatefulWidget {
  final String patientName, patientId;
  final String clinicId;
  final String userId;
  final String? doctorname;
  final String? purpose;
  final String? date;
  final String? time;
  Appointments({
    required this.clinicId,
    required this.userId,
    required this.patientId,
    required this.patientName,
    this.doctorname,
    this.purpose,
    this.date,
    this.time,
  });

  @override
  State<Appointments> createState() => _AppointmentsState(
    clinicId: clinicId,
    userId: userId,
    patientId: patientId,
    patientName: patientName,
  );
}

class _AppointmentsState extends State<Appointments> {
  String clinicId, userId, patientId, patientName;

  final TabController = Get.put(tabController());

  _AppointmentsState({
    required this.patientName,
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  @override
  Widget build(BuildContext context) {
    String? startDate = "2023-07-24";
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 8.0, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAppointment(
                            patientName: patientName,
                            clinicId: clinicId,
                            userId: userId,
                            patientId: patientId,
                          ),
                        ),
                      );
                    },
                    child: Text('Add appointment'),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF01BFE1)),
                  )
                ],
              ),
              Text(
                'Appointments',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 12, 134, 134)),
              ),
              FutureBuilder<Map<String, dynamic>?>(
                future: TabController.listappointmentdetails(
                  patientId,
                  clinicId,
                  userId,
                  startDate ??
                      "",
                ),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text('Oops, no internet'),
                        ),
                      );
                    }
                    if (snapshot.data == null) {
                      return Scaffold(
                        body: Center(
                          child: Text('Data is null'),
                        ),
                      );
                    }
                    // Now you can safely access the non-null data
                    final Map<String, dynamic> data = snapshot.data!;
                    ListAppointmentDetailsModel user = data['user'];
                    return ListView.builder(
                      itemCount: user.result!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8, top: 18),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 20, color: Colors.white10),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(user.result![index].appointmentDate.toString()),
                                        Card(
                                          color: Colors.cyanAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(user.result![index].appointmentTime.toString()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(user.result![index].doctorName.toString()),
                                    Text(user.result![index].description.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(0, 191, 225, 1),
                        valueColor: AlwaysStoppedAnimation(
                            Color.fromRGBO(135, 206, 235, 1)),
                        minHeight: 5,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
