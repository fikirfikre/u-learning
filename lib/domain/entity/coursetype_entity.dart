import 'package:equatable/equatable.dart';

class CourseTypeEntity extends Equatable{
  final String courseTypeId;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

 const CourseTypeEntity({
    required this.courseTypeId,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.updatedAt
  });


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();}