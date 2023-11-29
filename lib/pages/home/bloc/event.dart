abstract class HomeEvent {
  const HomeEvent();
}

class HomeDots extends HomeEvent {
  final int index;

  const HomeDots(this.index);
}
