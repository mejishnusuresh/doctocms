import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/controller/tabcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/pages/home/patients/tabs/attachment/attachment.dart';

class AddAttachment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  AddAttachment({
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddAttachment> createState() => _AddAttachmentState(patientName: patientName, clinicId: clinicId, userId: userId, patientId: patientId);
}

class _AddAttachmentState extends State<AddAttachment> {
  String clinicId, userId, patientId, patientName;

  _AddAttachmentState({
    required this.patientName,
    required this.clinicId,
    required this.userId,
    required this.patientId,
  });

  String? valueChoose;
  String? selectedValue;
  String? valueChoose1;
  String? selectedValue1;
  File? fileUpload;
  String tab = 'attachment';
  String? doctorId;

  List listItem = [];

  List<String> categories = ["Xray", "Photo", "ECG"];

  final DoctorController = Get.put(doctorController());
  final TabController= Get.put(tabController());

  final _formKey = GlobalKey<FormState>();

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
                      "Add Attachment",
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

                Container(
                  child: const Text(
                    ' Category',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: DropdownButton<String?>(
                        value: selectedValue1,
                        onChanged: (String? newValue1) {
                          setState(() {
                            selectedValue1 = newValue1;
                          });
                        },
                        items: categories.map<DropdownMenuItem<String?>>((String value) {
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
                ),

                const SizedBox(height: 10),

                Center(
                    child: GestureDetector(
                      onTap: (){
                        _showPicker(context);
                      },
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Color.fromRGBO(0, 191, 225, 1),
                        size: 50,
                      ),
                    )
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
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSaveButtonPressed(){

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Future<Map<String, dynamic>>
      successfulMessage =
      TabController.addattachment(userId, clinicId, patientId);
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: const Color.fromRGBO(238, 255, 249, 2),
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: <Widget>[

                    ListTile(
                        leading: const Icon(
                          Icons.photo_library,
                          color: Color.fromRGBO(0, 191, 225, 1),
                        ),
                        title: const Text('File',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(66, 78, 98, 2),
                              letterSpacing: 1,
                              fontFamily: "QuicksandRegular",
                            )
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }
                    ),

                    ListTile(
                      leading: const Icon(
                        Icons.photo_camera,
                        color: Color.fromRGBO(0, 191, 225, 1),
                      ),
                      title: const Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(66, 78, 98, 2),
                          letterSpacing: 1,
                          fontFamily: "QuicksandRegular",
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      fileUpload = File(image!.path);
    });
  }
  _imgFromGallery() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      fileUpload = File(image!.path);
    });
  }

}
