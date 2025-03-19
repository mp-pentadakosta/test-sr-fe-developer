import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/button_widget/button_widget.dart';

class HeaderListData extends StatelessWidget {
  const HeaderListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + context.iPadding.top + context.padding2,
      width: context.mQWidth(1),
      decoration: BoxDecoration(
        color: AppColors.elevationLevel(ElevationType.level1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2 + context.padding0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: context.padding2,
                          ),
                          context.sbWidth(2),
                          Text(
                            'Indonesia',
                            style: context.titleSmall,
                          ),
                        ],
                      ),
                      Text(
                        'Siap untuk pergi? Pilih destinasi impianmu sekarang!',
                        style: context.bodyMedium,
                      ),
                    ],
                  ),
                ),
                context.sbWidth(context.padding2),
                IButton.small(
                  label: 'Change',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          context.sbHeight(context.padding1)
        ],
      ),
    );
  }
}
