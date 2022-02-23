import 'dart:math';

import 'package:equatable/equatable.dart';

class JobSalaryEntity extends Equatable {
  final int minSalary;
  final int maxSalary;

  const JobSalaryEntity({
    required this.minSalary,
    required this.maxSalary,
  });

  @override
  List<Object> get props => [minSalary, maxSalary];

  JobSalaryEntity copyWith({
    int? minSalary,
    int? maxSalary,
  }) {
    return JobSalaryEntity(
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
    );
  }

  JobSalaryEntity randomExtra() {
    final min = Random().nextInt(10);
    final max = Random().nextInt(24);

    return copyWith(
      minSalary: minSalary - min,
      maxSalary: maxSalary + max,
    );
  }

  static const dummyJunior = JobSalaryEntity(
    minSalary: 50,
    maxSalary: 70,
  );

  static const dummySenior = JobSalaryEntity(
    minSalary: 70,
    maxSalary: 100,
  );
}
