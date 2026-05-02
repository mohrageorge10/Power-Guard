import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    required this.labelText,
    this.prefixIcon,
    this.fieldHeight,
    this.boxShadow,
  });

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final Widget? prefixIcon;
  final double? fieldHeight;
  final List<BoxShadow>? boxShadow;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: widget.fieldHeight,
            child: TextFormField(
              controller: widget.controller,
              obscureText: (widget.obscureText && _obscureText),
              textAlignVertical: TextAlignVertical.center,
              expands: widget.fieldHeight != null,
              maxLines: widget.fieldHeight != null ? null : 1,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textSubTitleColor,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'required!';
                }
                return null;
              },
              decoration: InputDecoration(
                errorMaxLines: 3,
                isDense: widget.isDense ?? false,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.textSubTitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                 prefixIcon: widget.prefixIcon != null
                    ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: widget.prefixIcon,
                )
                    : null,
                prefixIconConstraints: const BoxConstraints(),
                suffixIcon: widget.suffixIcon
                    ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                )
                    : null,
                suffixIconConstraints: widget.isDense != null
                    ? const BoxConstraints(maxHeight: 20)
                    : null,
                filled: true,
                fillColor: AppColors.primary100Color,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 3, color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
                ),
                errorStyle: const TextStyle(color: AppColors.errorColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}