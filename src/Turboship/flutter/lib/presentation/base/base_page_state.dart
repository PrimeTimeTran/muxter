import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turboship/all.dart';

import 'exception_handler/exception_handler.dart';
import 'exception_handler/exception_message_mapper.dart';

abstract class BasePageState<P extends StatefulWidget, B extends BaseBloc>
    extends State<P>
    with LogMixin, AppThemeMixin, AppLocalizationMixin
    implements ExceptionHandlerListener {
  late final CommonBloc commonBloc;
  late final B bloc;

  late final ExceptionHandler exceptionHandler;
  final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late Future<dynamic> _initBLocsFeature;

  bool get allowLoadingIndicator => true;

  // Only use this method when logged in
  // User get currentUser => getIt.get<AppBloc>().state.currentUser!;

  CustomExceptionMessageParser? get customExceptionMessageParser => null;

  bool get provideNewBloc => true;

  void addFirstEvent() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _initBLocsFeature,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: AppDefaultLoading(),
          );
        }

        return MultiBlocProvider(
          providers: [
            bloc.isSingletonBloc || !provideNewBloc
                ? BlocProvider.value(value: bloc)
                : BlocProvider(create: (_) => bloc),
            BlocProvider(create: (_) => commonBloc),
          ],
          child: BlocListener<CommonBloc, CommonState>(
            listenWhen: (previous, current) =>
                previous.appExceptionWrapper != current.appExceptionWrapper &&
                current.appExceptionWrapper != null,
            listener: (context, state) {
              handleException(state.appExceptionWrapper!);
            },
            child: buildPageListeners(
              child: !allowLoadingIndicator
                  ? buildPage(context)
                  : Stack(
                      children: [
                        buildPage(context),
                        _buildLoadingIndicator(),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPage(BuildContext context);

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() {
    return Container(
      color: context.colorTheme.bgSurfaceInverseMain.withOpacity(0.5),
      alignment: Alignment.center,
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(Sizes.s32),
            decoration: BoxDecoration(
              color: context.colorTheme.bgSurfaceMain,
              borderRadius: AppRadius.borderRadius12,
              boxShadow: [
                BoxShadow(
                  color:
                      context.colorTheme.bgSurfaceInverseMain.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: const AppDefaultLoading(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (!bloc.isSingletonBloc) {
      bloc.close();
    }
    super.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(
      context,
      appException,
      customMessageParser: customExceptionMessageParser,
    );
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    exceptionHandler = ExceptionHandler(
      context: context,
      listener: this,
    );
    _initBLocsFeature = _initBlocs();
  }

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(const ForceLogoutButtonPressed());
  }

  Widget _buildLoadingIndicator() {
    return BlocBuilder<CommonBloc, CommonState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (!state.isLoading) {
          return AppSpacing.emptyBox;
        }

        return buildPageLoading();
      },
    );
  }

  Future _initBlocs() async {
    try {
      bloc = getIt.get<B>();
    } catch (e) {
      bloc = await getIt.getAsync<B>();
    }

    // commonBloc = getIt.get<CommonBloc>();
    // bloc.commonBloc = commonBloc;
    if (bloc.isSingletonBloc) {
      commonBloc = bloc.commonBloc;
    } else {
      commonBloc = getIt.get<CommonBloc>();
      bloc.commonBloc = commonBloc;
    }

    addFirstEvent();
  }
}
