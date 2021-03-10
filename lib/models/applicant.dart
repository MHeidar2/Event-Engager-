import 'package:flutter/foundation.dart';
import 'applied_vacancy.dart';

class Applicant {
  final String id;
  final String uniID;
  final String name;
  final String email;
  String password;
  String mobile;
  String linkedInProfile;
  String cvRef;
  String imageRef;
  final String faculty;
  String dob;
  List<AppliedVacancy> appliedVacancies = [];

  Applicant({
    @required this.id,
    @required this.uniID,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.mobile,
    this.linkedInProfile,
    this.cvRef,
    @required this.imageRef,
    @required this.faculty,
    @required this.dob,
  });
}
