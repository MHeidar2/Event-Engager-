import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:miu_employment_fair/screens/add_exhibitor.dart';
import '../models/applicant.dart';
import '../models/exhibitor.dart';
import '../models/vacancy.dart';
import '../models/application.dart';
import '../models/applied_vacancy.dart';

class AdminProvider with ChangeNotifier {
  List<Applicant> allApplicants = [];
  List<Exhibitor> allExhibitors = [];

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

  Future<List<Applicant>> fetchApplicants() async {
    try {
      allApplicants = [];
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      final response = await http.get(Uri.parse(url + "Applicants" + ".json"));
      final data = json.decode(response.body) as Map<String, dynamic>;
      print(data);
      data.forEach((key, value) {
        allApplicants.add(Applicant(
          id: key,
          uniID: value['uniID'],
          name: value['name'],
          email: value['email'],
          mobile: value['mobile'],
          linkedInProfile: value['linkedInProfile'],
          cvRef: value['cvRef'],
          imageRef: value['imageRef'],
          faculty: value['faculty'],
          dob: value['dob'],
        ));
        if (value['AppliedVacancies'] != null) {
          int applicantIndex =
              allApplicants.indexWhere((applicant) => applicant.id == key);
          value['appliedVacancies'].forEach((key1, value1) {
            allApplicants[applicantIndex].appliedVacancies.add(AppliedVacancy(
                  id: key1,
                  name: value1['name'],
                  requiredExp: value1['requiredExp'],
                  exhibitorName: value1['exhibitorName'],
                  exhibitorID: value1['exhibitorID'],
                ));
          });
        }
      });
      notifyListeners();
      return allApplicants;
    } catch (e) {
      return null;
    }
  }

  Future<bool> addUser(
      String name, String website, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(FirebaseAuth.instance.currentUser.uid);
      addExhibitor(name, website, email, FirebaseAuth.instance.currentUser.uid);
      addUserType(FirebaseAuth.instance.currentUser.uid);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> addExhibitor(
      String name, String website, String email, String id) async {
    try {
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      var response = await http.put(
        Uri.parse(url + "Exhibitors/" + id + ".json"),
        body: json.encode({
          'name': name,
          'website': website,
          'email': email,
          'contactInfo': 'NA',
          'logoRef': 'NA',
          'address': 'NA',
          'about': 'NA',
        }),
      );
      allExhibitors.add(Exhibitor(
          id: response.toString(), name: name, website: website, email: email));
      return 'true';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> addUserType(String id) async {
    try {
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      var response = await http.patch(
        Uri.parse(url + "Users/" + ".json"),
        body: json.encode({
          id: 'Exhibitor',
        }),
      );
      return 'true';
    } catch (e) {
      return e.toString();
    }
  }
}
