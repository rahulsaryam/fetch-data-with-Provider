import 'package:fetch_api_with_block/app/app.dart';
import 'package:get/get.dart';
import 'package:fetch_api_with_block/domain/domain.dart';

class UserDataBinding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => UserDataProvider(Get.put(UserDataPresenter(Get.put(AuthUseCases(Get.put(Repository())))))));
  }
}