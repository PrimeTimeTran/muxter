import 'package:flutter/foundation.dart';
import 'package:turboship/all.dart';

import '../../entities/base/paged_list.dart';

abstract class BaseFutureListUseCase<Params extends BaseUsecaseParams, Output>
    extends BaseFutureUseCase<Params, List<Output>> {
  const BaseFutureListUseCase();
}

abstract class BaseFutureUseCase<Params extends BaseUsecaseParams, Output>
    extends BaseUseCase<Params, Future<Output>> {
  const BaseFutureUseCase();

  Future<Output> execute([Params? params]) async {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        logDebug('FutureUseCase params: $params');
      }
      final output = await buildUseCase(params ?? const NoParams() as Params);
      if (LogConfig.enableLogUseCaseOutput) {
        logDebug('FutureUseCase Output: $output');
      }
      return output;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logError('FutureUseCase Error: $e');
      }
      throw e is AppException ? e : AppException.unexpectedError(e);
    }
  }
}

abstract class BaseLoadMoreUseCase<Params extends BaseUsecaseParams, Output>
    extends BaseUseCase<Params, Future<PagedList<Output>>> {
  final int initialPageSize;

  final int initialPage;
  LoadMoreOutput<Output> _output;

  LoadMoreOutput<Output> _oldOutput;
  BaseLoadMoreUseCase({
    this.initialPageSize = PagingConstants.defaultPageSize,
    this.initialPage = PagingConstants.initialPage,
  })  : _output = LoadMoreOutput<Output>(
          items: [],
          page: initialPage,
          pageSize: initialPageSize,
        ),
        _oldOutput = LoadMoreOutput<Output>(
          items: [],
          page: initialPage,
          pageSize: initialPageSize,
        );

  int get page => _output.page;
  int get pageSize => _output.pageSize;

  Future<LoadMoreOutput<Output>> execute(
    Params params,
    bool isInitialLoad,
  ) async {
    try {
      if (isInitialLoad) {
        _output = LoadMoreOutput<Output>(
          items: <Output>[],
          page: initialPage,
          pageSize: initialPageSize,
        );
      }
      if (LogConfig.enableLogUseCaseInput) {
        logDebug(
          'LoadMoreUseCase Input: $params, page: $page, pageSize: $pageSize',
        );
      }
      final pagedList = await buildUseCase(params);

      final newOutput = _oldOutput.copyWith(
        items: pagedList.items,
        page: isInitialLoad
            ? initialPage + (pagedList.items.isNotEmpty ? 1 : 0)
            : _oldOutput.page + (pagedList.items.isNotEmpty ? 1 : 0),
        pageSize: isInitialLoad
            ? (initialPageSize + pagedList.items.length)
            : _oldOutput.pageSize + pagedList.items.length,
        hasNext: pagedList.hasNext,
        isRefreshSuccess: isInitialLoad,
      );

      _output = newOutput;
      _oldOutput = newOutput;
      if (LogConfig.enableLogUseCaseOutput) {
        logDebug(
          'LoadMoreUseCase Output: pagedList: $pagedList, inputPage: $page, inputPageSize: $pageSize, newOutput: $newOutput',
        );
      }

      return newOutput;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logError('FutureUseCase Error: $e');
      }
      _output = _oldOutput;

      throw e is AppException ? e : AppException.unexpectedError(e);
    }
  }
}

abstract class BaseStreamUseCase<Params extends BaseUsecaseParams, Output>
    extends BaseUseCase<Params, Stream<Output>> {
  const BaseStreamUseCase();

  Stream<Output> execute(Params params) {
    return buildUseCase(params).log(runtimeType.toString());
  }
}

abstract class BaseSyncUseCase<Params extends BaseUsecaseParams, Output>
    extends BaseUseCase<Params, Output> {
  const BaseSyncUseCase();

  Output execute([Params? params]) {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        logDebug('SyncUseCase params: $params');
      }
      final output = buildUseCase(params ?? const NoParams() as Params);
      if (LogConfig.enableLogUseCaseOutput) {
        logDebug('SyncUseCase Output: $output');
      }

      return output;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logError('SyncUseCase Error: $e');
      }

      throw e is AppException ? e : AppException.unexpectedError(e);
    }
  }
}

abstract class BaseUseCase<Params extends BaseUsecaseParams, Output>
    with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase(Params params);
}
