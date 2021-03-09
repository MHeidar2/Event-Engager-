/*//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'dart:html';
//import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'applicant.dart';
import 'exhibitor.dart';

class Users with ChangeNotifier {
  //applicants...
  List<Applicant> _allApplicants = [
    Applicant(
      id: 'u001',
      name: 'kiro',
      email: 'kiro@gmail.com',
      password: '1111',
      mobile: '012',
      cvRef: 'www.mycs.html',
      imageRef:
          'https://static.wikia.nocookie.net/p__/images/2/25/New-Promotional-Photos-stephen-amell-34216861-1800-2399.jpg/revision/latest?cb=20191204113618&path-prefix=protagonist',
      faculty: 'csc',
      dob: '19,7,1997',
    ),
  ];

  List<Applicant> get allUsers {
    return [..._allApplicants];
  }

  Applicant findApplicantById(String id) {
    return _allApplicants.firstWhere((app) => app.id == id);
  }

  void addApplicant(Applicant user) {
    //const url = 'https://temp01-524da-default-rtdb.firebaseio.com/users.json';

    final newUser = Applicant(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      mobile: user.mobile,
      cvRef: user.cvRef,
      imageRef: user.imageRef,
      faculty: user.faculty,
      dob: user.dob,
    );

    _allApplicants.add(newUser);
    notifyListeners();
  }

  void updateApplicant(String id, Applicant newUser) {
    final appIndex = _allApplicants.indexWhere((app) => app.id == id);
    if (appIndex >= 0) {
      _allApplicants[appIndex] = newUser;
      notifyListeners();
    }
  }

  void deleteApplicant(String id) {
    _allApplicants.removeWhere((app) => app.id == id);
    notifyListeners();
  }

  //exhibitors...
  List<Exhibitor> _allExhibitors = [
    Exhibitor(
      id: '001',
      name: 'jenzojj',
      email: 'jjuk@gmail.com',
      website: "www.jjuk.com",
      password: '1111',
      contactInfo: '012',
      logoRef:
          'https://static.wikia.nocookie.net/p__/images/2/25/New-Promotional-Photos-stephen-amell-34216861-1800-2399.jpg/revision/latest?cb=20191204113618&path-prefix=protagonist',
      address: '21 asmaa fahmy st. ard el golf.',
      about: 'company info...',
    ),
  ];

  List<Exhibitor> get allExhibitors {
    return [..._allExhibitors];
  }

  Exhibitor findExhibitorById(String id) {
    return _allExhibitors.firstWhere((exhibit) => exhibit.id == id);
  }

  void addExhibitor(Exhibitor exhibit) {
    //const url = 'https://temp01-524da-default-rtdb.firebaseio.com/users.json';

    final newExhibitor = Exhibitor(
      id: exhibit.id,
      name: exhibit.name,
      email: exhibit.email,
      website: exhibit.website,
      password: exhibit.password,
      contactInfo: exhibit.contactInfo,
      logoRef: exhibit.logoRef,
      address: exhibit.address,
      about: exhibit.about,
    );
    _allExhibitors.add(newExhibitor);
    notifyListeners();
  }

  void updateExhibitor(String id, Exhibitor newExhibitor) {
    final exhibitIndex =
        _allExhibitors.indexWhere((exhibit) => exhibit.id == id);
    if (exhibitIndex >= 0) {
      _allExhibitors[exhibitIndex] = newExhibitor;
      notifyListeners();
    }
  }

  void deleteExhibitor(String id) {
    _allExhibitors.removeWhere((exhibit) => exhibit.id == id);
    notifyListeners();
  }
}
*/
