import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/entities/course.dart';

part 'event.dart';
part 'state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(CourseDetailInitial()) {
    on<TriggerCourseDetail>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });
  }
}
