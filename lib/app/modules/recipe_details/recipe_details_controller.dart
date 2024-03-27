import 'package:appebite/app/data/model/recipe.dart';
import 'package:get/get.dart';

class RecipeDetailsController extends GetxController {
  // We will initialize this object from the arguments passed when navigating to it's view
  late Recipe recipe;

  @override
  void onInit() {
    // This function will be called as soon as this controller's object is initialised
    super.onInit();
    recipe = Get.arguments['recipe'];
  }
}
