import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:twitter_clone/Utilities/Constants/colors.dart';
import 'package:twitter_clone/Utilities/Constants/strings.dart';
import 'package:twitter_clone/View/AuthenticationPages/welcomePageView.dart';
import 'package:twitter_clone/ViewModel/Functions/HexColor.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_title_txt,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor(twitter_color)),
        useMaterial3: true,
      ),
      home: const welcomePageView(),
    );
  }
}

