


import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_event.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_state.dart';

class ToDoBloc extends Bloc<TodoEvent , ToDoState> {

  final List<String> todosList = [];

  ToDoBloc() : super(ToDoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }


  void _addTodoEvent(AddTodoEvent event , Emitter emit) {

    todosList.add(event.task);
    emit(state.copyWith(toDosList: List.from(todosList)));
    // emit(state.toDosList.remove());

  }


  void _removeTodoEvent (RemoveTodoEvent event , Emitter emit) {
    todosList.removeAt(event.removeIndex);
    emit(state.copyWith(toDosList: List.from(todosList)));
  }

}