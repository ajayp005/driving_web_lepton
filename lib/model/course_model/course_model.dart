import 'dart:convert';

class CourseModel {
  String courseType;
  String tutor;
  String duration;
  String rate;
  String courseId;
  CourseModel({
    required this.courseType,
    required this.tutor,
    required this.duration,
    required this.rate,
    required this.courseId,
  });

  CourseModel copyWith({
    String? courseType,
    String? tutor,
    String? duration,
    String? rate,
    String? courseId,
  }) {
    return CourseModel(
      courseType: courseType ?? this.courseType,
      tutor: tutor ?? this.tutor,
      duration: duration ?? this.duration,
      rate: rate ?? this.rate,
      courseId: courseId ?? this.courseId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseType': courseType,
      'tutor': tutor,
      'duration': duration,
      'rate': rate,
      'courseId': courseId,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      courseType: map['courseType'] ?? "",
      tutor: map['tutor'] ?? "",
      duration: map['duration'] ?? "",
      rate: map['rate'] ?? "",
      courseId: map['courseId'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(courseType: $courseType, tutor: $tutor, duration: $duration, rate: $rate, courseId: $courseId)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;

    return other.courseType == courseType &&
        other.tutor == tutor &&
        other.duration == duration &&
        other.rate == rate &&
        other.courseId == courseId;
  }

  @override
  int get hashCode {
    return courseType.hashCode ^
        tutor.hashCode ^
        duration.hashCode ^
        rate.hashCode ^
        courseId.hashCode;
  }
}
