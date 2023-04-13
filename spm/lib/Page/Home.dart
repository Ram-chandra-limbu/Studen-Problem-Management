import 'package:flutter/material.dart';
import 'package:spm/Page/Announcement.dart';
import 'package:spm/Page/Complaint.dart';
import 'package:spm/Page/Feedback.dart';
import 'package:spm/Page/Message.dart';
import 'package:spm/Page/Profile.dart';
import '../widgets/column_widget.dart';
import 'package:http/http.dart' as http;

//Creating class Home
class Home extends StatelessWidget {
  Home({super.key});

  // register(String email, String username, String password) async {
  //   String url = "C:\Users\DELL\Desktop\Syp\mobilebackend";
  //   Uri uri = Uri.parse(url);
  //   var databody = {'username': username, 'email': email, 'password': password};

  //   var response = await http.post(uri, body: databody);

  //   print(response.statusCode);
  //   if(response.statusCode == 200){
  //     //Navigate to othe page
  //   }
  //   else{
  //     //Print error message
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(StadiumBorder())),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profilePage(),
                            ),
                            (Route<dynamic> route) => false);
                        print("Elevate2");
                      },
                      child: Icon(Icons.people))),
              Image.asset("assets/image/1.png", width: 100)
            ],
          ),
        ),

        SizedBox(
          height: 24,
        ),

        // Welcome text
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            child: Text('Welcome to Student problem',
                style: TextStyle(fontSize: 20)),
          ),
        ]),

        //text
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            child: Text('managemenet.com', style: TextStyle(fontSize: 18)),
          ),
        ]),

        Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0009,
                right: 40,
                left: 40),
            child: Column(children: [
              SizedBox(height: 24),

              //Creating Announcemnet button using Container
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 120,
                  width: 300,
                  child: Text(
                    "Announcement",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnouncementPage(),
                      ),
                      (Route<dynamic> route) => false);

                  print("Elevate1");
                },
              ),

              SizedBox(
                height: 16,
              ),

              //Creating Comlplaint button using Container
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 120,
                  width: 300,
                  child: Text(
                    "Complaint",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComplaintPage(),
                      ),
                      (Route<dynamic> route) => false);
                  print("Elevate2");
                },
              ),

              SizedBox(
                height: 16,
              ),

              //Creating Message button using Container
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 120,
                  width: 300,
                  child: Text(
                    "Message",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagePage(),
                      ),
                      (Route<dynamic> route) => false);
                  print("Elevate3");
                },
              ),

              SizedBox(
                height: 16,
              ),

              //Creating Feedback button using Container
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 120,
                  width: 300,
                  child: Text(
                    "Feedback",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackPage(),
                      ),
                      (Route<dynamic> route) => false);
                  print("Elevate4");
                },
              ),
            ]))
      ]),
    ));
  }
}
