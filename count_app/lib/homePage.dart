import 'package:flutter/material.dart';

class Counter {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }
}

class HomePage extends StatefulWidget {
  //final Counter counter = Counter();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CV")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            // child: Text(
            //   "You have clicked the Add Button ${counter.count} times",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 25),
            // ),
            //),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<int>(
                valueListenable: counter.count,
                builder: (context, count, child) {
                  return Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                      //borderRadius: BorderRadius.circular(14)
                    ),
                    child: Text('$count',
                        style: TextStyle(
                            fontSize: 65, fontWeight: FontWeight.w700)),
                  );
                }),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter.increment();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(3.0, 4.0),
                      )
                    ], color: Colors.purpleAccent),
                    child: Text(
                      "Increment",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter.decrement();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(3.0, 4.0),
                      )
                    ], color: Colors.purpleAccent),
                    child: Text(
                      "Decrement",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ]),
      // floatingActionButton: FloatingActionButton.small(
      //     tooltip: 'increment',
      //     child: Icon(Icons.add),
      //     onPressed: null),
    );
  }
}
