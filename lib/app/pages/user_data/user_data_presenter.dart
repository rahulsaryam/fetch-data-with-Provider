import 'package:fetch_api_with_block/domain/domain.dart';

class UserDataPresenter{
  final AuthUseCases _authUseCases;
  UserDataPresenter(this._authUseCases);
  Future<List<UserData>> allPersonData() async {
    return await _authUseCases.allPersonData();
  }

  Future<Map<String, dynamic>> onePersonData(int num) async {
    return await _authUseCases.onePersonData(num);
  }
}