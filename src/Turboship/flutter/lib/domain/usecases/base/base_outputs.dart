import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turboship/all.dart';

import '../../../core/constants/ui/paging_constants.dart';

part 'base_outputs.freezed.dart';

abstract class BaseOutput {
  const BaseOutput();
}

@freezed
class LoadMoreOutput<T> extends BaseOutput with _$LoadMoreOutput<T> {
  const factory LoadMoreOutput({
    required List<T> items,
    @Default(0) int total,
    @Default(PagingConstants.initialPage) int page,
    @Default(PagingConstants.defaultPageSize) int pageSize,
    @Default(false) bool isRefreshSuccess,
    @Default(false) bool hasNext,
  }) = _LoadMoreOutput<T>;

  const LoadMoreOutput._();

  int get nextPage => page + 1;
  int get prevPage => page - 1;
}
