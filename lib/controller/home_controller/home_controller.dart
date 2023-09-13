import 'package:assignment1/core/constants/static_image.dart';
import 'package:assignment1/model/home_model/our_service_model.dart';
import 'package:assignment1/model/home_model/schedule_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var ourServiceList = <OurServiceModel>[
    OurServiceModel(title: "Consultation", image: StaticImage.img1),
    OurServiceModel(title: "Medicines", image: StaticImage.img3),
    OurServiceModel(title: "Ambulance", image: StaticImage.img2),
  ].obs;

  var schedule = <ScheduleModel>[
    ScheduleModel(
        appointmentDate: "Web Jun 20 | 8:00 - 8:30 Am",
        doctorDepartment: "Orthopedic",
        doctorImage: StaticImage.img1,
        doctorName: "Dr. Padma Jignesh",
        isAvailable: true),
    ScheduleModel(
        appointmentDate: "Web Jun 20 | 8:00 - 8:30 Am",
        doctorDepartment: "Orthopedic",
        doctorImage: StaticImage.img2,
        isAvailable: false,
        doctorName: "Dr. Padma Jignesh"),
    ScheduleModel(
        appointmentDate: "Web Jun 20 | 8:00 - 8:30 Am",
        doctorDepartment: "Orthopedic",
        doctorImage: StaticImage.img3,
        isAvailable: true,
        doctorName: "Dr. Padma Jignesh"),
    ScheduleModel(
        appointmentDate: "Web Jun 20 | 8:00 - 8:30 Am",
        doctorDepartment: "Orthopedic",
        doctorImage: StaticImage.img1,
        isAvailable: true,
        doctorName: "Dr. Padma Jignesh"),
  ].obs;
}
