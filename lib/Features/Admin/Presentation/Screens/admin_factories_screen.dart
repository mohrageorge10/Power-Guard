import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import '../Widgets/admin_app_bar.dart';
import '../Widgets/admin_bottom_nav.dart';
import '../Widgets/factory_item_card.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search factories by name or ID...',
                hintStyle: const TextStyle(
                  color: AppColors.slateGrey,
                  fontSize: 15,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.slateGrey,
                  size: 20,
                ),
                filled: true,
                fillColor: AppColors.primary100Color,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                FactoryListCard(
                  name: 'EcoPack Logistics',
                  factoryId: 'FAC-88231',
                  location: 'Berlin, DE',
                  imagePath: Assets.imagesEcoPack,
                  status: FactoryStatus.active,
                  onPrimaryAction: () {},
                  onRemove: () {},
                ),
                FactoryListCard(
                  name: 'Global Manufacturing...',
                  factoryId: 'FAC-00536',
                  location: 'Shenzhen, CN',
                  imagePath: Assets.imagesGlobal,
                  status: FactoryStatus.active,
                  onPrimaryAction: () {},
                  onRemove: () {},
                ),
                FactoryListCard(
                  name: 'Steel Works Inter...',
                  factoryId: 'FAC-11042',
                  location: 'Detroit, USA',
                  imagePath: Assets.imagesSteel,
                  status: FactoryStatus.suspended,
                  onPrimaryAction: () {},
                  onRemove: () {},
                ),
                FactoryListCard(
                  name: 'Alpha Textiles Ltd',
                  factoryId: 'FAC-00321',
                  location: 'Dhaka, BD',
                  imagePath: Assets.imagesAlpha,
                  status: FactoryStatus.rejected,
                  onPrimaryAction: () {},
                  onRemove: () {},
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
      bottomNavigationBar: const AdminBottomNav(currentIndex: 1),
    );
  }
}
