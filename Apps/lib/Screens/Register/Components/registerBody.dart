import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../components/buttons.dart';
import '../../../../constants.dart';
import '../../HomePage.dart';
import '../../Login/login.dart';
import 'castomTextFiled.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _registerUser() async {
    try {
      // Register the user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Save user data to Firestore
      try {
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'username': _usernameController.text,
          'email': _emailController.text,
        });
        print('Data saved successfully');
      } catch (e) {
        print('Error saving data: $e');
        displaySnackBar('حدث خطأ أثناء حفظ البيانات: ${e.toString()}');
      }

      // Navigate to the home page after registration
      Navigator.pushNamed(context, HomePage.routeName);
    } on FirebaseAuthException catch (e) {
      // Handle errors
      displaySnackBar(e.message ?? 'An error occurred during registration');
    }
  }

  // A helper method to create TextFormField widgets


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50).r,
              child: SizedBox(
                width: 260.w,
                child: Column(
                  children: [
                    Text(
                      "Register Now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mainFontSize.sp,
                        fontWeight: mainFontWeight,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Create an Account, It's free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: commonTextSize.sp,
                        color: lightGreyReceiptBG,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: double.infinity.w, height: 40.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField(
                    controller: _usernameController,
                    label: "User Name",
                    hint: "Ahmed Mohamed",
                    icon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your username";
                      }
                      return null;
                    },
                  ),
                  buildTextField(
                    controller: _emailController,
                    label: "Email",
                    hint: "abc@gmail.com",
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      }
                      return null;
                    },
                  ),
                  buildTextField(
                    controller: _passwordController,
                    label: "Password",
                    hint: "******",
                    icon: Icons.password_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h, width: double.infinity.w),
                  DefaultButton(
                    text: "Register",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await displaySnackBar("Loading...");
                        await _registerUser();
                      }
                    },
                  ),
                  SizedBox(height: 20.h, width: double.infinity.w),
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: textBlack,
                      fontSize: commonTextSize.sp,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: textBlack,
                        fontSize: commonTextSize.sp,
                        fontWeight: commonTextWeight,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
