import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/controller/patientcontroller.dart';
import 'package:project1/pages/home/patients/patientlist.dart';

class AddPatients extends StatefulWidget {
  final String clinicId;
  final String userId;

   AddPatients({
     super.key,
     required this.clinicId,
     required this.userId
   });

  @override
  State<StatefulWidget> createState() {
    return _AddPatientsState(userId: this.userId, clinicId: this.clinicId);
  }
}

class _AddPatientsState extends State<AddPatients> {
  String userId, clinicId;

  _AddPatientsState({
    required this.clinicId,
    required this.userId
  });

  final PatientController = Get.put(patientController());

  final nameTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final addressTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? profilePicture;
  bool isSelected = false;
  String? name, registrationId, mobile;
  String email = "", address = "", age = "";
  String dateOfBirth = "";
  String gender = "";

  DateTime selectedDate = DateTime.now();
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF01BFE1),
        title: const Text("doctosmart"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                const Text(
                  " Add Patients",
                  style: TextStyle(fontSize: 20, color: Color(0xFF01BFE1)),
                ),
                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    _showPicker(context);
                  },
                  child: Center(
                    child: CircleAvatar(
                    backgroundColor: isSelected ? Colors.blue : Colors.white,
                    radius: 50,
                      child: profilePicture != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              profilePicture!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                          : Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(238, 255, 249, 2),
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Color.fromRGBO(0, 191, 225, 1),
                            ),
                          ),
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                //fullname
                Container(
                  child: const Text(
                    ' Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: TextFormField(
                      controller: nameTextController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      onSaved: (value) => name = value!,
                      validator: (value) => value!.isEmpty ? "Please enter fullname" : null,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(0, 191, 225, 0.5),
                        filled: true,
                        border: InputBorder.none,
                      ),

                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                //mobile
                Container(
                  child: const Text(
                    ' Mobile No',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: TextFormField(
                      controller: mobileTextController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      onSaved: (value) => mobile = value!,
                      validator: (value) => value!.isEmpty ? "Please enter mobile" : null,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(0, 191, 225, 0.5),
                        filled: true,
                        border: InputBorder.none,
                      ),

                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                //age
                Container(
                  child: const Text(
                    ' Age',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: TextFormField(
                      controller: ageTextController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      onSaved: (value) => age = value!,
                      validator: (value) => value!.isEmpty ? "Please enter age" : null,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(0, 191, 225, 0.5),
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                //Email
                Container(
                  child: const Text(
                    ' E-mail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: TextFormField(
                      controller: emailTextController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      onSaved: (value) => email = value!,
                      validator: (value) => value!.isEmpty ? "Please enter email" : null,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(0, 191, 225, 0.5),
                        filled: true,
                        border:InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                //address
                Container(
                  child: const Text(
                    ' Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: TextFormField(
                      controller: addressTextController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      onSaved: (value) => address = value!,
                      validator: (value) => value!.isEmpty ? "Please enter address" : null,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(0, 191, 225, 0.5),
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                //dob
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [

                        Container(
                          child: const Text(
                            ' DOB',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8,),

                        GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Card(
                              color: const Color.fromRGBO(0, 191, 225, 0.5),
                              child: Center(
                                child: Text(
                                  '${selectedDate.toLocal()}'.split(' ')[0],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),

                          ),
                        ),

                      ],
                    ),

                    const SizedBox(width: 8,),

                    Column(
                      children: [

                        Container(
                          child: const Text(
                            ' Gender',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8,),

                        Row(
                           children: [

                            GenderButton(
                              label: 'M',
                              isSelected: selectedGender == 'M',
                              onSelected: () => _onGenderSelected('M'),
                            ),
                            const SizedBox(width: 20),
                            GenderButton(
                              label: 'F',
                              isSelected: selectedGender == 'F',
                              onSelected: () => _onGenderSelected('F'),
                            ),

                          ],
                        ),

                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 8,),


                Container(
                  child: Card(
                    color: const Color(0xFF01BFE1),
                    child: ElevatedButton(
                      onPressed: () {
                        _addPatient(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child:const Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white),
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

  void _onGenderSelected(String gender) {
    setState(() {
      selectedGender = gender;
    });
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
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            )),
                        onTap: () {
                          setState(() {
                            //       imageSelectPic();
                          });

                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),

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
      profilePicture = File(image!.path);
    });
  }
  _imgFromGallery() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      profilePicture = File(image!.path);
    });
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateOfBirth = selectedDate.year.toString() +
            "-" +
            selectedDate.month.toString() +
            "-" +
            selectedDate.day.toString();
      });

    print(dateOfBirth);
  }

  Future _addPatient(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final Future<Map<String, dynamic>>
      successfulMessage = PatientController.addpatient(
          name!,
          dateOfBirth,
          email,
          mobile!,
          address,
          gender,
          age,
          clinicId,
          userId,
          profilePicture
      );
      successfulMessage.then((response)  {
        print("response :" + response.toString());
          Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (context) =>  PatientDash(userId: userId, clinicId: clinicId, patientId: '',)
          ),
          );
        }
      );
    }


  }




}


class GenderButton extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onSelected;

  const GenderButton({
    required this.isSelected,
    required this.label,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 80,
        height: 50,
        child: Card(
            color: isSelected ? const Color.fromRGBO(0, 191, 225, 0.5) : Colors
                .white,
            child: Center(child: Text(label))
        ),
      ),
    );
  }
}