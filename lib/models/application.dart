import 'package:flutter/foundation.dart';

class Application {
  final String id;
  final String applicantId;
  final String name;
  final String email;
  final String mobile;
  final String linkedInProfile;
  final String cvRef;
  final String imageRef;
  final String faculty;
  final String dob;
  final DateTime datetime;
  //bool isViewed = false;

  Application({
    @required this.id,
    @required this.applicantId,
    @required this.name,
    @required this.email,
    @required this.mobile,
    this.linkedInProfile,
    @required this.cvRef,
    @required this.imageRef,
    @required this.faculty,
    @required this.dob,
    @required this.datetime,
  });
}
