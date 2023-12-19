import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class RecordsJsonArraySuccessResponseMapper<T>
    implements BaseSuccessResponseMapper<T, PagedListModel<T>> {
  @override
  PagedListModel<T> mapToDataModel(dynamic response, Decoder<T>? decoder) {
    LogUtil.i(
        name: 'paged_json_array_success_response_mapper',
        'paged_json_array_success_response_mapper');
    LogUtil.i(name: 'plain_response_mapper', 'plain_response_mapper');
    return decoder != null && response is Map<String, dynamic>
        ? PagedListModel<T>.fromJson(response, (dynamic json) => decoder(json))
        : throw ApiException(
            kind: ApiExceptionKind.invalidSuccessResponseMapperType,
            rootException: '$response is not a JSONObject',
          );
  }
}
