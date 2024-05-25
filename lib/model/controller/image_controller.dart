import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class CameraController extends GetxController {
  var imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imagePath.value = image.path;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  void imageClear(){
    imagePath.value = "";
  }
}