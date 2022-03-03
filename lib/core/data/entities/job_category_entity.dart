import 'package:equatable/equatable.dart';

class JobCategoryEntity extends Equatable {
  final int id;
  final String name;

  const JobCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  JobCategoryEntity copyWith({
    int? id,
    String? name,
  }) {
    return JobCategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  // Time status
  static const fullTime = JobCategoryEntity(
    id: 1,
    name: 'Full Time',
  );
  static const partTime = JobCategoryEntity(
    id: 2,
    name: 'Part Time',
  );

  // Location status
  static const onsite = JobCategoryEntity(
    id: 3,
    name: 'Onsite',
  );
  static const remote = JobCategoryEntity(
    id: 4,
    name: 'Remote',
  );

  // Level
  static const junior = JobCategoryEntity(
    id: 5,
    name: 'Junior',
  );
  static const senior = JobCategoryEntity(
    id: 6,
    name: 'Senior',
  );
}
