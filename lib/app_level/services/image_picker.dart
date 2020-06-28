import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._();

  static final picker = ImagePicker();

  static Future<File> getImage() async {
    File _image;

    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    return _image;
  }
}
