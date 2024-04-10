


import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerEvent extends Equatable {

  ImagePickerEvent();

  @override
  List<Object> get props => [];

}


class PickImageFromCamra extends ImagePickerEvent{}

class PickImageFromGallery extends ImagePickerEvent{}