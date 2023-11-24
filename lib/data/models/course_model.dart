import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/course_entity.dart';

class CourseModel extends CourseEntity with EquatableMixin {
  CourseModel(
      {required super.courseId,
      required super.createdAt,
      required super.description,
      required super.follow,
      required super.imageUrl,
      required super.lessonNum,
      required super.name,
      required super.price,
      required super.score,
      required super.typeId,
      required super.updatedAt,
      required super.listOfuser});

  factory CourseModel.fromFirestore(DocumentSnapshot doc) {
Map<String, dynamic> json = doc.data() as Map<String,dynamic>;
    final imageUrl = json["image_url"];

    return CourseModel(
       
        courseId: doc.id,
        createdAt: (json["created_at"] ).toDate(),
        description: json["description"],
        follow: json["follow"],
        imageUrl: json["image_url"],
        lessonNum: json["lesson_num"],
        name: json["name"],
        price: json["price"],
        score: json["score"],
        typeId: json["type_id"].id,
        updatedAt: (json["updated_at"]).toDate(),
        listOfuser: json["listOfuser"]);
  }
}
