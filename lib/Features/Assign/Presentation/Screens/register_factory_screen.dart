import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import '../../../Auth/Presentation/Widgets/custom_text_form_field.dart';
import '../../../Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Assign/Presentation/Screens/app_under_review_screen.dart';

class RegisterFactoryScreen extends StatefulWidget {
  const RegisterFactoryScreen({super.key});

  @override
  State<RegisterFactoryScreen> createState() => _RegisterFactoryScreenState();
}

class _RegisterFactoryScreenState extends State<RegisterFactoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ApplicationUnderReviewScreen(
            factoryName: _nameController.text,
            factoryLocation: _locationController.text,
            factoryDescription: _descriptionController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const BackArrow(
                ),
                const SizedBox(height: 25),



                // AuthHeader
                AuthHeader(
                  logo: AppStrings.appName,
                  title: 'Register your factory now',
                  subtitle:
                  'Enter the basic factory data for\nmanagement review and\napproval.',
                  fontSize: 18,
                  subtitleColor: AppColors.textPrimaryColor,
                ),
                const SizedBox(height: 27),

                // Factory name
                CustomTextFormField(
                  controller: _nameController,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightBlueBg,
                      blurRadius: 30,
                      offset: Offset(8, 8),
                    ),
                  ],
                  fieldHeight: 45,
                  labelText: 'Factory name',
                  hintText: 'Example: Al Amal Iron and Steel Factory',
                  prefixIcon: Image.asset(
                    Assets.imagesFactories,
                    width: 15,
                    height: 15,
                  ),
                ),
                const SizedBox(height: 10),

                // Factory location
                CustomTextFormField(
                  controller: _locationController,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightBlueBg,
                      blurRadius: 30,
                      offset: Offset(8, 8),
                    ),
                  ],
                  fieldHeight: 45,
                  labelText: 'Factory location',
                  hintText: 'City, Industrial Area',
                  prefixIcon: Image.asset(
                    Assets.imagesLocation,
                    width: 15,
                    height: 15,
                  ),
                ),
                const SizedBox(height: 10),

                // Factory description
                CustomTextFormField(
                  controller: _descriptionController,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightBlueBg,
                      blurRadius: 30,
                      offset: Offset(8, 8),
                    ),
                  ],
                  labelText: 'Factory description',
                  hintText: "A brief overview of the factory's products and field of work",
                  prefixIcon: Image.asset(
                    Assets. imagesDescription,
                    width: 15,
                    height: 15,
                  ),
                  fieldHeight: 90,
                ),
                const SizedBox(height: 32),

                //  CustomFormButton
                CustomFormButton(
                  innerText: 'Submitting a registration application',
                  onPressed: _submit,
                   height: 48,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}