import 'package:flutter/material.dart';
import 'package:spm/Page/Feedback.dart';
import 'package:spm/Page/Announcement.dart';
import 'package:spm/Page/login.dart';
import 'package:spm/Page/Message.dart';
import 'package:spm/Page/Profile.dart';
import 'package:spm/Page/Complaint.dart';
import 'package:spm/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Page/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      routes: {MyRoutes.loginPage: (context) => LoginPage()},
    );
  }
}
