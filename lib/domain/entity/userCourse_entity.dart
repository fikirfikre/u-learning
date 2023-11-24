import 'package:equatable/equatable.dart';

class UserCourseEntity extends Equatable{
  final String userId;
  final String courseId;
  DateTime? dateTime;
  UserCourseEntity({required this.userId,required this.courseId, this.dateTime});
  @override
  // TODO: implement props
  List<Object?> get props => [userId,courseId,dateTime];
}