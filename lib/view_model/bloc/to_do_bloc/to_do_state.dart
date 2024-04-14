


import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{

  final List<String> toDosList;

  ToDoState({
    this.toDosList = const []
  });

  ToDoState copyWith({List<String>? toDosList}){
    return ToDoState(
      toDosList: toDosList ?? this.toDosList
    );
}

  @override
  List<Object> get props => [toDosList];

}