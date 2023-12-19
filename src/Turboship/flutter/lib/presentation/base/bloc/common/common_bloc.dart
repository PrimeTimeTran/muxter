import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

part 'common_bloc.freezed.dart';
part 'common_event.dart';
part 'common_state.dart';

@injectable
class CommonBloc extends Bloc<CommonEvent, CommonState> {
  // final LogoutUseCase _logoutUseCase;

  CommonBloc() : super(const CommonState()) {
    on<ExceptionEmitted>(_onExceptionEmitted);
    on<ForceLogoutButtonPressed>(_onForceLogoutButtonPressed);
    on<LoadingVisibilityEmitted>(_onLoadingVisibilityEmitted);
  }

  FutureOr<void> _onExceptionEmitted(
      ExceptionEmitted event, Emitter<CommonState> emit) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  FutureOr<void> _onForceLogoutButtonPressed(
      ForceLogoutButtonPressed event, Emitter<CommonState> emit) async {
    // await _logoutUseCase.execute();
    // getIt<AppBloc>().add(const LoggedUserChanged(null));
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
      LoadingVisibilityEmitted event, Emitter<CommonState> emit) {
    emit(
      state.copyWith(
        isLoading: state.loadingCount == 0 && event.isLoading
            ? true
            : state.loadingCount == 1 && !event.isLoading ||
                    state.loadingCount <= 0
                ? false
                : state.isLoading,
        loadingCount: event.isLoading
            ? state.loadingCount.plus(1)
            : state.loadingCount.minus(1),
      ),
    );
  }
}
