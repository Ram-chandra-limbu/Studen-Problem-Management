import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import '../widgets/column_widget.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text("Back")),
              Image.asset("assets/image/1.png", width: 100)
            ],
          ),
          // Welcome text
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              child: Text('Feedback',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ]),

          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                right: 40,
                left: 40),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 32),

              // Welcome text
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                  child: Text('Previous Feedback',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ]),

              // Container(
              //   decoration: BoxDecoration(
              //     border: Border(
              //         top: BorderSide(color: Colors.black, width: 1),
              //         left: BorderSide(color: Colors.black, width: 1),
              //         right: BorderSide(color: Colors.black, width: 1)),
              //   ),
              //   // alignment: Alignment.center,
              //   height: 260,
              //   width: 360,
              // ),

              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  alignment: Alignment.center,
                  height: 260,
                  width: 360,
                ),
              ),

              // SizedBox(height: 32),

              TextField(
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Write your Feedback",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)))),
              ),
              SizedBox(height: 48),
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
            ]),
          )
        ]),
      ),
    ));
  }
}
