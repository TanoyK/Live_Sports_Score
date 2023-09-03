
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sports_14/first_screen.dart';
import 'package:flutter_firebase_sports_14/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Football Match List",style: TextStyle(fontWeight: FontWeight.w800), ),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              ListTile(
                  title: const Text("Bangladesh vs Italy",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) =>const FirstScreen())
                        );
                      },
                      icon: const Icon(
                      Icons.arrow_forward_ios
                      )
                  )
              ),
              ListTile(
                  title: const Text("Portugal vs Spain",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) =>const SecondScreen()));
                      }, icon: const Icon(
                      Icons.arrow_forward_ios
                  )
                  )
              ),

            ],
          ),
        )
    );
  }
}
