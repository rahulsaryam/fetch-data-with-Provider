import 'package:fetch_api_with_block/data/data.dart';
import '../models/one_data_model.dart';
import '../models/user_data_model.dart';

class Repository{
  Repository();
  Future<List<UserData>> allPersonData() async{
    final response = await DataRepository(ConnectHelper()).allPersonData();
    final userDataModelData = userDataFromJson(response.data!).toList();
    return userDataModelData;
  }

  Future<Map<String, dynamic>> onPersonData(int num) async {
    var response = await DataRepository(ConnectHelper()).onePersonData(num);
    var oneDataModel = oneDataFromJson(response.data!).toJson();
    return oneDataModel;
  }

}