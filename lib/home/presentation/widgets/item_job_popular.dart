import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/home/presentation/presentation.dart';

import '../../../core/core.dart';

class ItemJobPopular extends StatelessWidget {
  const ItemJobPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryCard(
      height: 180,
      width: 248,
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.imgGojek,
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Flexible(
                      child: Text(
                        '\$50K - \$60K',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
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
          SizedBox(
            height: 22,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ItemJobCategory();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
