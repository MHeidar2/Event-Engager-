import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/applicant.dart';
import '../models/exhibitor.dart';
import '../models/vacancy.dart';
import '../models/applied_vacancy.dart';
import '../models/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicantProvider with ChangeNotifier {
  List<Exhibitor> allExhibitors = [];
  Applicant applicant = Applicant();
  ApplicantProvider() {}

  Future<List<Exhibitor>> fetchExhibitors() async {
    try {
      allExhibitors = [];
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      final response = await http.get(Uri.parse(url + "Exhibitors" + ".json"));
      final data = json.decode(response.body) as Map<String, dynamic>;
      // print(data);
      data.forEach((key, value) {
        allExhibitors.add(Exhibitor(
          id: key,
          name: value['name'],
          website: value['website'],
          email: value['email'],
          contactInfo: value['contactInfo'],
          logoRef: value['logoRef'],
          address: value['address'],
          about: value['about'],
        ));
        if (value['Vacancies'] != null) {
          int exhibitorIndex =
              allExhibitors.indexWhere((exhibitor) => exhibitor.id == key);
          value['Vacancies'].forEach((key1, value1) {
            allExhibitors[exhibitorIndex].myVacancies.add(Vacancy(
                  id: key1,
                  name: value1['name'],
                  requiredExp: value1['requiredExp'],
                ));
            if (value1['Applications'] != null) {
              int vacancyIndex = allExhibitors[exhibitorIndex]
                  .myVacancies
                  .indexWhere((vacancy) => vacancy.id == key1);
              value1['Applications'].forEach((key2, value2) {
                allExhibitors[exhibitorIndex]
                    .myVacancies[vacancyIndex]
                    .applications
                    .add(Application(
                      id: key2,
                      applicantId: value2['applicantId'],
                      name: value2['name'],
                      email: value2['email'],
                      mobile: value2['mobile'],
                      linkedInProfile: value2['linkedInProfile'],
                      cvRef: value2['cvRef'],
                      imageRef: value2['imageRef'],
                      faculty: value2['faculty'],
                      dob: value2['dob'],
                      datetime: value2['datetime'],
                    ));
              });
            }
          });
        }
      });
      //print(allExhibitors);
      notifyListeners();
      return allExhibitors;
    } catch (e) {
      return null;
    }
  }

  Future<Applicant> fetchApplicant() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString('uid');
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      final response =
          await http.get(Uri.parse(url + "Applicants/" + id + ".json"));

      final data = json.decode(response.body);
      applicant.id = id;
      applicant.uniID = data['uniID'];
      applicant.name = data['name'];
      applicant.email = data['email'];
      applicant.mobile = data['mobile'];
      applicant.linkedInProfile = data['linkedInProfile'];
      applicant.cvRef = data['cvRef'];
      applicant.imageRef = data['imageRef'];
      applicant.faculty = data['faculty'];
      applicant.dob = data['dob'];

      if (data['AppliedVacancies'] != null) {
        data['AppliedVacancies'].forEach((key1, value1) {
          applicant.appliedVacancies.add(AppliedVacancy(
            id: key1,
            name: value1['name'],
            requiredExp: value1['requiredExp'],
            exhibitorName: value1['exhibitorName'],
            exhibitorID: value1['exhibitorID'],
          ));
        });
      }

      notifyListeners();
      return applicant;
    } catch (e) {
      return null;
    }
  }
}
