import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/doctorcontroller.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';

class AddPayment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;
  const AddPayment({
    super.key,
    required this.clinicId,
    required this.patientId,
    required this.userId,
    required this.patientName,
  });

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {

  String? selectedValue;
  String? valueChoose;
  String? selectedValue1;
  String? doctorId;
  String tab = 'payment';


  List listItem = [];

  final DoctorController = Get.put(doctorController());

  List<String> invoice = [
    'INV107',
  ];

  final _formKey = GlobalKey<FormState>();

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Payment",
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
                    ' Invoice No',
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
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue1 = newValue;
                          });
                        },
                        items: invoice.map<DropdownMenuItem<String?>>((String value) {
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

                Container(
                  child: const Text(
                    ' Amount',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,

                    ),
                  ),
                ),

                const SizedBox(height: 10),

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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSaveButtonPressed() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ,
    //   ),
    // );
  }

}
