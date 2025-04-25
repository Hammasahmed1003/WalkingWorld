import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:walking_world/MVC/Controllers/AuthControllers/ProfileSetupController.dart';
import 'package:walking_world/MVC/Utils/AppConstants/WalkingColors.dart';
import 'package:walking_world/MVC/Utils/Components/TextComponent.dart';
import 'package:walking_world/MVC/Utils/Components/WalkingTextField.dart';

class ProfileSetupScreen extends StatelessWidget {
  ProfileSetupScreen({super.key});
  final controller = Get.put(ProfileSetupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalkingColors.BasicWhite,
    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value : const SystemUiOverlayStyle(
                   statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
              ) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Profile Photo",
                  //   style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  // ),
                  TextComponent(text: "Create Profile", color: WalkingColors.BasicBlack, fontWeight: FontWeight.w400, fontSize: 22.sp),
                  SizedBox(height: 10.h),
                  Obx(() {
                    return GestureDetector(
                      onTap: controller.pickImageFromGallery,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          image: controller.profileImage.value != null
                              ? DecorationImage(
                                  image: FileImage(controller.profileImage.value!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: controller.profileImage.value == null
                            ? Icon(Icons.add_a_photo, size: 40, color: Colors.grey)
                            : null,
                      ),
                    );
                  }),
                  SizedBox(height: 30.h),
                  Text(
                    "Full Name",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  WalkingTextField(
                      hintText: "What's Youre Name",
                      filledColor: WalkingColors.BasicWhite,
                      activeBorderColor: WalkingColors.BasicGreen,
                      controller: controller.nameController),
                  SizedBox(height: 20.h),
                  Text(
                    "Age",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() => GestureDetector(
                        onTap: () => _showAgePicker(context),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: WalkingColors.BasicGreen),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${controller.selectedAge.value} years old",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.h),
                  Text(
                    "Country",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() => GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: false,
                            onSelect: (Country country) {
                              controller.updateCountry(country.name);
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: WalkingColors.BasicGreen),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            controller.selectedCountry.value.isEmpty
                                ? "Select your country"
                                : controller.selectedCountry.value,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      )),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Save and Navigate
                      },
                      child: const Text("Let's Go"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAgePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
                initialItem: controller.selectedAge.value - 1),
            onSelectedItemChanged: (int index) {
              controller.updateAge(index + 1);
            },
            children: List<Widget>.generate(100, (index) {
              return Center(child: Text("${index + 1} years old"));
            }),
          ),
        );
      },
    );
  }
}
