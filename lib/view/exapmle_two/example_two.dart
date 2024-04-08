import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_event.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_state.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_event.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleTwo extends StatelessWidget {
  const ExampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 2',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification'),
                BlocBuilder<SwitchBloc , SwitchState>(
                  buildWhen: (previous , current) => previous.isSwitch != current.isSwitch,
                    builder: (context , state) {
                  // print('build from switch ////////');
                  return Switch(value: state.isSwitch, onChanged: (val){
                    context.read<SwitchBloc>().add(EnableOrDisableNotification());
                  });
                }),
              ],
            ),
            SizedBox(height: 30,),
            BlocBuilder<SliderBloc , SliderState>(builder: (context , state) {
              // print('build from container color >>>');
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              );
            }),
            SizedBox(height: 50,),
            BlocBuilder<SliderBloc , SliderState>(builder: (context , state) {
              return Slider(value: state.sliderValue, onChanged: (val) {
                context.read<SliderBloc>().add(ChangeSliderPosition(slider: val));
              });
            }),
          ],
        ),
      ),
    );
  }
}
