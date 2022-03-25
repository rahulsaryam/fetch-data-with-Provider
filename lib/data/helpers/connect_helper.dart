import 'package:fetch_api_with_block/app/app.dart';
import 'package:fetch_api_with_block/data/helpers/api_wrapper.dart';
import 'package:fetch_api_with_block/domain/domain.dart';

class ConnectHelper {
  final apiWrapper = ApiWrapper();

  Future<ResponseModel> allPersonData() async {
    return await apiWrapper.makeRequest(Request.get, NetworkConstants.baseUrl);
  }

  Future<ResponseModel> onePersonData(int num) async{
    return await apiWrapper.makeRequest(Request.put, 'https://jsonplaceholder.typicode.com/users/$num');
  }
}
