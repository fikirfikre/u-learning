import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String courseId;
  final String name;
  final String description;
  final int lessonNum;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int score;
  final int price;
  final bool follow;
  // final String userId;

  final String typeId;
  final String imageUrl;

  const  CourseEntity(
      {required this.courseId,
      required this.name,
      required this.description,
      required this.lessonNum,
      required this.createdAt,
      required this.updatedAt,
      required this.score,
      required this.price,
      required this.follow,
      // required this.userId,
      required this.typeId,
      required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
