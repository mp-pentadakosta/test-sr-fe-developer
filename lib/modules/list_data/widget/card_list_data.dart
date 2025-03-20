import 'package:flutter/material.dart';
import 'package:sr_app_test/core/theme/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../domain/model/model_data_dummy.dart';
import '../../../widgets/image_widget.dart';

class CardListData extends StatelessWidget {
  final bool loading;
  final ModelDataDummy data;
  final VoidCallback? onTap;
  const CardListData({
    super.key,
    required this.data,
    this.onTap,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          overlayColor: WidgetStateProperty.all(
            AppColors.elevationLevel(ElevationType.level0),
          ),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.padding2),
              color: AppColors.elevationLevel(ElevationType.level1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withAlpha(20),
                  spreadRadius: 0.5,
                  offset: const Offset(0, 1),
                  blurRadius: 0.1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.padding2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...data.photos.map(
                          (img) {
                            var index = data.photos.indexOf(img);
                            return loading
                                ? Container(
                                    height: 120,
                                    width: 230,
                                    color: AppColors.elevationLevel(
                                      ElevationType.level1,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      ImageWidget(
                                        image: img,
                                        height: 120,
                                        width: 230,
                                        fit: BoxFit.fitWidth,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: index == 0 ||
                                                  index ==
                                                      data.photos.length - 1
                                              ? const Radius.circular(0)
                                              : Radius.circular(
                                                  context.padding2,
                                                ),
                                          bottomRight: index == 0 ||
                                                  index ==
                                                      data.photos.length - 1
                                              ? const Radius.circular(0)
                                              : Radius.circular(
                                                  context.padding2,
                                                ),
                                          topLeft: index == 0
                                              ? Radius.circular(
                                                  context.padding2)
                                              : const Radius.circular(0),
                                          topRight: index == 0
                                              ? const Radius.circular(0)
                                              : Radius.circular(
                                                  context.padding2,
                                                ),
                                        ),
                                      ),
                                      if (index != data.photos.length - 1)
                                        context.sbWidth(context.padding0),
                                    ],
                                  );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: context.mQWidth(1),
                    color: AppColors.background,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.padding1,
                      vertical: context.padding1,
                    ),
                    child: Text(
                      data.excludedFacilities.join(', '),
                      style: context.labelSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.padding1,
                      vertical: context.padding1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        context.sbHeight(context.padding0),
                        Row(
                          children: [
                            Icon(
                              Icons.emoji_events,
                              size: context.padding2,
                              color: AppColors.primary,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${data.rating} ',
                                    style: context.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/ 5.0 (${data.totalRating} reviews)',
                                    style: context.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              data.price,
                              style: context.titleSmall?.copyWith(
                                color: AppColors.error.withAlpha(190),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        context.sbHeight(context.padding2),
      ],
    );
  }
}
