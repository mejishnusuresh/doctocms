import 'package:flutter/material.dart';
import 'package:project1/pages/home/patients/tabs/appointments/appointmentdetails.dart';
import 'package:project1/pages/home/patients/tabs/attachment/attachment.dart';
import 'package:project1/pages/home/patients/tabs/clinicnote/clinicalnote.dart';
import 'package:project1/pages/home/patients/tabs/payment/payment.dart';
import 'package:project1/pages/home/patients/tabs/prescription/prescription.dart';
import 'package:project1/pages/home/patients/tabs/treatment/treatment.dart';

class PatientDetails extends StatefulWidget {
  final String patientName;
  final String clinicId;
  final String userId;
  final String patientId;

  const PatientDetails({
    super.key,
    required this.patientName,
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  @override
  State<PatientDetails> createState() => _PatientDetailsState(
    patientName: patientName,
    clinicId: clinicId,
    userId: userId,
    patientId: patientId,

  );
}

class _PatientDetailsState extends State<PatientDetails> {
  String clinicId, userId;
  String patientName, patientId;

  _PatientDetailsState({
    required this.clinicId,
    required this.userId,
    required this.patientName,
    required this.patientId,
  });

  List<Tab> tabs = [
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Appoinments',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Clinical Notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Treatment',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Prescription',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Attachment',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> tabsContent = [
      Appointments(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
      ClinicalNotes(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
      Treatment(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
      Prescription(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
      Payment(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
      Attachment(
        clinicId: clinicId,
        userId: userId,
        patientId: patientId,
        patientName: patientName,
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF01BFE1),
          foregroundColor: Colors.white,
          title: Text(widget.patientName),
          bottom: PreferredSize(
              child: TabBar(
                  indicator: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(40)),
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: tabs),
              preferredSize: Size.fromHeight(50)),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
            children: tabsContent),
      ),
    );
  }
}





      //   SizedBox(
      //     width: double.infinity,
      //     height: double.infinity,
      //     child: Column(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(2),
      //           decoration: BoxDecoration(color: const Color(0xFF01BFE1),),
      //           height: 65,
      //           width: double.infinity,
      //           child: ListView.builder(
      //             itemCount: items.length,
      //             scrollDirection: Axis.horizontal,
      //             itemBuilder: (context, index){
      //               return Container(
      //                 width: 150,
      //                 height: 50,decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(30),
      //                   border: Border.all(
      //                     width: 3,
      //                     color: Colors.white,
      //                   )
      //                 ),
      //                 child: GestureDetector(
      //                   onTap: () {
      //                     setState(() {
      //                       _selectedIndex = index;
      //                     });
      //                   },
      //                   child: Center(
      //                     child: Text(
      //                       items[index],
      //                       style: TextStyle(color: Colors.white),
      //
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }
      //           ),
      //         ),
      //         Container(
      //
      //         )
      //       ],
      //   ),
      // ),