class MainScreenState {
  final String currentPage;

  MainScreenState({required this.currentPage});

  MainScreenState copyWith({String? currentPage}) {
    return MainScreenState(currentPage: currentPage ?? this.currentPage);
  }
}
