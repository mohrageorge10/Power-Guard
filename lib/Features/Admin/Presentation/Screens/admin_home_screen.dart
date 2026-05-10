import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/factory_details_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_app_bar.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_item_card.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_title.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/overview_header.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_cubit.dart';
import 'package:power_guard/Features/Admin/Presentation/cubit/admin_state.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/badge.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AdminAppBar(),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          final cubit = context.read<AdminCubit>();

          if (state is GetDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetDashboardFailure) {
            return Center(child: Text("Error: ${state.errorMsg}"));
          }

          final data = cubit.dashboardModel;

          return RefreshIndicator(
            onRefresh: () => cubit.getDashboardData(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  OverviewHeader(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: KpiCard(
                          value: '${data?.activeFactories ?? 0}',
                          label: AppStrings.activeFactories,
                          iconAsset: Assets.imagesActiveFac,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: KpiCard(
                          value: '${data?.totalFactories ?? 0}',
                          label: AppStrings.totalFactories,
                          iconAsset: Assets.imagesTotalFac,
                          trailing: BuildBadge(text: AppStrings.newThisWeek),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  KpiCard(
                    value: '${data?.pendingFactories ?? 0}',
                    label: AppStrings.pendingRequests,
                    backgroundColor: AppColors.onBoardingBlue2,
                    iconAsset: Assets.imagesPenRequests,
                    trailing: BuildBadge(
                      isWhite: true,
                      text: AppStrings.pendingLabel,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const InboxTitle(),
                  const SizedBox(height: 20),
                  if (cubit.pendingFactories.isEmpty)
                    const Center(
                      child: Text(
                        "No pending requests right now.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.pendingFactories.length,
                      itemBuilder: (context, index) {
                        final factory = cubit.pendingFactories[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              final adminCubit = context.read<AdminCubit>();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                    value: adminCubit,
                                    child: FactoryDetailsScreen(
                                      factoryModel: factory,
                                      adminCubit: adminCubit,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: InboxItemCard(
                              senderName: factory.managerName,
                              companyName: factory.name,
                              timeAgo: "New",
                              onAccept: () {
                                print("Accepted Factory ID: ${factory.id}");
                              },
                              onReject: () {
                                print("Rejected Factory ID: ${factory.id}");
                              },
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
