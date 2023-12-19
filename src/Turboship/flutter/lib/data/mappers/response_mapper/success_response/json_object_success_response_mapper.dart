import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class JsonObjectSuccessResponseMapper<T>
    implements BaseSuccessResponseMapper<T, T> {
  @override
  T mapToDataModel(dynamic response, Decoder<T>? decoder) {
    LogUtil.i(
        name: 'json_object_success_response_mapper',
        'json_object_success_response_mapper');
    return decoder != null && response is Map<String, dynamic>
        ? decoder(response)
        : throw ApiException(
            kind: ApiExceptionKind.invalidSuccessResponseMapperType,
            rootException: '$response is not a JSONObject',
          );
  }
}
