import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class JsonArraySuccessResponseMapper<T>
    implements BaseSuccessResponseMapper<T, List<T>> {
  @override
  List<T> mapToDataModel(dynamic response, Decoder<T>? decoder) {
    LogUtil.i(
        name: 'json_array_success_response_mapper',
        'json_array_success_response_mapper');
    return decoder != null && response is List
        ? response
            .map((dynamic jsonObject) => decoder(jsonObject))
            .toList(growable: false)
        : throw ApiException(
            kind: ApiExceptionKind.invalidSuccessResponseMapperType,
            rootException: '$response is not a JSONArray',
          );
  }
}
