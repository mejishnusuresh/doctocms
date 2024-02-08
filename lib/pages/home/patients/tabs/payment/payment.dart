import 'package:flutter/material.dart';
import 'package:project1/pages/home/patients/tabs/payment/addpayment.dart';

class Payment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  const Payment({
    super.key,
    required this.clinicId,
    required this.userId,
    required this.patientId,
    required this.patientName
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    String patientName = widget.patientName;
    String patientId = widget.patientId;
    String clinicId = widget.clinicId;
    String userId = widget.userId;
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
                        builder: (context) => AddPayment(clinicId: clinicId, patientId: patientId, userId: userId, patientName: patientName,
                        ),
                      ),
                      );
                    },
                    child: Text('Add Payments'),
                    style: ElevatedButton.styleFrom(primary: Color(0xFF01BFE1)),
                  )
                ],
              ),
              Text(
                'Payments',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 12, 134, 134)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
