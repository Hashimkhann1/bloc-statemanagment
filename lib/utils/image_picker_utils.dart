


import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final ImagePicker _imagePicker = ImagePicker();

  ///// pick image from camra
  Future<XFile?> camraImagePicker() async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

}