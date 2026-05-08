import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

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
    this.boxShadow,
    this.validator,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines,
  });

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final Widget? prefixIcon;
  final List<BoxShadow>? boxShadow;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isMultiline = widget.maxLines == null || widget.maxLines! > 1;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty) ...[
            Text(
              widget.labelText,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 15),
          ],
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: widget.boxShadow,
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: (widget.obscureText && _obscureText),

              maxLines: widget.maxLines,
              minLines: widget.minLines,
              keyboardType: isMultiline
                  ? TextInputType.multiline
                  : widget.keyboardType,
              textInputAction: isMultiline
                  ? TextInputAction.newline
                  : widget.textInputAction,

              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textSubTitleColor,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  widget.validator ??
                  (textValue) {
                    if (textValue == null || textValue.trim().isEmpty) {
                      return AppStrings.required;
                    }
                    return null;
                  },
              decoration: InputDecoration(
                errorMaxLines: 3,
                isDense: widget.isDense ?? false,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textSubTitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),

                prefixIcon: widget.prefixIcon != null
                    ? Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.topCenter,
                        width: 48,
                        child: widget.prefixIcon,
                      )
                    : null,

                prefixIconConstraints: isMultiline
                    ? const BoxConstraints(minHeight: 50)
                    : const BoxConstraints(),

                suffixIcon: widget.suffixIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
