
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PetCard  extends StatelessWidget {
  const PetCard ({super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.loveCount,});
  final String imageUrl;
  final String name;
  final String type;
  final int loveCount;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 126.h,
      width: 336.w,

      decoration:BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(10)),
      ) ,
      padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
      child:Row(
        children:[
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          // النصوص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.orange,
                      size: 20.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Pet Love: $loveCount',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
