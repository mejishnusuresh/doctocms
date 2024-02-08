import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/appointmentcontroller.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/controller/patientcontroller.dart';
import 'package:project1/model/appointment/listappointmentmodel.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/model/patient/listpatientmodel.dart';
import 'package:project1/pages/home/appoinments/appoinmentlist.dart';
import 'package:project1/pages/home/doctors/doctorlist.dart';
import 'package:project1/pages/loginpage.dart';
import 'package:project1/pages/home/patients/patientlist.dart';

class Dashboard extends StatefulWidget {

  final String clinicId;
  final String userId;
  final String startDate;
  final String patientId;
  final String patientName;

  Dashboard({
    super.key,
    required this.clinicId,
    required this.userId,
    required this.startDate,
    required this.patientId,
    required this.patientName,
   });

  @override
  State<Dashboard> createState() => _DashboardState(
      userId: this.userId,
      clinicId: this.clinicId,
      startDate: this.startDate,
      patientId: this.patientId,
      patientName: patientName,
  );
}

class _DashboardState extends State<Dashboard> {

  String clinicId, userId;
  String startDate, patientId,patientName;

  _DashboardState({
      required this.clinicId,
      required this.userId,
      required this.startDate,
      required this.patientId,
      required this.patientName,
  });

  List<String> images = [
    'assets/images/mainImage.jpg',
    'assets/images/mainImage.jpg',
    'assets/images/mainImage.jpg',
    'assets/images/mainImage.jpg',
  ];

  final DoctorController = Get.put(doctorController());
  final PatientController = Get.put(patientController());
  final AppointmentController = Get.put(appointmentController());

  int? doctorCount;
  int? patientCount;
  int? appointmentCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('doctosmart'),
        leading: Container(
          padding: EdgeInsets.all(8.0), // Optional padding
          child: Image.asset(
            'assets/images/doctosmartlogo.png',
            width: 25.0,
            height: 25.0,
          ),
        ),
        backgroundColor: const Color(0xFF01BFE1),
        actions: [
          //signout button
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout)
          )
        ],
        titleSpacing: 0,
      ),
      backgroundColor: const Color(0xFFF6F6FE),
      body:  SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  const Text(
                    "VM Dental Clinic",
                    style: TextStyle(
                        fontSize: 24
                    ),
                  ),

                  const SizedBox(height: 30,),

                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 550,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Column(
                      children: [

                        CarouselSlider(
                          options: CarouselOptions(
                            height: 380.0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 10),
                            autoPlayAnimationDuration: const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                          ),
                          items: images.map((imageUrl) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  child: Image.asset(
                                    imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 50,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => PatientDash(clinicId: clinicId, userId: userId, patientId: patientId,),
                                  ),
                                );
                              },
                              child: Container(
                                width: 105,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF01BFE1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    const SizedBox(
                                      height: 50,
                                      child: Icon(Icons.groups_rounded),

                                    ),

                                    const SizedBox(
                                      height: 20,
                                      child: Text("Patients" ,style: TextStyle(color: Colors.white),),

                                    ),

                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF87CEEA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        patientCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) =>  AppointmentDash(clinicId: clinicId, userId: userId, patientId: patientId, patientName: patientName,),
                                ),
                                );
                              },
                              child: Container(
                                width: 105,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF01BFE1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    const SizedBox(
                                      height: 50,
                                      child: Icon(Icons.calendar_month_outlined),

                                    ),

                                    const SizedBox(
                                      height: 20,
                                      child: Text(
                                        "Appointments",style: TextStyle(color: Colors.white), ),

                                    ),

                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF87CEEA),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          )
                                      ),
                                      child: Text(
                                        appointmentCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) =>  DoctorDash(clinicId: clinicId, userId: userId),
                                ),
                                );
                              },
                              child: Container(
                                width: 105,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF01BFE1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    const SizedBox(
                                      height: 50,
                                      child: Icon(Icons.person),

                                    ),

                                    const SizedBox(
                                      height: 20,
                                      child: Text("Doctors",style: TextStyle(color: Colors.white), ),

                                    ),

                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF87CEEA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        doctorCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),


                  ),

                ],
              ),
            ),

            const SizedBox(height: 120,),

            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFF01BFE1),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),

            FutureBuilder<Map<String, dynamic>?>(
              future: DoctorController.listdoctor(userId, clinicId),
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                final Map<String, dynamic> data = snapshot.data!;
                ListDoctorModel user = data['user'];
                doctorCount = user.result!.length;
                return Text('$doctorCount');
              },
            ),
            FutureBuilder<Map<String, dynamic>?>(
              future: PatientController.listpatient(userId, clinicId),
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                final Map<String, dynamic> data = snapshot.data!;
                ListPatientModel user = data['user'];
                patientCount = user.result!.length;
                return Text('$patientCount');
              },
            ),
            // FutureBuilder<Map<String, dynamic>?>(
            //   future: AppointmentController.listappointment(userId, clinicId,patientId,startDate),
            //   builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            //     final Map<String, dynamic> data = snapshot.data!;
            //     ListAppointmentModel user = data['user'];
            //     appointmentCount = user.result!.length;
            //     return Text('$appointmentCount');
            //   },
            // ),

          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    child: Image.asset(
      urlImage,
      fit: BoxFit.fill,
    ),
  );
}
