import 'package:authentication_task/Screens/Register/register.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';  // استيراد Firebase Auth
import '../../../../components/buttons.dart';
import '../../../../constants.dart';
import '../../HomePage.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;  // تعريف FirebaseAuth

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // متغير للتحقق من وجود مدخلات فارغة
  bool emptyArea = false;

  // دالة لتسجيل الدخول
  Future<void> _logInUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // بعد تسجيل الدخول بنجاح، يتم التوجيه إلى الصفحة الرئيسية
      Navigator.pushNamed(context, HomePage.routeName);
    } on FirebaseAuthException catch (e) {
      // في حال حدوث خطأ، يتم عرض رسالة الخطأ
      displaySnackBar(e.message ?? "حدث خطأ أثناء تسجيل الدخول");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // العنوان والترحيب
            Padding(
              padding: const EdgeInsets.only(top: 120).r,
              child: SizedBox(
                width: 260.w,
                child: Column(
                  children: [
                    Text(
                      "Login!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mainFontSize.sp,
                        fontWeight: mainFontWeight,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Welcome back ! Login with your credentials",
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
            // نموذج تسجيل الدخول
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // حقل البريد الإلكتروني
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0).r,
                    child: SizedBox(
                      width: 220.w,
                      height: 90.h,
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            displaySnackBar("enter your email");
                            emptyArea = true;
                            return "empty";
                          }
                          return null;
                        },
                        cursorColor: textBlack,
                        style: TextStyle(fontSize: subFontSize.sp),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          icon: const Icon(
                            Icons.email_outlined,
                            color: textBlack,
                          ),
                          labelText: "Email",
                          hintText: "abc@gmail.com",
                          labelStyle: TextStyle(
                              color: textBlack,
                              fontSize: mainFontSize.sp,
                              fontWeight: mainFontWeight),
                          hintStyle: TextStyle(
                              color: textBlack, fontSize: subFontSize.sp),
                        ),
                      ),
                    ),
                  ),
                  // حقل كلمة المرور
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0).r,
                    child: SizedBox(
                      width: 220.w,
                      height: 90.h,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            displaySnackBar("enter your password");
                            emptyArea = true;
                            return "empty";
                          }
                          return null;
                        },
                        obscureText: true,
                        cursorColor: textBlack,
                        style: TextStyle(fontSize: subFontSize.sp),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          icon: const Icon(
                            Icons.password_outlined,
                            color: textBlack,
                          ),
                          labelText: "Password",
                          hintText: "******",
                          labelStyle: TextStyle(
                              color: textBlack,
                              fontSize: mainFontSize.sp,
                              fontWeight: mainFontWeight),
                          hintStyle: TextStyle(
                              color: textBlack, fontSize: subFontSize.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h, width: double.infinity.w),
                  // زر تسجيل الدخول
                  DefaultButton(
                    text: "Log in",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        emptyArea = false;
                      }
                      if (emptyArea == false) {
                        await displaySnackBar("loading");
                        // استدعاء دالة تسجيل الدخول
                        await _logInUser();
                      }
                    },
                  ),
                  SizedBox(height: 20.h, width: double.infinity.w),
                  // نص التسجيل في حساب جديد
                  Text(
                    "Do not have an account ?",
                    style: (TextStyle(
                        color: textBlack, fontSize: commonTextSize.sp)),
                  ),
                  // رابط التوجه إلى صفحة التسجيل
                  InkWell(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: textBlack,
                          fontSize: commonTextSize.sp,
                          fontWeight: commonTextWeight),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
