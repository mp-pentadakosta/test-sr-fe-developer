import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../modules/detail_data/widget/card_package.dart';

import '../../../domain/model/model_data_dummy.dart';

class WidgetPackage extends StatelessWidget {
  final List<PricePackage> listPricePackage;
  const WidgetPackage({super.key, required this.listPricePackage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.sbHeight(context.padding2),
          Text(
            'Paket',
            style: context.headlineSmall,
          ),
          context.sbHeight(context.padding2),
          ...List.generate(
            listPricePackage.length,
            (index) => CardPackage(
              pricePackage: listPricePackage[index],
            ),
          ),
        ],
      ),
    );
  }
}
