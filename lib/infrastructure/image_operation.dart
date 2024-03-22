import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();

class PickImage {
  Future<XFile?> image = picker.pickImage(source: ImageSource.gallery);
}
