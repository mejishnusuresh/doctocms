import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';

class DoctorDash extends StatefulWidget {
  final String clinicId;
  final String userId;

   DoctorDash({
    super.key,
    required this.userId,
    required this.clinicId,
   });

  @override
  State<StatefulWidget> createState() {
    return _DoctorDashState(
      userId: userId,
      clinicId: clinicId,
    );
  }
}

class _DoctorDashState extends State<DoctorDash> {
  String userId, clinicId;
  List<String> doctorNames = [];

  _DoctorDashState({required this.clinicId, required this.userId});

  final DoctorController = Get.put(doctorController());

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    final Map<String, dynamic>? data = await DoctorController.listdoctor(userId, clinicId);
    if (data != null && data['user'] != null) {
      final ListDoctorModel user = data['user'];
      setState(() {
        doctorNames = user.result!.map((doctor) => doctor.doctorName.toString()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('doctosmart'),
        backgroundColor: const Color(0xFF01BFE1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: const Text(
              "DOCTORS",
              style: TextStyle(fontSize: 20, color: Color(0xFF01BFE1)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  FutureBuilder<Map<String, dynamic>?>(
                    future: DoctorController.listdoctor(userId, clinicId),
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Scaffold(
                            body: Center(
                              child: Text('Oops, no internet'),
                            ),
                          );
                        }
                        if (snapshot.data == null) {
                          return const Scaffold(
                            body: Center(
                              child: Text('Data is null'),
                            ),
                          );
                        }

                         final Map<String, dynamic> data = snapshot.data!;
                          ListDoctorModel user = data['user'];

                          return ListView.builder(
                            itemCount: user.result!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          user.result![index].doctorName.toString()
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                      } else {

                        return Container(
                          child: const LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(0, 191, 225, 1),
                            valueColor: AlwaysStoppedAnimation(
                              Color.fromRGBO(135, 206, 235, 1),
                            ),
                            minHeight: 5,
                          ),
                        );
                      }
                    },
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
