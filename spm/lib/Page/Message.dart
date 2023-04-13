import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import '../widgets/column_widget.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child:SafeArea(
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
          SizedBox(height: 2),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                child: Text('Message',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ))),
          ]),
          SizedBox(height: 16),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0009,
                  right: 40,
                  left: 40),
              child: Column(children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    height: 400,
                    width: 360,
                  ),
                ),
      
                // SizedBox(height: 32),
      
                TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      // hintText: "Write your Feedback",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
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
              ]))
        ]),
      ),
    ));
  }
}
