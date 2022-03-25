import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:fetch_api_with_block/app/app.dart';

class OneUserData extends StatelessWidget {
  const OneUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('One User Data'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => UserDataProvider(Get.put(UserDataPresenter(Get.put(AuthUseCases(Get.put(Repository())))))),
        child: Builder(builder: (
            BuildContext context) {
          final model = Provider.of<UserDataProvider>(context);
          if (model.userState == UserState.loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          final listData = model.data;
          return  Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: Container(
                height: 200,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('rahul'),
                    Text('Saryam'),
                    Text('Flutter Deverloper')
                  ],
                ),
              ),
            ),
          );
        },

        )
         ,)

      ),
    );
  }
}
