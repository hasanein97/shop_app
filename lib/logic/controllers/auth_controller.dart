import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/model/facebook_model.dart';
import 'package:shop_app/routes/routes.dart';
class AuthController extends GetxController{
  bool isVisibility = false;
  bool isCheckBox = false;
  var disPlayUserName= ''.obs;
  var displayUserPhoto =''.obs;
  var displayUserEmail = ''.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  User ? get userProfile => auth.currentUser;
@override
  void onInit() {
  disPlayUserName.value =
  (userProfile!= null? userProfile!.displayName:"")!;
  displayUserPhoto.value =
  (userProfile!= null? userProfile!.photoURL:"")!;
  displayUserEmail.value =
  (userProfile!= null? userProfile!.email:"")!;
    super.onInit();
  }

  void visibility(){
    isVisibility = !isVisibility;
    update();
  }
  void CheckBox(){
    isCheckBox =!isCheckBox;
    update();
  }

  void signUpUsingFireBase(
  {required String name,
  required String email,
    required String password,
  })
      async{
    try {
      await auth.createUserWithEmailAndPassword(
          email:email,
          password:password,
      ).then((value) {
        disPlayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
message = 'The account already exists for that email.';
      }else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void logInUsingFireBase({
  required String email,
    required String password,
})async{
    try {
   await auth.signInWithEmailAndPassword(
          email:email,
          password: password,
      ).then((value) => disPlayUserName.value = auth.currentUser!.displayName!);
   isSignedIn = true;
   authBox.write("auth", isSignedIn);
   update();
   Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = ' Account does not EXISTS FOR THAT $email.. Create your account by signing up..';
      if (error.code == 'user-not-found') {
       message = '';
      } else if (error.code == 'wrong-password') {
message = 'Invalid Password..Please try again!';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }catch (error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void googleSignUpApp() async {
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      disPlayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken:  googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(Routes.mainScreen);
    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void faceBookSignApp()async{
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status == LoginStatus.success){
      final data = await FacebookAuth.instance.getUserData();
    faceBookModel = FaceBookModel.fromJson(data);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
    Get.offNamed(Routes.mainScreen);
    }

  }
  void resetPasword(String email) async{
    try {
      await auth.sendPasswordResetEmail(email:email );
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = ' Account does not EXISTS FOR THAT $email.. Create your account by signing up..';
      if (error.code == 'user-not-found') {
        message = '';
      }
      else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }catch (error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void signOutFromApp()async{
    try{
    await  auth.signOut();
    await googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    disPlayUserName.value = '';
    displayUserPhoto.value = '';
    displayUserEmail.value = '';
    isSignedIn = false;
    authBox.remove("auth");
    update();
    Get.offNamed(Routes.welcomeScreen);
    }
    catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}