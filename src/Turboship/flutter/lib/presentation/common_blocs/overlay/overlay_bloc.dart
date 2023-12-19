import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/duration_constants.dart';
import '../../common_widgets/alert.dart';

part 'overlay_bloc.freezed.dart';
part 'overlay_event.dart';
part 'overlay_state.dart';

@lazySingleton
class AppOverlayBloc extends Bloc<AppOverlayEvent, AppOverlayState> {
  AppOverlayBloc() : super(const AppOverlayState()) {
    on<ShowOverlayEvent>(_showAlert);
    on<HideOverlayEvent>(_hideAlert);
    on<ShowLoadingEvent>(_showLoading);
  }

  FutureOr<void> _hideAlert(
      HideOverlayEvent event, Emitter<AppOverlayState> emit) {
    emit(state.copyWith(alertMessage: null));
  }

  Future<FutureOr<void>> _showAlert(
      ShowOverlayEvent event, Emitter<AppOverlayState> emit) async {
    if (state.alertMessage != null) {
      add(const HideOverlayEvent());
      await Future.delayed(const Duration(milliseconds: 50));
    }

    final alertMessage = AlertMessage(
      message: event.message,
      type: event.alertType,
    );

    emit(state.copyWith(alertMessage: alertMessage));

    await Future.delayed(DurationConstants.defaultAlertMessageDuration, () {
      if (state.alertMessage != alertMessage) {
        return;
      }

      add(const HideOverlayEvent());
    });
  }

  FutureOr<void> _showLoading(
      ShowLoadingEvent event, Emitter<AppOverlayState> emit) {
    emit(state.copyWith(loading: true));
  }
}
