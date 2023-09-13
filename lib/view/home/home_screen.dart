import 'package:assignment1/core/constants/static_image.dart';
import 'package:assignment1/core/theme/color_theme.dart';
import 'package:assignment1/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../widget/service_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Container(
              height: 55.h,
              width: 100.w,
              padding: EdgeInsets.only(top: 15.w, left: 10, right: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    MyColors.whiteColor,
                    MyColors.mainColor,
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(StaticImage.img2)),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.notifications_none_outlined),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Welcome!\nRajesh",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 30.px,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "How is it going today?",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 12.px,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: MyColors.hexToColor("#FD9E22"),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_alert,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Urgent Care",
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontSize: 15.px,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(StaticImage.img1),
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 40.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      CustomText(
                          text: "Our Service",
                          fontSize: 14.px,
                          fontWeight: FontWeight.w700),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.ourServiceList
                            .map((element) => Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 3),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  element.image.toString()),
                                              fit: BoxFit.fill)),
                                    ),
                                    CustomText(
                                        text: element.title.toString(),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.px)
                                  ],
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      CustomText(
                          text: "Appointment",
                          fontSize: 14.px,
                          fontWeight: FontWeight.w700),
                      SizedBox(height: 20),
                      ScheduleWidget(scheduleModel: controller.schedule[0]),
                      ScheduleWidget(scheduleModel: controller.schedule[0]),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(4),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.grey.withOpacity(0.5),
                      //             spreadRadius: 2,
                      //             blurRadius: 4,
                      //             offset: Offset(0, 3))
                      //       ]),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         height: 15.h,
                      //         width: 5,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(4),
                      //             bottomLeft: Radius.circular(4),
                      //           ),
                      //           color: Colors.deepPurple,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             CustomText(
                      //                 text: "Appointment date",
                      //                 color: Colors.grey,
                      //                 fontSize: 12.px),
                      //             SizedBox(height: 4),
                      //             Row(
                      //               children: [
                      //                 Icon(Icons.access_time, size: 18),
                      //                 SizedBox(width: 7),
                      //                 CustomText(
                      //                   text: controller
                      //                       .schedule[0].appointmentDate
                      //                       .toString(),
                      //                   color: Colors.black,
                      //                   fontSize: 14.px,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ],
                      //             ),
                      //             Container(
                      //                 margin: EdgeInsets.symmetric(
                      //                     vertical: 7, horizontal: 8),
                      //                 height: 1,
                      //                 width: 75.w,
                      //                 color: Colors.grey),
                      //             Row(
                      //               children: [
                      //                 Stack(
                      //                   children: [
                      //                     Container(
                      //                       height: 50,
                      //                       width: 50,
                      //                       decoration: BoxDecoration(
                      //                         shape: BoxShape.circle,
                      //                         image: DecorationImage(
                      //                             image: AssetImage(controller
                      //                                 .schedule[0].doctorImage
                      //                                 .toString()),
                      //                             fit: BoxFit.fill),
                      //                       ),
                      //                     ),
                      //                     Positioned(
                      //                         bottom: 0,
                      //                         right: 0,
                      //                         child: CircleAvatar(
                      //                           radius: 8,
                      //                           backgroundColor: Colors.green,
                      //                           child: Center(
                      //                             child: Icon(
                      //                               Icons.videocam_rounded,
                      //                               color: Colors.white,
                      //                               size: 12,
                      //                             ),
                      //                           ),
                      //                         ))
                      //                   ],
                      //                 ),
                      //                 SizedBox(width: 10),
                      //                 Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     CustomText(
                      //                         text: controller
                      //                             .schedule[0].doctorName
                      //                             .toString(),
                      //                         fontWeight: FontWeight.w700,
                      //                         fontSize: 16.px),
                      //                     CustomText(
                      //                       text: controller
                      //                           .schedule[0].doctorDepartment
                      //                           .toString(),
                      //                       fontWeight: FontWeight.w400,
                      //                       fontSize: 12.px,
                      //                       color: Colors.grey,
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
