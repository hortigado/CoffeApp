import 'package:coffeapp/models/coffeModel.dart';
import 'package:coffeapp/services/database.dart';
import 'package:get/get.dart';

class CoffesController extends GetxController {
  List<CoffeModel> list;
  List<CoffeModel> get coffe => list;
  final index = 0.obs;
  final front = 0.obs;
  RxBool hide = false.obs;
  @override
  void onInit() async {
    list = await Database().getCoffes();

    update();
    super.onInit();
  }
}
