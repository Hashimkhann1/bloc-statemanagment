import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EqutableTesting extends StatelessWidget {
  const EqutableTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person person = Person(name: 'Hashim', age: 21);
          Person person1 = Person(name: 'Hashim', age: 21);

          // print(person.hashCode.toString());
          // print(person1.hashCode.toString());
          print(person == person1);
          print(person.hashCode);
          print(person1.hashCode);
          // print(person.name.hashCode);
          // print(person.age.hashCode);
          // print(person.name.hashCode^person.age.hashCode);
          // print(person.hashCode);
        },
      ),
    );
  }
}



class Person extends Equatable {

  final String name;
  final int age;

  Person({required this.name,required this.age});

  @override
  List<Object?> get props => [name , age];



  // @override
  // bool operator ==(Object other){
  //   return identical(this, other) ||
  //       other is Person &&
  //       runtimeType == other.runtimeType &&
  //       name == other.name &&
  //       age == other.age;
  // }
  //
  // @override
  // int get hashCode => name.hashCode ^ age.hashCode;

}
