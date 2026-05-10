import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Features/Admin/Data/Models/factory_model.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_cubit.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_state.dart';

class FactoryDetailsScreen extends StatelessWidget {
  final FactoryModel factoryModel;
  final AdminCubit adminCubit;

  const FactoryDetailsScreen({
    super.key,
    required this.factoryModel,
    required this.adminCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: adminCubit,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          title: const Text(
            "Factory Details",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<AdminCubit, AdminState>(
          listener: (context, state) {
            if (state is ReviewFactorySuccess) {
              FunctionsHelper.showSnackBar(
                context,
                message: state.msg,
                isError: false,
              );
              Navigator.pop(context);
            } else if (state is ReviewFactoryFailure) {
              FunctionsHelper.showSnackBar(context, message: state.errorMsg);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    factoryModel.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary100Color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary100Color),
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          Icons.person,
                          "Manager Name",
                          factoryModel.managerName,
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.email,
                          "Email",
                          factoryModel.managerEmail,
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.location_on,
                          "Location",
                          factoryModel.location,
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.description,
                          "Description",
                          factoryModel.description,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  state is ReviewFactoryLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade700,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<AdminCubit>().reviewFactory(
                                    factoryId: factoryModel.id,
                                    isApproved: false,
                                  );
                                },
                                child: const Text(
                                  "Reject",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade700,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<AdminCubit>().reviewFactory(
                                    factoryId: factoryModel.id,
                                    isApproved: true,
                                  );
                                },
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
