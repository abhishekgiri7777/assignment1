import 'package:assignment1/controller/home_controller/home_controller.dart';
import 'package:assignment1/core/theme/color_theme.dart';
import 'package:assignment1/widget/custom_text_widget.dart';
import 'package:assignment1/widget/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  RxInt selectedIndex = 0.obs;

  List<String> status = ["Upcoming", "Past"].obs;

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                CustomText(
                    text: "Schedule",
                    fontSize: 30.px,
                    fontWeight: FontWeight.w600),
                Spacer(),
                Icon(Icons.notifications_none_outlined)
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.all(2),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Obx(() => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: status
                      .asMap()
                      .entries
                      .map((e) => GestureDetector(
                            onTap: () => {selectedIndex.value = e.key},
                            child: Container(
                              width: selectedIndex.value == e.key ? 50.w : 35.w,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: selectedIndex.value == e.key
                                      ? MyColors.whiteColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: CustomText(
                                    text: e.value,
                                    fontWeight: selectedIndex.value == e.key
                                        ? FontWeight.w700
                                        : FontWeight.w300,
                                    fontSize: 14.px,
                                    color: selectedIndex.value == e.key
                                        ? Colors.black
                                        : Colors.black),
                              ),
                            ),
                          ))
                      .toList())),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: controller.schedule
                      .asMap()
                      .entries
                      .map((e) => GestureDetector(
                            onTap: () => {bottomSheetSelector(context)},
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ScheduleWidget(scheduleModel: e.value)),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomSheetSelector(BuildContext context) {
    return showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStates) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      CustomText(
                        text: "Summery",
                        fontSize: 24.px,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      Spacer(),
                      CustomText(
                        text: "Cancel",
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(controller
                                      .schedule[0].doctorImage
                                      .toString()),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          controller.schedule[0].isAvailable == true
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.green,
                                    child: Center(
                                      child: Icon(
                                        Icons.videocam_rounded,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ))
                              : SizedBox()
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text:
                                  controller.schedule[0].doctorName.toString(),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.px),
                          CustomText(
                            text: controller.schedule[0].doctorDepartment
                                .toString(),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.px,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }
}
