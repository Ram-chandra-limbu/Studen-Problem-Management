import 'package:flutter/material.dart';
import 'package:spm/Page/Home.dart';
import '../widgets/column_widget.dart';

class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

      SizedBox(height: 10),
      // Welcome text
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          child: Text('Announcemet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ]),
      SizedBox(height: 8),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            height: 500,
            width: 360,
          ),
        ),
      ]),
    ])));
  }
}
