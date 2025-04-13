import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/Presentation/View/home_screen.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenState(currentPage: HomeScreen.id));

  void changePage(String pageId) {
    emit(state.copyWith(currentPage: pageId));
  }

  Future<bool> onWillPop() async {
    if (state.currentPage != HomeScreen.id) {
      changePage(HomeScreen.id);
      return false;
    }

    return true;
  }
}
