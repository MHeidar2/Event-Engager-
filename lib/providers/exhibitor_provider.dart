import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/applicant.dart';
import '../models/exhibitor.dart';
import '../models/application.dart';
import '../models/vacancy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExhibitorProvider with ChangeNotifier {
  List<Applicant> _allApplicants = [];
  Exhibitor exhibitor;

  ExhibitorProvider() {
    //fetchExhibitor();
  }

  Future<String> addVacancy(String name, String requiredExp) async {
    try {
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      var response = await http.post(
        Uri.parse(url + "Exhibitors/" + exhibitor.id + "/Vacancies.json"),
        body: json.encode({
          'name': name,
          'requiredExp': requiredExp,
        }),
      );
      exhibitor.myVacancies.add(Vacancy(
          id: response.toString(), name: name, requiredExp: requiredExp));
      return 'true';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> fetchExhibitor() async {
    try {
      exhibitor = Exhibitor();
      final prefs = await SharedPreferences.getInstance();
      String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
      final response = await http.get(
          Uri.parse(url + "Exhibitors/" + prefs.getString('uid') + ".json"));
      final data = json.decode(response.body);
      exhibitor.id = prefs.getString('uid');
      exhibitor.email = data['email'];
      exhibitor.name = data['name'];
      exhibitor.website = data['website'];
      exhibitor.contactInfo = data['contactInfo'];
      exhibitor.logoRef = data['logoRef'];
      exhibitor.address = data['address'];
      exhibitor.about = data['about'];
      if (data['Vacancies'] != null) {
        data['Vacancies'].forEach((key1, value1) {
          exhibitor.myVacancies.add(Vacancy(
            id: key1,
            name: value1['name'],
            requiredExp: value1['requiredExp'],
          ));
          if (value1['Applications'] != null) {
            int vacancyIndex = exhibitor.myVacancies
                .indexWhere((vacancy) => vacancy.id == key1);
            value1['Applications'].forEach((key2, value2) {
              exhibitor.myVacancies[vacancyIndex].applications.add(Application(
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

      notifyListeners();
      return 'successfuly updated';
    } catch (e) {
      return e.toString();
    }
  }
}
