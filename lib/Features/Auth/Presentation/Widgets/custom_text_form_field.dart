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
  });
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;

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
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: widget.controller,
            obscureText: (widget.obscureText && _obscureText),
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textPrimaryColor,
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
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.textPrimaryColor.withValues(alpha: 0.7),
                fontSize: 16,
              ),
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
              filled: true,
              fillColor: AppColors.primary100Color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: AppColors.errorColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: AppColors.errorColor),
              ),
              errorStyle: const TextStyle(color: AppColors.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}
