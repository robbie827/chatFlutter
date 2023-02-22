import 'dart:convert';

class AppointmentModel {
  final String jobId;
  final String jobDate;
  final String jobTime;
  final String jobHours;
  final String jobAddress;
  final String availableCleaner;

  AppointmentModel({
    required this.jobId,
    required this.jobDate,
    required this.jobTime,
    required this.jobHours,
    required this.jobAddress,
    required this.availableCleaner,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        jobId: json["job_id"],
        jobDate: json["job_date"],
        jobTime: json["job_time"],
        jobHours: json["job_hours"],
        jobAddress: json["job_address"],
        availableCleaner: json["available_cleaner"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "job_id": jobId,
      "job_date": jobDate,
      "job_time": jobTime,
      "job_hours": jobHours,
      "job_address": jobAddress,
      "available_cleaner": availableCleaner,
    };
  }

  @override
  String toString() {
    return json.encode(toMap());
  }
}
