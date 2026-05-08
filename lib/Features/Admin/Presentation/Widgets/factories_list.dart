
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/factory_item_card.dart';

class FactoriesList extends StatelessWidget {
  const FactoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          FactoryListCard(
            name: AppStrings.company1,
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
    );
  }
}
