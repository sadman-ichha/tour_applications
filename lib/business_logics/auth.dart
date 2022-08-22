import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_application/ui/routes/route.dart';

class Auth {
  final box = GetStorage();

  Future registration(String email, String password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successfull");
        box.write('uid', authCredential.uid);
        Get.toNamed(userForm);
      } else {
        Fluttertoast.showToast(msg: "Registration Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        Fluttertoast.showToast(msg: "The password provided is too week");
      } else if (e.code == 'email-already-is-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  Future login(String email, String password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Login Successfull");
        Get.toNamed("");
      } else {
        Fluttertoast.showToast(msg: "Registration Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        Fluttertoast.showToast(msg: "The password provided is too week");
      } else if (e.code == 'email-already-is-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }
}
