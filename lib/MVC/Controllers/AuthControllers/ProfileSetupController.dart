import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileSetupController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  final nameController = TextEditingController();
  final RxInt selectedAge = 18.obs;
  final RxString selectedCountry = ''.obs;

  @override
  void onInit() {
    super.onInit();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      Get.snackbar('Permission Denied', 'Gallery access is required to upload your profile image.');
    }
  }

  Future<void> pickImageFromGallery() async {
    final permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      }
    } else {
      Get.snackbar('Permission Required', 'Please allow gallery permission to pick an image.');
      await requestPermissions();
    }
  }

  void updateAge(int age) {
    selectedAge.value = age;
  }

  void updateCountry(String country) {
    selectedCountry.value = country;
  }
}
