import 'package:blockstatemanagment/view_model/bloc/counter_bloc/counter_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/counter_bloc/counter_event.dart';
import 'package:blockstatemanagment/view_model/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterExp extends StatelessWidget {
  const CounterExp({super.key});

  @override
  Widget build(BuildContext context) {
    print('build>>>>');
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Exfample"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc , CounterState>(builder: (context , state) {
              return Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 40),
              );
            }),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Text(
                    'Increment',
                    style: TextStyle(fontSize: 20,),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Text(
                    'Dcrement',
                    style: TextStyle(fontSize: 20,),
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
