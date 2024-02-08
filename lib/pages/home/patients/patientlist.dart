import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/patientcontroller.dart';
import 'package:project1/model/patient/deletepatientmodel.dart';
import 'package:project1/model/patient/listpatientmodel.dart';
import 'package:project1/pages/home/patients/addpatients.dart';
import 'package:project1/pages/home/patients/patientdetails.dart';

class PatientDash extends StatefulWidget {
  final String clinicId;
  final String userId;
  final String patientId;

  const PatientDash({
    super.key,
    required this.userId,
    required this.clinicId,
    required this.patientId,
  });

  @override
  State<StatefulWidget> createState() {
    return _PatientDashState(
      userId: userId,
      clinicId: clinicId,
      patientId: patientId,
    );
  }
}

class _PatientDashState extends State<PatientDash> {
  String userId, clinicId,patientId;
  String searchQuery = '';
  bool isSearching = false;
  bool showDialogFlag = false;

  List<ListPatientModel> filteredPatients = [];

  _PatientDashState({
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  final PatientController = Get.put(patientController());

  int currentPage = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: isSearching
            ?
        TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
              filterPatients();
            });
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        )
            :
        const Text('doctosmart'),
        backgroundColor: const Color(0xFF01BFE1),
        actions: [
          isSearching
              ?
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                isSearching = false;
                searchQuery = '';
                filteredPatients.clear();
              });
            },
          )
              :
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => AddPatients(clinicId: clinicId, userId: userId),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF6F6FE),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              "PATIENTS",
              style: TextStyle(fontSize: 20,color: Color(0xFF01BFE1)),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8,top: 10,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  FutureBuilder<Map<String, dynamic>?>(
                    future: PatientController.listpatient(userId, clinicId),
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
                        ListPatientModel user = data['user'];
                        return ListView.builder(
                          itemCount: isSearching
                              ? filteredPatients.length
                              : user.result!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print(user.result!.length);
                            final patient = isSearching
                                ? filteredPatients[index]
                                : user.result![index];
                            return Container(
                              child: InkWell(
                                onLongPress: (){
                                  _showDeleteConfirmationDialog();
                                },
                                onTap: () {
                                  var doctorName;
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => PatientDetails(
                                        patientName: user.result![index].patientName.toString(),
                                        clinicId: clinicId,
                                        userId: userId,
                                        patientId: user.result![index].id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.white,
                                  elevation: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(20),
                                            width: 50,
                                            height: 50,
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                                bottomRight: Radius.circular(30),
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              ),
                                              child: Container(
                                                color: Colors.blue,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    user.result![index]
                                                        .patientName![0]
                                                        .toUpperCase(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(user.result![index].patientName
                                                  .toString()),
                                              Text(user.result![index].mobileNo
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterPatients() {
    if (searchQuery.isEmpty) {
      filteredPatients.clear();
    } else {
      // filteredPatients = user.result!
      //     .where((patient) =>
      //     patient.patientName!.toLowerCase().contains(searchQuery.toLowerCase())).cast<PatientModel>()
      //     .toList();
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure to delete '),
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

                _deletePatient();

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

  void _deletePatient() async {
    try {
      final response = await patientController().deletepatient(userId, clinicId, patientId);

      if (response['status']) {
        final DeletePatientModel user = response['user'];

      } else {
        final String errorMessage = response['message'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred while deleting the patient.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }


}