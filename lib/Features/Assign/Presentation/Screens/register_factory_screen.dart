import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart'; 
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Assign/Presentation/Screens/app_under_review_screen.dart';
import 'package:power_guard/Features/Assign/Presentation/cubit/assign_cubit.dart';
import 'package:power_guard/Features/Assign/Presentation/cubit/assign_state.dart';
import '../../../Auth/Presentation/Widgets/custom_form_button.dart';
import '../../../Auth/Presentation/Widgets/custom_text_form_field.dart';

class RegisterFactoryScreen extends StatelessWidget {
  const RegisterFactoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AssignCubit, AssignState>(
          listener: (context, state) {
            if (state is RegisterFactorySuccess) {
              FunctionsHelper.showSnackBar(context, message: state.msg, isError: false);
              
              final cubit = context.read<AssignCubit>();
              // Navigate to the review screen and pass the entered data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ApplicationUnderReviewScreen(
                    factoryName: cubit.nameController.text,
                    factoryLocation: cubit.locationController.text,
                    factoryDescription: cubit.descriptionController.text,
                  ),
                ),
              );
            } else if (state is RegisterFactoryFailure) {
              FunctionsHelper.showSnackBar(context, message: state.errorMsg, isError: true);
            }
          },
          builder: (context, state) {
            final cubit = context.read<AssignCubit>();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: cubit.factoryFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    AuthHeader(
                      logo: AppStrings.appName,
                      title: 'Register your factory now',
                      subtitle: 'Enter the basic factory data for\nmanagement review and\napproval.',
                      fontSize: 18,
                      subtitleColor: AppColors.textPrimaryColor,
                    ),
                    const SizedBox(height: 27),
                    
                    CustomTextFormField(
                      controller: cubit.nameController,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightBlueBg,
                          blurRadius: 5,
                          offset: Offset(8, 8),
                        ),
                      ],
                      labelText: 'Factory name',
                      hintText: 'Example: Al Amal Iron and Steel Factory',
                      prefixIcon: Image.asset(Assets.imagesFactories, width: 20, height: 20),
                    ),
                    const SizedBox(height: 22),

                    CustomTextFormField(
                      controller: cubit.locationController,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightBlueBg,
                          blurRadius: 5,
                          offset: Offset(8, 8),
                        ),
                      ],
                      labelText: 'Factory location',
                      hintText: 'City, Industrial Area',
                      prefixIcon: Image.asset(Assets.imagesLocation, width: 20, height: 20),
                    ),
                    const SizedBox(height: 22),

                    CustomTextFormField(
                      controller: cubit.descriptionController,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightBlueBg,
                          blurRadius: 5,
                          offset: Offset(8, 8),
                        ),
                      ],
                      labelText: AppStrings.factoryDescription,
                      maxLines: 6,
                      minLines: 4,
                      hintText: AppStrings.factoryOverview,
                      prefixIcon: Image.asset(Assets.imagesDescription, width: 20, height: 20),
                    ),
                    const SizedBox(height: 52),

                    // Show loading indicator or the submit button
                    state is RegisterFactoryLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomFormButton(
                            innerText: AppStrings.submit,
                            onTap: () {
                              if (cubit.factoryFormKey.currentState!.validate()) {
                                cubit.registerFactory();
                              }
                            },
                            height: 50,
                            img: Assets.imagesTick,
                          ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}