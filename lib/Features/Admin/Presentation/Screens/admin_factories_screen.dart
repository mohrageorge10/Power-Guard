import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_app_bar.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/factories_list.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/float_action_btn.dart';

class AdminFactoriesScreen extends StatefulWidget {
  const AdminFactoriesScreen({super.key});

  @override
  State<AdminFactoriesScreen> createState() => _AdminFactoriesScreenState();
}

class _AdminFactoriesScreenState extends State<AdminFactoriesScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['All', 'Active', 'Suspended', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AdminAppBar(),
      body: Column(
        children: [
          // Search Bar
          SearchBar(),

          const SizedBox(height: 20),

          // Filter Chips
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _tabs.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedTab == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () => setState(() => _selectedTab = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.primary100Color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _tabs[index],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.slateGrey,
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          if (index != 0) const SizedBox(width: 6),
                          if (index == 1)
                            Icon(
                              Icons.check_circle_outline,
                              size: 14,
                              color: isSelected
                                  ? AppColors.primary100Color
                                  : AppColors.slateGrey,
                            ),
                          if (index == 2)
                            Icon(
                              Icons.info_outline,
                              size: 14,
                              color: isSelected
                                  ? AppColors.primary100Color
                                  : AppColors.slateGrey,
                            ),
                          if (index == 3)
                            Icon(
                              Icons.error_outline,
                              size: 14,
                              color: isSelected
                                  ? AppColors.primary100Color
                                  : AppColors.slateGrey,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Factories List
          FactoriesList(),
        ],
      ),
      floatingActionButton: FloatActionBtn(),
    );
  }
}
