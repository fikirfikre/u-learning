import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/application/pages/home_screen/bloc/home_bloc.dart';

import '../../../../domain/entity/course_entity.dart';
import '../../../../injection.dart';

part 'button_pressed_event.dart';
part 'button_pressed_state.dart';

class ButtonPressedBloc extends Bloc<ButtonPressedEvent, ButtonPressedState> {
  //  final HomeBloc homeBloc;
  
  ButtonPressedBloc() : super(GetAllState()) {
    // print(homeBloc.listOfCourses);
    on<AllButtonPressed>((event, emit) {
      // TODO: implement event handler
      emit(GetAllState());
    });
    on<PopularButtonPressed>((event, emit) {
      List<CourseEntity> courses = event.courses.where((course)=>course.score > 7).toList();
      emit(GetAllPopularState(courses:courses));
      
      });
  }
}
