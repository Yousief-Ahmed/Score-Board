import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:score_board/Core/constants.dart';

enum FieldType { name, score }

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<FocusNode> focusNodes;
  final FieldType fieldType;
  final int index;
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.fieldType,
    required this.index,
    this.onAdd,
    this.onRemove,
    this.hintText,
    required this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNodes[index],
      controller: controller,
      keyboardType:
          fieldType == FieldType.score
              ? TextInputType.number
              : TextInputType.text,
      inputFormatters:
          fieldType == FieldType.score
              ? [FilteringTextInputFormatter.digitsOnly]
              : [],
      textInputAction:
          index == focusNodes.length - 1
              ? TextInputAction.done
              : TextInputAction.next,
      decoration: InputDecoration(
        labelText: fieldType == FieldType.name ? 'Player ${index + 1}' : null,
        labelStyle: TextStyle(
          color: Constants.textColor.withOpacity(0.5),
          fontSize: 15.sp,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Constants.textColor.withOpacity(0.5),
          fontSize: 15.sp,
        ),
        border: OutlineInputBorder(),
        suffixIcon:
            fieldType == FieldType.name
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onRemove != null)
                      IconButton(onPressed: onRemove, icon: Icon(Icons.delete)),
                    if (onAdd != null)
                      IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  ],
                )
                : null,
      ),
      cursorColor: Constants.textColor,
      style: TextStyle(
        color: Constants.textColor,
        fontSize: fieldType == FieldType.name ? 15.sp : 14.sp,
        fontWeight:
            fieldType == FieldType.name ? FontWeight.w300 : FontWeight.bold,
      ),
      onChanged: (value) {},
      onEditingComplete: () {
        if (index < focusNodes.length - 1) {
          FocusScope.of(context).requestFocus(focusNodes[index + 1]);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}
