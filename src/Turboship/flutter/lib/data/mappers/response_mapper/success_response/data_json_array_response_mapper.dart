import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class DataJsonArrayResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  DataResponse<T> mapToDataModel(response, Decoder<T>? decoder) {
    LogUtil.i(
        name: 'data_json_array_response_mapper',
        'data_json_array_response_mapper');
    return decoder != null &&
            response is Map<String, dynamic> &&
            response.containsKey('data') &&
            response is List
        ? DataResponse.fromJson(
            response, (json) => decoder(json as List<dynamic>))
        : throw ApiException(
            kind: ApiExceptionKind.invalidSuccessResponseMapperType,
            rootException: '$response is not a JSONDataArray',
          );
  }
}
