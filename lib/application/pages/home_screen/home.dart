import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/pages/home_screen/bloc/button_pressed_bloc.dart';
import 'package:learning_app/application/pages/home_screen/widget/search_bar.dart';
import 'package:learning_app/application/pages/user/bloc/user_bloc.dart';
import 'package:learning_app/domain/entity/course_entity.dart';

import 'bloc/home_bloc.dart';
import 'widget/custom_bar.dart';
import 'widget/custom_min_page.dart';
import 'widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  Color? _iconColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _iconColor = _focusNode.hasFocus ? Colors.amber : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: HomeBar()),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                List<CourseEntity> courses = state.courses;
                final userState = BlocProvider.of<UserBloc>(context).state;
                
                
                return CustomScrollView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if(userState is UserFetched) ...{
                      
                          SliverToBoxAdapter(
                      child: Text(
                        userState.user.userName,
                        style:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    },
                    
                    SliverToBoxAdapter(
                        child: CustomeSearchBar(
                            focusNode: _focusNode, iconColor: _iconColor)),
                    SliverToBoxAdapter(
                        child: CustomeMinPageView(
                      courses: courses,
                    )),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Choice your Course",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            CustomText(onpressed: () {}, txt: "See All"),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          CustomText(onpressed: () {
                            context.read<ButtonPressedBloc>().add(AllButtonPressed());
                          }, txt: "All"),
                          CustomText(
                              onpressed: () {

                                context
                                    .read<ButtonPressedBloc>()
                                    .add(PopularButtonPressed(courses:  courses));
                                   
                              },
                              txt: "Popular"),
                          CustomText(onpressed: () {}, txt: "Newest"),
                        ],
                      ),
                    ),
                    BlocBuilder<ButtonPressedBloc,ButtonPressedState>(builder:(context,state) {
                       if(state is GetAllPopularState) {
                        // print(state.courses);
                   return  MinWidget(courses: state.courses);
                    }else if(state is GetAllState){
                  return    MinWidget(courses: courses);
                    }else {
                      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                    }
                    }),
                   
                   
                    
                 
                  ],
                );
              } else if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Something wrong"),
                );
              }
            },
          ),
        ),
      
    );
  }
}

class MinWidget extends StatelessWidget {
   MinWidget({
    super.key,
   required this.courses,
  });
   List<CourseEntity> courses;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:const EdgeInsets.all(8),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
              childCount: courses.length,   
              (context, index) =>                  ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                        child: FadeInImage.assetNetwork(image:courses[index].imageUrl,fit: BoxFit.cover,placeholder:"assets/images/image_loader.jpg",)),
                        ),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15)),
    );
  }
}
