import 'package:flutter/material.dart';
import 'package:project1/pages/home/patients/tabs/attachment/addattachment.dart';

class Attachment extends StatefulWidget {
  final String clinicId, userId, patientId, patientName;

  const Attachment({
    super.key,
    required this.clinicId,
    required this.userId,
    required this.patientId,
    required this.patientName
  });

  @override
  State<Attachment> createState() => _AttachmentState();
}

class _AttachmentState extends State<Attachment> {


  @override
  Widget build(BuildContext context) {
    String patientName = widget.patientName;
    String patientId = widget.patientId;
    String clinicId = widget.clinicId;
    String userId = widget.userId;
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
                        builder: (context) => AddAttachment(clinicId: clinicId , patientId: patientId, userId: userId, patientName: patientName,
                        ),
                      ),
                      );
                    },
                    child: Text('Add Attachent'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF01BFE1)),
                    ),
                  )
                ],
              ),
              Text(
                'Attachents',
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
