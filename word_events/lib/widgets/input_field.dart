import 'package:flutter/material.dart';
import 'package:word_events/globals/app_size.dart';
import 'package:word_events/globals//app_theme.dart';



class InputField extends StatefulWidget {

  TextEditingController? tfController = TextEditingController();
  Icon? tfIcon;
  String? tfLabel;
  String? tfHint;
  VoidCallback? tfFunction;

  InputField({
    super.key,
    this.tfController,
    this.tfIcon,
    this.tfLabel,
    this.tfHint,
    this.tfFunction
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  AppColors appColors = AppColors();

  AppSize appSize = AppSize();

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(appSize.minPadding,appSize.midPadding,appSize.minPadding,appSize.midPadding/2),
        child: TextField(
          controller: widget.tfController,
          style: TextStyle(color: appColors.inputFieldColor),
          onTap: widget.tfFunction,
          decoration: InputDecoration(
            suffixIcon: widget.tfIcon,
            suffixIconColor: appColors.inputFieldColor,
            labelText: widget.tfLabel,
            labelStyle: TextStyle(color: appColors.inputFieldColor),
            hintText: widget.tfHint,
            hintStyle: TextStyle(color: appColors.hintColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(appSize.radius))
            )
          ),
        ),
      ),
    );
  }
}

