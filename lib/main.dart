import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(const BasketballLiveScoreApp());
}

class BasketballLiveScoreApp extends StatelessWidget {
  const BasketballLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

  class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //
  // Map<String, dynamic> scoresMap = {};
  //
  // Future<void> getDataFromFirebase() async {
  //   CollectionReference basketBallRef = firestore.collection('basketball');
  //   final DocumentReference docReference = basketBallRef.doc('1_ban_vs_ind');
  //   final data = await docReference.get();
  //   final teamName = data.get('team_a');
  // }
  //
  // @override
  // void initState() {
  //   getDataFromFirebase();
  //   super.initState();
  // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Live score app'),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('basketball')
              .doc('1_ban_vs_ind')
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            print(snapshot.data?.data());
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if(snapshot.hasData){
                final score = snapshot.data!;
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                      Text(
                      score.get('match_name'), style: Theme.of(context).textTheme.headlineMedium,),
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                            score.get('score_team_a').toString(), style: Theme.of(context).textTheme.titleLarge,),
                              Text(
                                score.get('team_a'), style: Theme.of(context).textTheme.titleLarge,),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                            score.get('score_team_b').toString(), style: Theme.of(context).textTheme.titleLarge,),
                              Text(
                                score.get('team_b'), style: Theme.of(context).textTheme.titleLarge,),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              else{
                return const SizedBox();
              }
            }
            return const SizedBox();

          }
        ),
      );
    }
}
  