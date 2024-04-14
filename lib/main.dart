import 'package:blockstatemanagment/utils/image_picker_utils.dart';
import 'package:blockstatemanagment/view/all_example_view/all_example_view.dart';
import 'package:blockstatemanagment/view/exapmle_two/example_two.dart';
import 'package:blockstatemanagment/view_model/bloc/counter_bloc/counter_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(),),
        BlocProvider(create: (_) => SliderBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (_) => ToDoBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: AllExampleView()
      ),
    );
  }
}

