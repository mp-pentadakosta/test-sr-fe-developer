import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sr_app_test/core/extensions/context_extensions.dart';
import 'package:sr_app_test/core/theme/app_colors.dart';
import 'package:sr_app_test/domain/model/model_data_dummy.dart';
import 'package:sr_app_test/modules/list_data/list_data_cubit.dart';
import 'package:sr_app_test/modules/list_data/widget/card_list_data.dart';
import 'package:sr_app_test/modules/list_data/widget/header_list_data.dart';
import 'package:sr_app_test/widgets/button_widget/button_widget.dart';
import 'package:sr_app_test/widgets/container_scaffold.dart';
import 'package:sr_app_test/widgets/image_widget.dart';

import '../../routes/main_route.dart';

@RoutePage()
class ListDataView extends StatelessWidget {
  static const routeName = '';

  const ListDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListDataCubit()..getListData(),
      child: const _ListDataBody(),
    );
  }
}

class _ListDataBody extends StatelessWidget {
  const _ListDataBody();

  @override
  Widget build(BuildContext context) {
    return ContainerScaffold(
      extendBody: true,
      automaticallyImplyLeading: true,
      forceMaterialTransparency: true,
      extendBodyBehindAppBar: true,
      appBar: false,
      backgroundColor: AppColors.background,
      child: BlocBuilder<ListDataCubit, ListDataState>(
        builder: (context, state) {
          return Column(
            children: [
              const HeaderListData(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        context.sbHeight(context.padding2),
                        if (state.listData.isEmpty && state.isLoading)
                          ...List.generate(
                            5,
                            (index) => Skeletonizer(
                              child: CardListData(
                                loading: true,
                                data: ModelDataDummy(
                                  pricePackage: [],
                                  title: 'title',
                                  location: 'location',
                                  photos: ['', ''],
                                  price: 'IDR 20.000',
                                  rating: 4.5,
                                  totalRating: 100,
                                  currentParticipants: 1,
                                  ratings: [],
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae nunc.',
                                  includedFacilities: [
                                    'AC',
                                    'TV',
                                    'Kamar Mandi'
                                  ],
                                  excludedFacilities: [
                                    'Wifi',
                                    'Kolam Renang',
                                    'Kolam Renang'
                                  ],
                                  termsAndConditions:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae nunc.',
                                  maxParticipants: 10,
                                ),
                              ),
                            ),
                          ),
                        if (state.listData.isNotEmpty && !state.isLoading)
                          ...state.listData.map(
                            (e) => CardListData(
                              loading: false,
                              data: e,
                              onTap: () {
                                context.pushRoute(
                                  DetailDataRoute(detailData: e),
                                );
                              },
                            ),
                          ),
                        context.sbHeight(
                          context.padding2 + context.iPadding.bottom,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
