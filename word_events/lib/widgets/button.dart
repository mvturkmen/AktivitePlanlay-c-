import 'package:flutter/material.dart';
import 'package:word_events/globals/app_size.dart';
import 'package:word_events/globals/app_theme.dart';

class AppButton extends StatefulWidget {
  String label ;
  VoidCallback function ;
  AppButton({super.key,required this.label,required this.function});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  AppColors appColors = AppColors() ;
  AppSize appSize = AppSize() ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,40,8,8),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(
          backgroundColor: appColors.buttonColor,
          minimumSize: const Size(150, 40),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: widget.function,
        child: Text(widget.label,style: TextStyle(color: appColors.buttonTextColor),),
      ),
    );


  }
}
