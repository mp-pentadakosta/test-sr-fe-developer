import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/model/model_data_dummy.dart';
import '../../../widgets/button_widget/button_widget.dart';

class CardPackage extends StatelessWidget {
  final PricePackage pricePackage;
  const CardPackage({super.key, required this.pricePackage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.showModalBottomSheetCustom(
              child: _BottomSheetDataDetailPackage(pricePackage: pricePackage),
            );
          },
          child: Container(
            width: context.mQWidth(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.padding2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              children: [
                Text(
                  pricePackage.title,
                  style: context.titleSmall,
                ),
                context.sbHeight(context.padding0),
                Text(
                  pricePackage.description,
                  style: context.bodyMedium,
                ),
                context.sbHeight(context.padding1),
                Text(
                  pricePackage.includedFacilities.join(', '),
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.backdrop,
                  ),
                ),
                context.sbHeight(context.padding1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pricePackage.price,
                      style: context.headlineSmall?.copyWith(
                        color: AppColors.error.withAlpha(120),
                      ),
                    ),
                    IButton.small(
                      label: 'Pilih',
                      padding: EdgeInsets.symmetric(
                        horizontal: context.padding4,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        context.sbHeight(context.padding1),
      ],
    );
  }
}

class _BottomSheetDataDetailPackage extends StatelessWidget {
  final PricePackage pricePackage;
  const _BottomSheetDataDetailPackage({required this.pricePackage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mQWidth(1),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pricePackage.title, style: context.titleLarge),
                  ],
                ),
                context.sbHeight(context.padding2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Detail paket',
                        style: context.labelMedium?.copyWith()),
                    Text(pricePackage.description, style: context.bodyMedium),
                  ],
                ),
                context.sbHeight(context.padding2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fasilitas yang termasuk',
                        style: context.labelMedium?.copyWith()),
                    Text(pricePackage.excludedFacilities.join(', '),
                        style: context.bodyMedium),
                  ],
                ),
                context.sbHeight(context.padding2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fasilitas yang tidak termasuk',
                        style: context.labelMedium?.copyWith()),
                    Text(pricePackage.includedFacilities.join(', '),
                        style: context.bodyMedium),
                  ],
                ),
                context.sbHeight(context.padding2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Syarat dan ketentuan',
                        style: context.labelMedium?.copyWith()),
                    Text(pricePackage.termsAndConditions,
                        style: context.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.padding2),
                  topRight: Radius.circular(context.padding2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.padding2,
                vertical: context.padding2,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pricePackage.price,
                        style: context.headlineSmall?.copyWith(
                          color: AppColors.error.withAlpha(120),
                        ),
                      ),
                      IButton.small(
                        label: 'Pilih',
                        padding: EdgeInsets.symmetric(
                          horizontal: context.padding4,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  context.sbHeight(context.iPadding.bottom),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
