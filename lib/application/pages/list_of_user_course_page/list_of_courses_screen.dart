import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/detail_page/bloc/detail_bloc.dart';
import 'package:learning_app/domain/entity/course_entity.dart';

import '../detail_page/detail_screen.dart';
import 'bloc/courses_bloc.dart';

class ListOfCoursesScreen extends StatelessWidget {
  const ListOfCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Courses",
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.w900, fontSize: 28),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            )),
      ),
      body: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {

          if(state is CoursesLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is CoursesErorr){
            return const Center(
              child: Text("Something wrong"),
            );
          }
          else if(state is CoursesLoaded){
            List<CourseEntity> courses = state.courses;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (contex, index) {
                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<DetailBloc>(context).add(VerifyPayment(courseId: courses[index].courseId));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPage(courseId: courses[index])));
                      },
                      child: ListTile(
                      
                        contentPadding: EdgeInsets.all(10),
                        // tileColor: Colors.amber,
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(courses[index].imageUrl)),
                        title:Text(courses[index].name,style:const TextStyle(fontSize: 20,color: Colors.amber,fontWeight: FontWeight.bold),),

                        ));
                }),
          );
          }
          else{
            return Container(
              child: Text("data"),
            );
          }
        },
      ),
    );
  }
}
