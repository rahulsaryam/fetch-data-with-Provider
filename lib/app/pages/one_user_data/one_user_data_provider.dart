import 'package:flutter/cupertino.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:fetch_api_with_block/app/app.dart';

class OneUserDataProvider extends ChangeNotifier{
  late final UserDataPresenter _userDataPresenter;
  OneUserDataProvider(this._userDataPresenter){
    getData(num);
  }
  late UserState _userState = UserState.initial;
  UserState get userState => _userState;
  var data;
  void getData(num) async{
    _userState = UserState.loading;
    data = await _userDataPresenter.onePersonData(num);
    _userState = UserState.loaded;
    notifyListeners();
  }

}