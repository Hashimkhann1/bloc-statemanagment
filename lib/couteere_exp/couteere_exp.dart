import 'package:flutter/material.dart';

class CounterExp extends StatelessWidget {
  const CounterExp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black38
                  ),
                  child: Text(
                    'Increment',
                    style: TextStyle(fontSize: 20,color: Colors.cyanAccent),
                  ),
                ),
                SizedBox(width: 10,),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black38
                  ),
                  child: Text(
                    'Dcrement',
                    style: TextStyle(fontSize: 20,color: Colors.cyanAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
