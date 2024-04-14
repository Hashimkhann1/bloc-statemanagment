import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_event.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if(state.toDosList.isEmpty){
            return Center(
              child: Text('No todo found',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            );
          }
          return ListView.builder(
              itemCount: state.toDosList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(4),
                  color: Colors.black38,
                  child: ListTile(
                    title: Text(state.toDosList[index].toString(), style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                    trailing: InkWell(onTap: () {
                      context.read<ToDoBloc>().add(RemoveTodoEvent(removeIndex: index));
                    }, child: Icon(Icons.delete, color: Colors.white,)),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          for(int i = 0; i < 10; i++){
          context.read<ToDoBloc>().add(AddTodoEvent(task: 'Task: ' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
