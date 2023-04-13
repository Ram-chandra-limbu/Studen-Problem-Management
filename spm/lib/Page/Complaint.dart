import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import '../widgets/column_widget.dart';

class ComplaintPage extends StatelessWidget {
  ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Back")),
            Image.asset("assets/image/1.png", width: 100)
          ],
        ),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text('Complaint',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ))),
          ],
        ),
        SizedBox(height: 48),
        Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                right: 40,
                left: 40),
            child: Column(children: [
              // TextField(
              // decoration: InputDecoration(
              //           fillColor: Colors.grey.shade100,
              //           filled: true,
              //           hintText: "Enter Your Name",
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(10))),
              //     ),

              // Welcome text
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                  child: Text('Previous Conplaint',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ]),

              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  alignment: Alignment.center,
                  height: 260,
                  width: 360,
                ),
              ),

              TextField(
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Write your Complaint",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),

              SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16)),
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  child: Text(
                    "Sent",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  print("Elevate");
                },
              ),
            ]))
      ])),
    ));
  }
}
