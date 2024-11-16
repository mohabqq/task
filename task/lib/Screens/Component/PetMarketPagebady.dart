import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Screens/Component/CastomWidget.dart';
import 'package:task/Screens/Component/list.dart';
class PetMarketPageBody extends StatelessWidget {
  const PetMarketPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[350],
              prefixIcon: Icon(
                Icons.search,
                size: 24.sp,
              ),
              hintText: 'Search by pet type',
              hintStyle: TextStyle(fontSize: 16.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            ),
          ),
        ),
        // لف ListView.builder داخل Expanded
        Expanded(
//  pet.imageUrl,
          child: ListView.builder(
            itemCount: petList.length,
            itemBuilder: (context, index) {
              final pet = petList[index];
              return PetCard(
                imageUrl: pet.imageUrl,
                name: pet.name,
                type: pet.type,
                loveCount: pet.love,
              );
            },
          ),
        ),
      ],
    );
  }
}
