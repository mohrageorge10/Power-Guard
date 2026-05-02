import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_app_bar.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/custom_submit_button.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  // Selected Priority
  String _selectedPriority = AppStrings.lowPriority;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SharedAppBar(
        userName: 'Department manager',
        userImage: Assets.imagesFactoryManger,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.reportIssueTitle,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.targetAssetLabel,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            _buildDropdown(),
            const SizedBox(height: 20),
            const Text(
              AppStrings.issueDescLabel,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            _buildDescriptionField(),
            const SizedBox(height: 30),
            const Text(
              AppStrings.impactPriorityLabel,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            _buildPriorityButtons(),
            const SizedBox(height: 40),
            CustomSubmitButton(
              label: AppStrings.submitIssueBtn,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),

      // NavBar
      bottomNavigationBar: const SharedBottomNav(
        currentIndex: 0,
      ),
    );
  }

  // Dropdown Widget
  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary50Color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          border: InputBorder.none,
          hintText: AppStrings.assetHint,
          hintStyle: TextStyle(color: AppColors.textPrimaryColor, fontSize: 13),
        ),
        items: const [],
        onChanged: (value) {},
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.slateGrey),
      ),
    );
  }

  // Issue Description Field
  Widget _buildDescriptionField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary50Color,
        borderRadius: BorderRadius.circular(12.5),
        border: Border.all(color: AppColors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const TextField(
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          border: InputBorder.none,
          hintText: AppStrings.issueDescHint,
          hintStyle: TextStyle(color: AppColors.textPrimaryColor, fontSize: 14),
        ),
      ),
    );
  }

  // Priority Buttons
  Widget _buildPriorityButtons() {
    return Row(
      children: [
        _buildPriorityBtn(AppStrings.lowPriority, AppColors.navyblue),
        const SizedBox(width: 12),
        _buildPriorityBtn(AppStrings.mediumPriority, AppColors.blue),
        const SizedBox(width: 12),
        _buildPriorityBtn(AppStrings.highPriority, AppColors.navyblue),
      ],
    );
  }

  // Priority Button
  Widget _buildPriorityBtn(String label, Color btnColor) {
    final bool isSelected = _selectedPriority == label;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPriority = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: Colors.white, width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}