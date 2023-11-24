import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/home_screen/bloc/home_bloc.dart';
import 'package:learning_app/application/pages/home_screen/widget/custom_min_page.dart';
import 'package:learning_app/application/pages/home_screen/widget/custom_text.dart';
import 'package:learning_app/application/pages/payment_page/payment_screen.dart';
import 'package:learning_app/application/pages/profile_page/widget/list_of_settings.dart';
import 'package:learning_app/application/pages/setting_page/setting_screen.dart';
import 'package:learning_app/application/pages/video_list_page/video_list_screen.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/entity/video_entity.dart';

import 'bloc/detail_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.courseId});
  final CourseEntity courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses Detail"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoading){
                return const Center(child: CircularProgressIndicator(color: Colors.amber,));
              }
              else if(state is DetailError){
                return const Center(
                  child: Text("Something wrong"),
                );
              }
              else if (state is DetailSuccess){
              return MainScreen(
                course: courseId,
                videos: state.videos,
                isItPaid: state.isItPaid,
              );
              
          
              }
          
              
              else{
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.course,required this.videos,required this.isItPaid});
  final CourseEntity course;
  final List<VideoEntity> videos;
  final bool isItPaid;

  @override
  Widget build(BuildContext context) {
    // final listOfCourses = BlocProvider.of<HomeBloc>(context).listOfCourses;
    // listOfCourses?.where(( ) => ,)
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomeImage(course: course),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(onpressed: () {}, txt: "Author page"),
              const SizedBox(width: 20),
              const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Text("0")
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Text("${course.score}")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text("Course Description",
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        Text(
          "${course.description}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: (){
              print(isItPaid);
              if(!isItPaid){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentPage(courses:course,)));
              }else{
              Navigator.push(context,MaterialPageRoute(builder:(_)=>VideoListScreen(videos:videos) ));
              }
            },
            child:!isItPaid?CustomeButton(buttonText: "Go Buy"):CustomeButton(buttonText: "Start")),
        ),
        Text(
          "The Courses Includes",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.start,
        ),
        CustomeRowWidget(
            label: "${course.lessonNum} total hours",
            icon: Icons.video_camera_back),
     const   CustomeRowWidget(
            label: "Total 30 Lessons", icon: Icons.document_scanner),
    const    CustomeRowWidget(label: "67 download files", icon: Icons.file_copy),
        Text(
          "Lesson List",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.start,
        ),
        for (var i = 0; i < videos.length; i++) ...{
          VideoCard(videos: videos, i: i)
        }
      ],
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.videos,
    required this.i,
  });

  final List<VideoEntity> videos;

  final int i;

  @override
  Widget build(BuildContext context) {
  final video =videos[i];
  
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/first.jpg",
                            fit: BoxFit.fill)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videos[i].titlte,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("lesson ${i+1}"),
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ));
  }
}
