


import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {

  ImagePickerEvent();

  @override
  List<Object> get props => [];

}


class PickImageFromCamra extends ImagePickerEvent{}

class PickImageFromGallery extends ImagePickerEvent{}