import 'dart:convert';

FeatureCoursePaginationResponseModal
    featureCoursePaginationResponseModalFromJson(String str) =>
        FeatureCoursePaginationResponseModal.fromJson(json.decode(str));

String featureCoursePaginationResponseModalToJson(
        FeatureCoursePaginationResponseModal data) =>
    json.encode(data.toJson());

class FeatureCoursePaginationResponseModal {
  bool status;
  String message;
  List<FeatureCourseDatum> data;

  FeatureCoursePaginationResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FeatureCoursePaginationResponseModal.fromJson(
          Map<String, dynamic> json) =>
      FeatureCoursePaginationResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<FeatureCourseDatum>.from(json["data"].map((x) => FeatureCourseDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FeatureCourseDatum {
  int universityId;
  String courseTitle;
  String courseFee;
  List<dynamic> images;
  String country;
  String? state;
  String? city;
  String universityName;
  int courseId;

  FeatureCourseDatum({
    required this.universityId,
    required this.courseTitle,
    required this.courseFee,
    required this.images,
    required this.country,
    this.state,
    this.city,
    required this.universityName,
    required this.courseId,
  });

  factory FeatureCourseDatum.fromJson(Map<String, dynamic> json) => FeatureCourseDatum(
        universityId: json["universityId"],
        courseTitle: json["courseTitle"],
        courseFee: json["courseFee"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        country: json["Country"],
        state: json["State"],
        city: json["city"],
        universityName: json["universityName"],
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "universityId": universityId,
        "courseTitle": courseTitle,
        "courseFee": courseFee,
        "images": List<dynamic>.from(images.map((x) => x)),
        "Country": country,
        "State": state,
        "city": city,
        "universityName": universityName,
        "courseId": courseId,
      };
}
