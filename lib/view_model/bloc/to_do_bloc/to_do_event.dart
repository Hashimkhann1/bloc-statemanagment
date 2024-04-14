

import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {

  TodoEvent();

  @override
  List<Object> get props => [];

}


class AddTodoEvent extends TodoEvent{

  final String task;

  AddTodoEvent({
    required this.task
  });

}

class RemoveTodoEvent extends TodoEvent{

  final int removeIndex;
  RemoveTodoEvent({required this.removeIndex});

}