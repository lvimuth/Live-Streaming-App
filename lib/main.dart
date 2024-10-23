import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_stream_app/firebase_options.dart';
import 'package:live_stream_app/pages/auth/login.dart';
import 'package:live_stream_app/pages/home_page.dart';
import 'package:live_stream_app/services/auth.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ZegoUIKit().initLog().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.dark,
      ),
      home: ZegoUIKitPrebuiltLiveStreamingMiniPopScope(
        child: AuthService().getCurrentUser() != null
            ? HomePage()
            : const LoginPage(),
      ),
    );
  }
}
