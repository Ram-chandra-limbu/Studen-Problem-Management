import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import 'package:spm/Page/signup.dart';
import 'package:spm/routes/routes.dart';
import 'package:spm/widget/showDialog.dart';
import '../widgets/column_widget.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  validator(context) {
    if (_formKey.currentState!.validate()) {
      print("validation succeess");
      fetchData();
    }
  }

  fetchData() async {
    Response response = await post(
        Uri.parse("http://192.168.43.163:5000/api/user/login"),
        body: jsonEncode({
          "user_email": emailController.text,
          "user_password": passwordController.text
        }),
        headers: {"Content-Type": "application/json"});
    var body = jsonDecode(response.body);
    // var json = jsonDecode(source
    if (body["success"] == 0) {
      return showErrorMessage(context,
          message: body["data"], errorType: "error Message");
    }
    if (body["success"] == 1) {
      print("SUcecss");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  bool obscurePw = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(217, 99, 78, 148),
            body: Container(
              constraints: BoxConstraints.expand(),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 0),

                      //countainer for login

                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(80),
                                  bottomRight: Radius.circular(80))),
                          alignment: Alignment.center,
                          height: 200,
                          width: 400,
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),

                      //giving style
                      Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.10,
                              right: 40,
                              left: 40),
                          child: Column(children: [
                            //Creating Text field for Email
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email field cannot be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(height: 48),

                            //Creating Text field for password
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty.";
                                }
                                return null;
                              },
                              obscureText: obscurePw,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.blue)),
                                suffixIcon: InkWell(
                                    onTap: () =>
                                        setState(() => obscurePw = !obscurePw),
                                    child: Icon(Icons.lock)),
                                hintText: "Password",
                              ),
                            ),

                            SizedBox(height: 3),

                            //Textbutton for forgot password
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Text('Forgot Password'),
                                    onTap: () {},
                                  ),
                                ]),

                            SizedBox(height: 64),

                            //Creating login buttion using container
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                height: 60,
                                width: 400,
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              onTap: () {
                                validator(context);
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => Home()));
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Home(),
                                //     ),
                                //     (Route<dynamic> route) => false);
                                // print("Elevate");
                              },
                            ),

                            SizedBox(
                              height: 32,
                            ),

                            //text
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    child: Text("If you don't have account?"),
                                    onTap: () {},
                                  ),
                                ]),

                            SizedBox(
                              height: 8,
                            ),

                            //Creating crate button
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                height: 60,
                                width: 400,
                                child: Text(
                                  "Create",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupPage(),
                                    ),
                                    (Route<dynamic> route) => false);
                                print("Elevate");
                              },
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
            )));
  }
}
// }

// //Creating class login page inheriting from statelessWidget
// class LoginPage extends StatefulWidget {
  
//   @override
//   Widget build(BuildContext context) {
    
// }
