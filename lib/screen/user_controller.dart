import 'package:get/get.dart';
import 'package:user_api/model/user.dart';
import 'package:user_api/model/view_state.dart';
import 'package:user_api/network/user_network.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var state = ViewState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _getUsers();
  }

  void refreshUser() {
    _getUsers();
  }

  void _getUsers() {
    state.value = ViewState.loading;
    update();
    getUsers().then((response) {
      users.value = response;
      state.value = ViewState.success;
      update();
    }).catchError((err) {
      print(err);
      state.value = ViewState.failed;
      update();
    });
  }
}
