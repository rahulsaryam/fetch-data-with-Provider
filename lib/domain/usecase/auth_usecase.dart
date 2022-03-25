import 'package:fetch_api_with_block/domain/domain.dart';

class AuthUseCases{
  final Repository repository;
  AuthUseCases(this.repository);
  Future<List<UserData>> allPersonData()async {
    var data = await repository.allPersonData();
    return data;
  }

  Future<Map<String, dynamic>> onePersonData(int num) async {
    print(num);
    var data = await repository.onPersonData(num);
    print(data);
    return data;
  }
}