import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spm/Page/login.dart';
import '../widget/circularMessage.dart';
import '../widget/showDialog.dart';
import '../widgets/column_widget.dart';
import 'package:http/http.dart';

//creating class Signuppage
class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String password1 = "";

  String password2 = "";

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  // var listCheck = [1];
  bool networkCheck = false;

  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController userNameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmPasswordController =
        new TextEditingController();

    Future SignUp() async {
      Response response =
          await post(Uri.parse("http://192.168.43.163:5000/api/user/"),
              body: jsonEncode({
                "user_name": userNameController.text,
                "user_email": emailController.text,
                "user_password": passwordController.text
              }),
              headers: {"Content-Type": "application/json"});
      // listCheck.clear();
      // listCheck.add(response);
      // if(response.body["success"] )

      var body = json.decode(response.body);
      print(body);
      // print(body["success"]);
      if (body["success"] == 1) {
        return true;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Successfully Signed up")));
        // return showErrorMessage(context,
        //     message:
        //         "Successfully created a new user called ${userNameController.text}",
        //     errorType: "Validation Error");
      }
      if (body["success"] == 0) {
        return showErrorMessage(context,
            message: body["data"], errorType: "Validation Error");
      } else {
        return showErrorMessage(context,
            message: "Something went wrong", errorType: "Validation Error");
      }
    }

    void validation(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          networkCheck = true;
        });
        print("Successfully validated ");
        bool? responseMessage = await SignUp();
        setState(() {
          networkCheck = false;
        });
        if (responseMessage == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    }

    return SafeArea(
        child: networkCheck
            ? CircularMessage(
                message: "Validating User Data",
              )
            : Scaffold(
                key: scaffoldMessengerKey,
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
                                top: MediaQuery.of(context).size.height * 0.08,
                                right: 35,
                                left: 30),
                            child: Column(children: [
                              //Text field for Email
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email cannot be empty";
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                    // fillColor: Colors.grey.shade100,
                                    // filled: true,
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),

                              SizedBox(height: 24),

                              //Text field for Username
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "UserName cannot be empty";
                                  }
                                  return null;
                                },
                                controller: userNameController,
                                decoration: InputDecoration(
                                    // fillColor: Colors.grey.shade100,
                                    // filled: true,
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              SizedBox(height: 24),

                              //Text field for password
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password cannot be empty";
                                  }
                                  password1 = value;
                                  return null;
                                },
                                controller: passwordController,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),

                              SizedBox(height: 24),

                              //Text field for confirm
                              TextFormField(
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Confirm Password can't be empty";
                                  }
                                  if (password1 != value) {
                                    return "Password donot match";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),

                              SizedBox(
                                height: 48,
                              ),

                              //Creating create button
                              InkWell(child: StreamBuilder<Object>(
                                      // stream: ,
                                      builder: (context, snapshot) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 400,
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                );
                              }), onTap: () async {
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => LoginPage(),
                                //     ),
                                //     (Route<dynamic> route) => false);
                                // String url = "http://192.168.137.177:5000/api/user/";
                                return validation(context);

                                // if(body[])
                                // Uri uri = Uri.parse(url);
                                // var databody = {
                                //   'username': username,
                                //   'email': email,
                                //   'password': password
                                // };
                                // print(databody);
                                // // int statuscode = 0;
                                // // try {
                                // var response = await http.post(uri, body: databody);
                                // print(response.statusCode);
                                // print(response.statusCode);
                                // if (response.statusCode == 200) {
                                //   //Navigate to othe page
                                //   print('object');
                                // } else {
                                //   //Print error message
                                // }
                                // // } catch (e) {
                                // print("error: ");
                                // // print(e);
                                // // }
                                // // var response = await http.post(uri, body: databody);
                              }

                                  // print(emailController.text)
                                  // print("Elevate");
                                  )
                            ]),
                          )
                        ]),
                  )),
                ),
              ));
  }
}
