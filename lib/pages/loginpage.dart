import 'package:flutter/material.dart';
import 'package:project1/controller/logincontroller.dart';
import 'package:project1/model/auth/loginmodel.dart';
import 'home/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword=true;

  String? username,password,clinicId;
  String? patientId, startDate;

  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final clinicidTextController = TextEditingController();

  final LoginController=loginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/doctosmartlogo.png',
            width: 25.0,
            height: 25.0,
          ),
        ),
        title: const Text('doctosmart'),
        titleSpacing: 0,
        backgroundColor: Color(0xFF01BFE1),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              //logintext
              Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 18.0,
                  )
              ),

              const SizedBox(height: 20,),

              //username
              const Text("Username"),

              const SizedBox(height: 8,),

              Container(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                    controller: userTextController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    onSaved: (value) => username =value!,
                    validator: (value) =>
                    value!.isEmpty ? "Please enter username" : null,
                    decoration: InputDecoration(
                      fillColor:  const Color.fromRGBO(0, 191, 225,0.5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                ),
              ),

              const SizedBox(height: 8,),

              //password
              const Text("Password"),

              const SizedBox(height: 8,),

              Container(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                    controller: passwordTextController,
                    obscureText: isHiddenPassword,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    onSaved: (value) => password =value!,
                    validator: (value) =>
                    value!.isEmpty ? "Please enter password" : null,
                    decoration:  InputDecoration(
                      fillColor:  const Color.fromRGBO(0, 191, 225,0.5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon:InkWell(onTap: _togglepasswordview,
                        child: const Icon(Icons.visibility),
                      ),
                    ),
                ),
              ),

              const SizedBox(height: 8,),

              //clinicid
              const Text("Clinic Id"),

              const SizedBox(height: 8,),

              Container(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                    controller: clinicidTextController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    onSaved: (value) => clinicId =value!,
                    validator: (value) =>
                    value!.isEmpty
                      ? "Please enter clinic id"
                      : null,
                    decoration: InputDecoration(
                      fillColor:  const Color.fromRGBO(0, 191, 225,0.5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                ),
              ),

              const SizedBox(height: 20,),

              //loginbutton
              ElevatedButton(
                onPressed: () {
                  _gotoLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF01BFE1),
                ),
                child:const Center(
                  child: Text('Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      ),
    );
  }

  void _togglepasswordview() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
  void _gotoLogin() {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final Future<Map<String, dynamic>>
      successfulMessage = LoginController.login(username!,password!,clinicId!);
      print(username);
      successfulMessage.then((response)  {
        LoginModel user = response['user'];
        if(user.message=="Login Success") {
          Navigator.pushReplacement(
              context,MaterialPageRoute(
              builder: (context) =>  Dashboard(userId: user.result!.userId.toString(),clinicId: clinicId!, startDate: '', patientId: '', patientName: '',)
          )
          );
        }

        else{
          showDialog(
              context: context,builder: (context){
            return Dialog(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.message!,
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,width:100,
                          decoration: BoxDecoration(
                            color:  const Color.fromRGBO(207, 181, 59, 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                            child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.white),),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          );
        }
      }
      );
    }
  }

}


