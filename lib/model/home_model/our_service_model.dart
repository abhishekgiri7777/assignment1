class OurServiceModel {
  final String? title;
  final String? image;

  OurServiceModel({this.title, this.image});

  factory OurServiceModel.fromJson(Map<String, dynamic> json) =>
      OurServiceModel(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {"title": title, "image": image};
}
