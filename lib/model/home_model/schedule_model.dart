class ScheduleModel {
  final String? appointmentDate;
  final String? doctorImage;
  final String? doctorName;
  final String? doctorDepartment;
  final bool? isAvailable;

  ScheduleModel(
      {this.appointmentDate,
      this.doctorImage,
      this.doctorName,
      this.doctorDepartment,
      this.isAvailable});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        appointmentDate: json["appointmentDate"],
        doctorImage: json["doctorImage"],
        doctorName: json["doctorName"],
        doctorDepartment: json["doctorDepartment"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentDate": appointmentDate,
        "doctorImage": doctorImage,
        "doctorName": doctorName,
        "doctorDepartment": doctorDepartment,
        "isAvailable": isAvailable,
      };
}
