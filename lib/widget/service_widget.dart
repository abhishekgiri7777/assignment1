// ignore_for_file: must_be_immutable

import 'package:assignment1/model/home_model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_text_widget.dart';

class ScheduleWidget extends StatelessWidget {
  ScheduleModel scheduleModel;
  ScheduleWidget({required this.scheduleModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 15.h,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
              color: scheduleModel.isAvailable == true
                  ? Colors.deepPurple
                  : Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Appointment date",
                    color: Colors.grey,
                    fontSize: 12.px),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: 7),
                    CustomText(
                      text: scheduleModel.appointmentDate.toString(),
                      color: Colors.black,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                    height: 1,
                    width: 75.w,
                    color: Colors.grey),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    scheduleModel.doctorImage.toString()),
                                fit: BoxFit.fill),
                          ),
                        ),
                        scheduleModel.isAvailable == true
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
                            text: scheduleModel.doctorName.toString(),
                            fontWeight: FontWeight.w700,
                            fontSize: 16.px),
                        CustomText(
                          text: scheduleModel.doctorDepartment.toString(),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
