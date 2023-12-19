import 'package:turboship/all.dart';

class PlainResponseMapper<T> extends BaseSuccessResponseMapper<T, T> {
  @override
  T mapToDataModel(response, Decoder<T>? decoder) {
    LogUtil.i(name: 'plain_response_mapper', 'plain_response_mapper');
    assert(decoder == null);
    if (response is T) {
      return response;
    } else {
      throw ApiException(
        kind: ApiExceptionKind.invalidSuccessResponseMapperType,
        rootException: 'Response is not $T',
      );
    }
  }
}
