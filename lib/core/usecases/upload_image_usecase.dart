import 'package:image_picker/image_picker.dart';
import 'package:shop/core/usecases/app_usecases.dart';

class UploadImageUseCase extends AppAsyncUseCase<List<String>, NoParams> {
  final ImagePicker picker = ImagePicker();

  @override
  Future<List<String>> execute(params) async {
    List<String> imagePaths = [];
    try {
      final pickedFiles = await picker.pickMultiImage(imageQuality: 50);
      imagePaths = pickedFiles.map((file) => file.path).toList();
    } catch (e) {
      throw Exception();
    }
    return imagePaths;
  }
}
