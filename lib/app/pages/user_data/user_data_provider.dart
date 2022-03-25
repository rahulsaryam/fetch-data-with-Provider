
import 'package:fetch_api_with_block/app/pages/user_data/user_data_presenter.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier{
  final UserDataPresenter _userDataPresenter;
  UserDataProvider(this._userDataPresenter){
    getData();
  }
  late UserState _userState = UserState.initial;
  UserState get userState => _userState;
  List<UserData> data = [];
  getData() async{
    _userState = UserState.loading;
    data = await _userDataPresenter.allPersonData();
    _userState = UserState.loaded;
    notifyListeners();
  }

}