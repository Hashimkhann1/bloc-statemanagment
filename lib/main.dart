import 'package:blockstatemanagment/utils/image_picker_utils.dart';
import 'package:blockstatemanagment/view/all_example_view/all_example_view.dart';
import 'package:blockstatemanagment/view/exapmle_two/example_two.dart';
import 'package:blockstatemanagment/view_model/bloc/counter_bloc/counter_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:blockstatemanagment/view_model/create_fav_list/create_fav_list.dart';
import 'package:blockstatemanagment/view_model/posts_view_model/posts_view_model.dart';
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
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(CreateFavList())),
        BlocProvider(create: (_) => PostBloc(PostsViewModel())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
           brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: AllExampleView()
      ),
    );
  }
}

