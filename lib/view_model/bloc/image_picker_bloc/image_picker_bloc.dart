


import 'package:blockstatemanagment/utils/image_picker_utils.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:blockstatemanagment/view_model/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent , ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<PickImageFromCamra>(_pickImageFromCamra);
    on<PickImageFromGallery>(_pickImageFromGallery);
  }

  void _pickImageFromCamra(PickImageFromCamra event , Emitter emit) async {
    XFile? file = await imagePickerUtils.camraImagePicker();
    emit(state.copyWith(file: file));
  }

  void _pickImageFromGallery(PickImageFromGallery event , Emitter emit) async {
    XFile? file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }



}