abstract class DomainRepository{
  Future<dynamic> allPersonData();
  Future<dynamic> onePersonData(int num);
}