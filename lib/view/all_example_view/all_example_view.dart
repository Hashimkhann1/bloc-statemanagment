import 'package:blockstatemanagment/view/couteere_exp/couteere_exp.dart';
import 'package:blockstatemanagment/view/exapmle_two/example_two.dart';
import 'package:blockstatemanagment/view/image_picker_view/image_picker_view.dart';
import 'package:blockstatemanagment/view/to_do_view/to_do_view.dart';
import 'package:flutter/material.dart';

class AllExampleView extends StatelessWidget {
  const AllExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Example Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterExp()));
            }, child: Text("Counter",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleTwo()));
            }, child: Text("Slider and Switch",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerView()));
            }, child: Text("Image Picker",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoView()));
            }, child: Text("To Do",style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }
}
