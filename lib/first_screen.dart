

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const Text(
            "Bangladesh vs Italy"
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('football')
              .doc('bangladesh_vs_italy')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            print(snapshot.data?.data());
            if (snapshot.hasData) {
              final score = snapshot.data!;
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      score.get('match_names'),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              score.get('bangladesh_goals').toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              score.get('team_a_name'),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Text('vs',style: TextStyle(fontSize: 30),),
                        Column(
                          children: [
                            Text(
                              score.get('italy_goals').toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              score.get('team_b_name'),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('football')
              .doc('bangladesh_vs_italy')
              .update({'match_names': "Bangladesh VS Italy", 'italy_goals': 2});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
