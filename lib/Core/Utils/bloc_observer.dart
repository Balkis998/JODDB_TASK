import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    // Trigger checkAuthHandler on any state change (you can fine-tune this as needed)
    // if (bloc is CheckAuthCubit) {
    //   checkAuthCubit.checkAuthHandler();
    // }
    // if (bloc is RefreshTokenCubit) {
    //   refreshTokenCubit.refreshTokenHandler();
    // }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
