import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/core/data/entities/job_category_entity.dart';

class ItemJobCategory extends StatelessWidget {
  final JobCategoryEntity jobCategory;

  const ItemJobCategory({
    Key? key,
    required this.jobCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        jobCategory.name,
      ),
    );
  }
}
