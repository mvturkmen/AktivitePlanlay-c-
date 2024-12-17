import 'package:flutter/material.dart';
import 'package:word_events/globals/app_size.dart';
import 'package:word_events/globals//app_theme.dart';



class SearchField extends StatefulWidget {

  TextEditingController tfController = TextEditingController();
  Icon tfIcon;
  String tfLabel;
  VoidCallback tfFunction;

  SearchField({
    super.key,
    required this.tfController,
    required this.tfIcon,
    required this.tfLabel,
    required this.tfFunction
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  AppColors appColors = AppColors();

  AppSize appSize = AppSize();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(appSize.minPadding,appSize.midPadding,appSize.minPadding,appSize.midPadding/2),
      child: TextField(
        controller: widget.tfController,
        style: TextStyle(color: appColors.inputFieldColor),
        onTap: widget.tfFunction,
        decoration: InputDecoration(
            prefixIcon: widget.tfIcon,
            prefixIconColor: appColors.inputFieldColor,
            labelText: widget.tfLabel,
            labelStyle: TextStyle(color: appColors.inputFieldColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(appSize.radius))
            )
        ),
      ),
    );
  }
}

