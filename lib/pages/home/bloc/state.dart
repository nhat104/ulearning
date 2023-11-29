class HomeState {
  HomeState({this.index = 0});

  final int index;

  HomeState copyWith({int? index}) {
    return HomeState(index: index ?? this.index);
  }
}
