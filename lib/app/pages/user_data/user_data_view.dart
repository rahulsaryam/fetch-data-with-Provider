import 'package:fetch_api_with_block/app/app.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserData extends StatelessWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Person Data'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => UserDataProvider(Get.put(UserDataPresenter(Get.put(AuthUseCases(Get.put(Repository())))))),
        child: Builder(
          builder: (BuildContext context) {
            final model = Provider.of<UserDataProvider>(context);
            if (model.userState == UserState.loading){
              return const Center(child: CircularProgressIndicator(),);
            }
            final listData = model.data;
            return ListView.builder(
                itemCount: listData.length,
                itemBuilder: (controller, index) {
                  return ListTile(
                    onTap: (){
                      // AuthUseCases(Get.put(Repository())).onePersonData(index+1);
                      OneUserDataProvider(Get.find()).getData(index+1);
                      Get.to(const OneUserData());
                    },
                    title: Text(
                        listData[index].name.toString()),
                    subtitle: Text(
                        listData[index].email.toString()),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${DateTime.now().hour.toString()}: ${DateTime.now().minute.toString()}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Text(listData[index].id
                              .toString()),
                        )
                      ],
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        listData[index].name
                            .toString()
                            .substring(0, 1),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                });
          },
        ),
        ),
      ),
    );
  }
}
