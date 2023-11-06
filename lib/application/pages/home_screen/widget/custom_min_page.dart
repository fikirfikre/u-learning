import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/detail_page/bloc/detail_bloc.dart';
import 'package:learning_app/application/pages/detail_page/detail_screen.dart';
import 'package:learning_app/constant/list_of_courses.dart';

import '../../../../domain/entity/course_entity.dart';

class CustomeMinPageView extends StatefulWidget {
  CustomeMinPageView({
    super.key,
     required this.courses
  });
  final List<CourseEntity> courses;

  @override
  State<CustomeMinPageView> createState() => _CustomeMinPageViewState();
}

class _CustomeMinPageViewState extends State<CustomeMinPageView> {
//  final int _itemCount = widget.courses.length;

  int index = 0;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },

              scrollDirection: Axis.horizontal,
              itemCount: widget.courses.length,
              itemBuilder: (context, index) {
                final course = widget.courses[index];
                // print(_itemCount);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                   
                  ),
                  // margin: const EdgeInsets.all(8),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.topRight,
                    children: [
                     
                       ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                        child: CustomeImage(course: course)),
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                            Text("Ongoing",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16),),
                            SizedBox(height: 15,),
                            Text("${course.name}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                            Text("${course.lessonNum}  lesson",style: TextStyle(color: Colors.white),),

                          //  Container(
                          //   width: 100,
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //     color: Colors.amber,
                          //     borderRadius: BorderRadius.circular(20)
                          //   ),
                          //  )
                         const SizedBox(height: 15,),
                          ElevatedButton(onPressed: (){
                            print(course.courseId);
                            BlocProvider.of<DetailBloc>(context).add(ContinueButtonPressed(courseId: course.courseId));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(courseId: course ,)));
                          }, child: Text("Continue"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber) ),)
                                                 ],
                                               ),
                         ),
                    ],
                  ),
                );
              }),
        ),
        DotsIndicator(
            decorator: const DotsDecorator(
                activeColor: Colors.amber,
                size: Size(8, 8),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                activeSize: Size(20, 8)),
            position: index,
            dotsCount: widget.courses.length)
      ],
    );
  }
}

class CustomeImage extends StatelessWidget {
  const CustomeImage({
    super.key,
    required this.course,
  });

  final CourseEntity course;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(image:course.imageUrl,fit: BoxFit.cover,placeholder:"assets/images/image_loader.jpg",);
  }
}