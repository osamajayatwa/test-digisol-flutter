import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/home_controller.dart';
import 'package:test_digisol_flutter/core/class/handilingdataview.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';
import 'package:test_digisol_flutter/data/model/api_mpodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<HomeControllerImp>(HomeControllerImp());
    final widthSize = MediaQuery.of(context).size.width;
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('API Data'.tr),
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppColor.black,
              ),
              onPressed: () {
                controller.logOut();
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: controller.getdata,
          child: HandilingDataView(
            statusrequest: controller.statusRequest,
            widget: controller.apiData.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        width: widthSize,
                        color: AppColor.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello".tr),
                            SizedBox(
                              width: widthSize * 0.01,
                            ),
                            Text(controller.username!),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: controller.apiData.length,
                          itemBuilder: (context, index) {
                            ApiModel apiModel =
                                ApiModel.fromJson(controller.apiData[index]);
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Full Body'.tr),
                                        content: SingleChildScrollView(
                                          child: Text(apiModel.body ??
                                              'No Description'.tr),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                  color: AppColor.primaryColor),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(15),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColor.primaryColor,
                                    child: Text(
                                      apiModel.id.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    apiModel.title ?? 'No Title'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text(
                                    apiModel.body ?? 'No Description'.tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'No data available'.tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
