import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    //print(FirebaseAuth.instance.currentUser.uid);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', FirebaseAuth.instance.currentUser.uid);
    return getUserType(FirebaseAuth.instance.currentUser.uid);
  } catch (e) {
    //print(e);
    return e;
  }
}

Future<bool> register(String name, String dob, String faculty, String uniID,
    String mobile, String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print(FirebaseAuth.instance.currentUser.uid);
    addApplicant(name, dob, faculty, uniID, mobile, email,
        FirebaseAuth.instance.currentUser.uid);
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

Future<void> addApplicant(String name, String dob, String faculty, String uniID,
    String mobile, String email, String id) async {
  String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
  return http
      .put(
    Uri.parse(url + "Applicants/" + id + ".json"),
    body: json.encode({
      'dob': dob,
      'email': email,
      'faculty': faculty,
      'mobile': mobile,
      'name': name,
      'uniID': uniID,
      'linkedInProfile': 'NA',
      'cvRef': 'NA',
      'imageRef': 'NA',
    }),
  )
      .catchError((error) {
    print(error);
  });
}

Future<void> addUserType(String id) async {
  try {
    String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
    return http.patch(Uri.parse(url + "Users/" + ".json"),
        body: json.encode({
          id: 'Applicant',
        }));
  } catch (e) {
    return e.toString();
  }
}

Future<String> getUserType(String id) async {
  try {
    String url = "https://miu-employment-fair-default-rtdb.firebaseio.com/";
    final response = await http.get(Uri.parse(url + "Users/" + id + ".json"));
    return json.decode(response.body);
  } catch (e) {
    return e.toString();
  }
}
