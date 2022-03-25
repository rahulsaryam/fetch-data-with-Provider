
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/pages/user_data/user_data.dart';

void main(){
  runApp(const GetMaterialApp(
    home: UserData(),
  ));
}