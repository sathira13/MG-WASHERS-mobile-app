import 'dart:io';

import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/components/input_box.dart';
import 'package:car_wash/components/primary_button.dart';
import 'package:car_wash/components/snak_bar.dart';
import 'package:car_wash/models/user_profile.dart';
import 'package:car_wash/services/AuthService.dart';
import 'package:car_wash/utils/validators.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  String? profileName;
  String? profileEmail;
  String? profilePhone;

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String? profileImgUrl;

  AuthService authService = new AuthService();
  late Future<UserProfile> profile;

  void logOut() async {
    authService.signOut().then((value) => context.go("/"));
  }

  void updateProfile() async {
    String name = nameController.text;
    String phone = phoneController.text;
    String email = emailController.text;

    if (!Validator.isNameValid(name)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid name",
      ));
      return;
    }

    if (!Validator.isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid email",
      ));
      return;
    }

    if (!Validator.isMobileNumberValid(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Mobile no",
      ));
      return;
    }

    DatabaseReference dbRef = FirebaseDatabase.instance
        .ref("users/${authService.getCurrentUser()!.uid}");

    DatabaseEvent event = await dbRef.once();

    Map usersData = event.snapshot.value as Map;

    usersData.forEach((key, value) {
      dbRef.update({
        "${key}/email": email,
        "${key}/fullName": name,
        "${key}/phone": phone
      });
    });

    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });

    try {
      final profileImage = File(pickedFile!.path!);
      final path = "files/${pickedFile!.name}";
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(profileImage);

      final snapshot = await uploadTask!.whenComplete(() => {});

      final urlDownload = await snapshot.ref.getDownloadURL();

      setState(() {
        profileImgUrl = urlDownload;
      });

      DatabaseReference dbRef = FirebaseDatabase.instance
          .ref("users/${authService.getCurrentUser()!.uid}");

      DatabaseEvent event = await dbRef.once();

      Map usersData = event.snapshot.value as Map;

      usersData.forEach((key, value) {
        dbRef.update({"${key}/image": profileImgUrl});
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    profile = authService.getCurrentUserProfile();

    profile.then((value) => {
          nameController.text = value.fullName!,
          phoneController.text = value.phone!,
          emailController.text = value.email!,
          if (value.image != "image")
            {
              setState(() {
                profileImgUrl = value.image;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = new AuthService();
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf6f4e1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                isHome: false,
                title: "Profile",
                isBooking: false,
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: profileImgUrl != null
                              ? NetworkImage(profileImgUrl!)
                              : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: selectFile,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd8a656),
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      InputBox(
                        placeholder: "Name",
                        isFill: true,
                        controller: nameController,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenSize.width / 2.3,
                            child: InputBox(
                              placeholder: "Phone",
                              isFill: true,
                              controller: phoneController,
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width / 2.3,
                            child: InputBox(
                              placeholder: "email",
                              isFill: true,
                              controller: emailController,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            text: "Save",
                            onPressed: () async {
                              updateProfile();
                            },
                          ))
                    ]),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logOut();
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
