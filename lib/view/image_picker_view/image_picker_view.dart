import 'dart:io';

import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        children: [
          BlocBuilder<ImagePickerBloc , ImagePickerState>(builder: (context , state) {
            return Container(
              width: width,
              height: height * 0.44,
              alignment: Alignment.center,
              child: state.file != null ? Image.file(File(state.file!.path.toString())) : Text(
                'Image is not selected',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          }),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickImageFromCamra());
                },
                  child: Icon(
                Icons.photo_camera_sharp,
                size: 36,
                color: Colors.black54,
              )),
              SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickImageFromGallery());
                },
                  child: Icon(
                Icons.image_rounded,
                size: 36,
                color: Colors.black54,
              )),
            ],
          )
        ],
      ),
    );
  }
}
