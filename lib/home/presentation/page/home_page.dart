import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/constant.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: _appBarContent(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _greetingWidget(),
            const SizedBox(
              height: 24,
            ),
            _searchWidget(),
            const SizedBox(
              height: 24,
            ),
            _popularJobWidget(),
            const SizedBox(
              height: 8,
            ),
            _recommendationJobWidget(),
          ],
        ),
      ),
    );
  }

  Widget _appBarContent() {
    return Container(
      height: AppBar().preferredSize.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            onTap: () {},
            icon: SvgPicture.asset(
              AppIcons.icCategory,
              width: 24,
              height: 24,
            ),
          ),
          CustomIconButton(
            onTap: () {},
            icon: SvgPicture.asset(
              AppIcons.icNotification,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _greetingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Dimas!',
            style: theme.textTheme.bodyText1?.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            AppStrings.homeGreeting,
            style: theme.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  AppProperties.shadow,
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.icSearch,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Expanded(
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: AppStrings.homeSearchHint,
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CustomIconButton(
            width: 48,
            height: 48,
            backgroundColor: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
            onTap: () {},
            icon: SvgPicture.asset(
              AppIcons.icFilter,
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularJobWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            AppStrings.homePopularJob,
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ItemJobPopular();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  Widget _recommendationJobWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            AppStrings.homeRecommendationJob,
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 236,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 124,
          ),
          itemBuilder: (context, index) {
            return const ItemJob();
          },
        ),
        /* SizedBox(
          height: 142,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomPrimaryCard(
                height: 142,
                width: 252,
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              AppImages.imgGojek,
                              height: 32,
                              width: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Tokopedia',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Onsite',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Senior Graphic Designer',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Design Agency • Jakarta, Id ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemCount: 5,
          ),
        ), */
      ],
    );
  }
}
