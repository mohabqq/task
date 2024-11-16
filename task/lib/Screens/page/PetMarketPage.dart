import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Screens/Component/PetMarketPagebady.dart';
class PetMarketPage  extends StatelessWidget {
  const PetMarketPage ({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        designSize: const Size(360, 690),
    builder: (context, child) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Pet Market',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: PetMarketPageBody(),
    );
  }

  );
}
}
