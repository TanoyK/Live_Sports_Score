import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const Text("Portugal vs Spain"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('football')
              .doc('portugal_vs_spain')
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
                      score.get('match_name'),
                      style: Theme.of(context).textTheme.headline4,
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
                              score.get('portugal_score').toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              score.get('team_a_name'),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Text('vs', style: TextStyle(fontSize: 30),),
                        Column(
                          children: [
                            Text(
                              score.get('spain_score').toString(),
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
              .doc('portugal_vs_spain')
              .update({'match_name': "Portugal vs Spain", 'spain_score': 1});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
