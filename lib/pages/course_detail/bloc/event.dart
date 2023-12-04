part of 'bloc.dart';

class CourseDetailEvent {
  const CourseDetailEvent();
}

class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem) : super();
  final CourseItem courseItem;
}
