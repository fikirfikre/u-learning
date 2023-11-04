import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/usecase/get_course_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoursesUseCases coursesUseCases;
  List<CourseEntity>? listOfCourses;
  HomeBloc({required this.coursesUseCases}) : super(HomeInitial()) {
    on<HomeEvents>((event, emit) async{
      emit(HomeLoading());
      var failureOrCourses = await coursesUseCases.fetchCourse();
      failureOrCourses.fold((courses) {
        listOfCourses = courses;
        return emit(HomeSuccess(courses: courses));}, (r) => emit(HomeError()));

      // TODO: implement event handler
    });

  //  on<AllButtonPressed>((event,emit){
            
  //  });
  //  on<PopularButtonPressed>((event,emit){
  //   print("ll") ;
  //       // emit(HomeLoading());     
  //       List<CourseEntity> courses = listOfCourses!.where((element) => element.score > 7.0).toList();
  //       print("ll") ;
  //       emit(GetPopularSuccess(courses: courses));
  //  });
  }
}
