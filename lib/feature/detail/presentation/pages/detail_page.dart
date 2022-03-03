import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../home/home.dart';
import '../../detail.dart';

class DetailPage extends StatefulWidget {
  final int jobId;

  const DetailPage({
    Key? key,
    required this.jobId,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late Size _screen;
  late ThemeData _theme;

  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    _theme = Theme.of(context);

    return Consumer<JobProvider>(
      builder: (context, value, child) {
        final job = value.jobs.firstWhere(
          (element) => element.id == widget.jobId,
        );

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: _appBarContent(job),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                if (_screen.width < 800)
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 312,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _flexibleWidget(job),
                    ),
                  )
              ];
            },
            body: _mainWidget(job),
          ),
        );
      },
    );
  }

  Widget _appBarContent(JobEntity jobEntity) {
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: CustomIconButton(
              width: 40,
              height: 40,
              onTap: () {
                Provider.of<JobProvider>(context, listen: false)
                    .bookmark(widget.jobId);
              },
              backgroundColor:
                  jobEntity.isBookmarked ? AppColors.primary : null,
              icon: SvgPicture.asset(
                AppIcons.icBookmark,
                width: 24,
                height: 24,
                color: jobEntity.isBookmarked ? AppColors.white : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _flexibleWidget(JobEntity jobEntity) {
    final _jobCategories = [
      jobEntity.timeStatus,
      jobEntity.locationStatus,
      ...jobEntity.categories,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 56,
      ),
      child: Column(
        children: [
          CustomImageNetwork(
            jobEntity.company.logo,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            jobEntity.name,
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
            jobEntity.company.location,
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
                final category = _jobCategories[index];

                return ItemJobCategory(
                  jobCategory: category,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: _jobCategories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainWidget(JobEntity jobEntity) {
    return Container(
        padding: EdgeInsets.fromLTRB(
          24,
          _screen.width >= 800 ? 24 : 32,
          24,
          _screen.width >= 800 ? 24 : 0,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          boxShadow: [
            AppProperties.shadow,
          ],
        ),
        child: Row(
          children: [
            if (_screen.width >= 800)
              Expanded(
                flex: 2,
                child: _flexibleWidget(jobEntity),
              ),
            Expanded(
              flex: 3,
              child: Container(
                padding: _screen.width >= 800
                    ? EdgeInsets.fromLTRB(
                        24, _screen.width >= 800 ? 24 : 32, 24, 0)
                    : null,
                decoration: _screen.width >= 800
                    ? BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(28)),
                        boxShadow: [
                          AppProperties.shadow,
                        ],
                      )
                    : null,
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
                            tabs: const [
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
                            job: jobEntity,
                          ),
                          DetailCompanyScreen(
                            job: jobEntity,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
