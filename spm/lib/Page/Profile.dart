import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import 'package:spm/Page/signup.dart';
import '../widgets/column_widget.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool obscurePw = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(252, 68, 5, 215),
      body: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
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
                      "Profile",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ]))),
    ));
  }
}
