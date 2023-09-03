import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sports_14/firebase_options.dart';
import 'package:flutter_firebase_sports_14/home_screen.dart';


Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Sports',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeScreen(),
    );
  }
}
