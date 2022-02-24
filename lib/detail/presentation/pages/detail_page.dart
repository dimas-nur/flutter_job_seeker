import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/detail/detail.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../../home/home.dart';

class DetailPage extends StatefulWidget {
  final JobEntity job;

  const DetailPage({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late ThemeData _theme;

  late final List<JobCategoryEntity> jobCategories;

  late final TabController _tabController;

  @override
  void initState() {
    jobCategories = [
      widget.job.timeStatus,
      widget.job.locationStatus,
    ];

    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: _appBarContent(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              expandedHeight: 312,
              flexibleSpace: FlexibleSpaceBar(
                background: _flexibleWidget(),
              ),
            )
          ];
        },
        body: _mainWidget(),
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
            width: 40,
            height: 40,
            onTap: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppIcons.icBackArrow,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              AppStrings.detailTittle,
              style: _theme.textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CustomIconButton(
            width: 40,
            height: 40,
            onTap: () {},
            icon: SvgPicture.asset(
              AppIcons.icBookmark,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _flexibleWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 56,
      ),
      child: Column(
        children: [
          CustomImageNetwork(
            widget.job.company.logo,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.job.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.job.company.location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 22,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final category = jobCategories[index];

                return ItemJobCategory(
                  jobCategory: category,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: jobCategories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        boxShadow: [
          AppProperties.shadow,
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: AppColors.blueSoft.withOpacity(0.3),
                  ),
                ),
              ),
              Positioned(
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: AppColors.primary,
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.primary,
                  tabs: [
                    Tab(
                      height: 48,
                      text: 'Description',
                    ),
                    Tab(
                      height: 48,
                      text: 'Company',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DetailDescriptionScreen(
                  job: widget.job,
                ),
                DetailCompanyScreen(
                  job: widget.job,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
