import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_app_bar.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_item_card.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_cubit.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_state.dart';

class AdminInboxScreen extends StatelessWidget {
  const AdminInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AdminCubit>().getPendingFactories();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AdminAppBar(),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          final cubit = context.read<AdminCubit>();

          if (state is GetPendingFactoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cubit.pendingFactories.isEmpty) {
            return const Center(child: Text("No pending requests"));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: cubit.pendingFactories.length,
            itemBuilder: (context, index) {
              final factory = cubit.pendingFactories[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InboxItemCard(
                  senderName: factory.managerName,
                  companyName: factory.name,
                  timeAgo: "New Request",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
