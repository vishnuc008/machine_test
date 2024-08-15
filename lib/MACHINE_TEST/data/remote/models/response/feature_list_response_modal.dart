class FeatureCourseListResponseModal {
  bool status;
  String message;
  FeatureCourseListDatum? data; // Changed to nullable

  FeatureCourseListResponseModal({
    required this.status,
    required this.message,
    this.data,
  });

  factory FeatureCourseListResponseModal.fromJson(Map<String, dynamic> json) =>
      FeatureCourseListResponseModal(
        status: json["status"],
        message: json["message"] ?? "", // Default to an empty string
        data: json["data"] != null ? FeatureCourseListDatum.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class FeatureCourseListDatum {
  int? courseId;
  String? courseName;
  String? courseDescription;
  String? courseSyllabus;
  String? courseSyllabusPdf;
  String? courseLevel;
  String? courseSubject;
  String? courseDuration;
  String? totalFee;
  List<CourseIntak>? courseIntaks;
  List<dynamic>? courseEligible;
  int? universityId;
  String? universityName;
  String? universityCountry;
  String? universityState;
  String? universityCity;
  DateTime? universityEstablishedYear;
  String? universityRank;
  int? universityInternationalFee;
  String? universityBrochure;
  String? aboutUniversity;
  String? logoImage;
  dynamic documentRequired;
  List<dynamic>? eligibileCerteriaEntrance;
  dynamic eligibileCerteriaFind;
  String? placement;

  FeatureCourseListDatum({
    this.courseId,
    this.courseName,
    this.courseDescription,
    this.courseSyllabus,
    this.courseSyllabusPdf,
    this.courseLevel,
    this.courseSubject,
    this.courseDuration,
    this.totalFee,
    this.courseIntaks,
    this.courseEligible,
    this.universityId,
    this.universityName,
    this.universityCountry,
    this.universityState,
    this.universityCity,
    this.universityEstablishedYear,
    this.universityRank,
    this.universityInternationalFee,
    this.universityBrochure,
    this.aboutUniversity,
    this.logoImage,
    this.documentRequired,
    this.eligibileCerteriaEntrance,
    this.eligibileCerteriaFind,
    this.placement,
  });

  factory FeatureCourseListDatum.fromJson(Map<String, dynamic> json) => FeatureCourseListDatum(
        courseId: json["courseId"],
        courseName: json["courseName"],
        courseDescription: json["courseDescription"],
        courseSyllabus: json["courseSyllabus"],
        courseSyllabusPdf: json["courseSyllabusPdf"],
        courseLevel: json["courseLevel"],
        courseSubject: json["courseSubject"],
        courseDuration: json["CourseDuration"],
        totalFee: json["totalFee"],
        courseIntaks: json["courseIntaks"] != null
            ? List<CourseIntak>.from(
                json["courseIntaks"].map((x) => CourseIntak.fromJson(x)))
            : [],
        courseEligible: json["courseEligible"] != null
            ? List<dynamic>.from(json["courseEligible"].map((x) => x))
            : [],
        universityId: json["universityId"],
        universityName: json["universityName"],
        universityCountry: json["universityCountry"],
        universityState: json["universityState"],
        universityCity: json["universityCity"],
        universityEstablishedYear: json["universityEstablishedYear"] != null
            ? DateTime.parse(json["universityEstablishedYear"])
            : null,
        universityRank: json["universityRank"],
        universityInternationalFee: json["universityInternationalFee"],
        universityBrochure: json["universityBrochure"],
        aboutUniversity: json["aboutUniversity"],
        logoImage: json["logoImage"],
        documentRequired: json["documentRequired"],
        eligibileCerteriaEntrance: json["eligibileCerteriaEntrance"] != null
            ? List<dynamic>.from(
                json["eligibileCerteriaEntrance"].map((x) => x))
            : [],
        eligibileCerteriaFind: json["eligibileCerteriaFind"],
        placement: json["placement"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "courseDescription": courseDescription,
        "courseSyllabus": courseSyllabus,
        "courseSyllabusPdf": courseSyllabusPdf,
        "courseLevel": courseLevel,
        "courseSubject": courseSubject,
        "CourseDuration": courseDuration,
        "totalFee": totalFee,
        "courseIntaks": courseIntaks?.map((x) => x.toJson()).toList(),
        "courseEligible": courseEligible?.map((x) => x).toList(),
        "universityId": universityId,
        "universityName": universityName,
        "universityCountry": universityCountry,
        "universityState": universityState,
        "universityCity": universityCity,
        "universityEstablishedYear": universityEstablishedYear != null
            ? "${universityEstablishedYear!.year.toString().padLeft(4, '0')}-${universityEstablishedYear!.month.toString().padLeft(2, '0')}-${universityEstablishedYear!.day.toString().padLeft(2, '0')}"
            : null,
        "universityRank": universityRank,
        "universityInternationalFee": universityInternationalFee,
        "universityBrochure": universityBrochure,
        "aboutUniversity": aboutUniversity,
        "logoImage": logoImage,
        "documentRequired": documentRequired,
        "eligibileCerteriaEntrance":
            eligibileCerteriaEntrance?.map((x) => x).toList(),
        "eligibileCerteriaFind": eligibileCerteriaFind,
        "placement": placement,
      };
}

class CourseIntak {
  int id;
  String courseId;
  String intakeDate;
  String intakeDurationDate;
  DateTime createdAt;
  DateTime updatedAt;

  CourseIntak({
    required this.id,
    required this.courseId,
    required this.intakeDate,
    required this.intakeDurationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseIntak.fromJson(Map<String, dynamic> json) => CourseIntak(
        id: json["id"],
        courseId: json["courseId"],
        intakeDate: json["intakeDate"],
        intakeDurationDate: json["intakeDurationDate"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseId": courseId,
        "intakeDate": intakeDate,
        "intakeDurationDate": intakeDurationDate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
