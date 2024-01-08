import 'package:attendu/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CustomAppbar extends StatelessWidget {
  final String? text;

  const CustomAppbar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    NepaliDateTime nepaliDateTime = picker.NepaliDateTime.fromDateTime(time);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.primaryColor
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          text == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     Text("Date : ${nepaliDateTime.year}-${nepaliDateTime.month}-${nepaliDateTime.day}"
                     ,style: TextStyle(
                       fontWeight: FontWeight.w400,fontSize: 18
                     ),),
                       // const SizedBox(width: 8),
                       Text(" ${picker.NepaliDateFormat.EEEE().format(nepaliDateTime)}"),
                   
              ],
             ),
           )     
      ],
      ),
    );
  }
}
