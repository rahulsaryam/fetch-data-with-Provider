import 'package:fetch_api_with_block/data/helpers/connect_helper.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:flutter/material.dart';

class DataRepository extends DomainRepository{
  final ConnectHelper connectHelper;
  DataRepository(this.connectHelper);

  @override
  Future<ResponseModel> allPersonData() async {
    final response = await ConnectHelper().allPersonData();
    return response;
  }

  @override
  Future onePersonData(int num)async{
    final response = await ConnectHelper().onePersonData(num);
    return response;
  }
}