import '../../../../core/exceptions/all.dart';
import '../base/base_error_response_mapper.dart';

class JsonObjectErrorResponseMapper extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
      errorCode: errorResponse?['errorCode'] as String?,
      message: errorResponse?['message'] as String?,
    );
  }
}
