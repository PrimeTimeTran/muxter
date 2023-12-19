import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class DataJsonObjectResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  DataResponse<T> mapToDataModel(response, Decoder<T>? decoder) {
    LogUtil.i(name: 'mapToDataModel', 'response');

    return decoder != null && response is Map<String, dynamic>
        ? DataResponse.fromJson(response, (json) => decoder(json))
        : throw ApiException(
            kind: ApiExceptionKind.invalidSuccessResponseMapperType,
            rootException: '$response is not a JSONDataObject',
          );
  }
}
