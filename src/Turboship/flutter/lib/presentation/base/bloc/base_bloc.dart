import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turboship/all.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> with LogMixin {
  late CommonBloc _commonBloc;

  DisposeBag? _disposeBag;

  BaseBloc(super.initialState);

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  // Only use this getter when you are sure that the current user is logged in
  // User get currentUser => getIt.get<AppBloc>().state.currentUser!;

  /// If isSingletonBloc is true, the bloc should provide on top of the widget tree
  bool get isSingletonBloc => false;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      logError('Cannot add new event $event because $runtimeType was closed');
    }
  }

  @protected
  void addAutoDisposeItem(Object item) {
    _disposeBag ??= DisposeBag();
    _disposeBag!.addDisposable(item);
  }

  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    commonBloc.add(
      ExceptionEmitted(
        appExceptionWrapper: appExceptionWrapper,
      ),
    );

    return appExceptionWrapper.exceptionCompleter?.future;
  }

  @mustCallSuper
  @override
  Future<void> close() {
    _disposeBag?.dispose();

    return super.close();
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  Future<void> runBlocCatching({
    required FutureOr<void> Function() action,
    FutureOr<void> Function(AppException)? doOnError,
    FutureOr<void> Function()? doOnSubscribe,
    FutureOr<void> Function()? doOnSuccessOrError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = false,
    String? overrideErrorMessage,
  }) async {
    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      logError(e);

      if (handleLoading) {
        hideLoading();
      }

      if (!handleError && _isRefreshTokenFailed(e)) {
        _onRefreshTokenFailed();
      }

      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError) {
        await addException(
          AppExceptionWrapper(
            appException: e,
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      if (handleLoading && commonBloc.state.isLoading) {
        hideLoading();
      }

      await doOnEventCompleted?.call();
    }
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  bool _isRefreshTokenFailed(AppException exception) {
    if (exception is! ApiException) {
      return false;
    }

    return exception.kind == ApiExceptionKind.refreshTokenFailed;
  }

  void _onRefreshTokenFailed() {
    commonBloc.add(const ForceLogoutButtonPressed());
  }
}
