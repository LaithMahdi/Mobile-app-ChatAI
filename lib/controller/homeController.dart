import 'package:chat_ai/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../main.dart';

class HomeController extends GetxController {
  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isload = false;
  bool isData = false;
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  late userModel user = userModel(
    email: "",
    name: "",
    password: "",
    picture: "",
  );

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    //snapshot = await db.collection("users").doc(auth.currentUser!.uid).get();
    //getData();
    super.onInit();
  }

  getData() {
    showData();
    snapshot.data()?.forEach((key, value) {
      user = userModel.fromJson(snapshot.data()!);
      print("${user.name}${user.email}");
    });
  }

  void showLoading() {
    isload = !isload;
    update();
  }

  void showData() {
    isData = !isData;
    update();
  }

  void logout() async {
    showLoading();
    await FirebaseAuth.instance.signOut();
    sharedPref!.setBool("login", false);
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed("/login"),
    );
  }
}
