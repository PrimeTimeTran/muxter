import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

import 'base_interceptor.dart';

class PendingRequest {
  final RequestOptions options;

  final ErrorInterceptorHandler handler;
  PendingRequest(this.options, this.handler);
}

@injectable
class RefreshTokenInterceptor extends BaseInterceptor {
  final RefreshTokenRepository _repository;
  final NoneAuthenticatedRestApiClient _client;

  bool _isRefreshing = false;
  final Queue _pendingRequests = Queue<PendingRequest>();

  RefreshTokenInterceptor(this._repository, this._client);

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final options = err.response!.requestOptions;
      _onTokenExpired(options, handler);
    } else {
      handler.next(err);
    }
  }

  void _onRefreshTokenError(Object? error) {
    while (_pendingRequests.isNotEmpty) {
      final pendingRequest = _pendingRequests.removeFirst() as PendingRequest;
      final options = pendingRequest.options;
      final handler = pendingRequest.handler;

      handler.next(DioException(requestOptions: options, error: error));
    }
  }

  Future<void> _onRefreshTokenSuccess(String newAccessToken) async {
    LogUtil.i('START - Call pending requests', name: 'Refresh token');

    await Future.wait(
      _pendingRequests.map(
        (request) => _requestWithNewToken(
          pendingRequest: request,
          newAccessToken: newAccessToken,
        ),
      ),
    );
    LogUtil.i('END - Call pending requests', name: 'Refresh token');
  }

  Future<void> _onTokenExpired(
    RequestOptions options,
    ErrorInterceptorHandler handler,
  ) async {
    _pendingRequests.add(PendingRequest(options, handler));

    if (_isRefreshing) {
      return;
    }

    try {
      _isRefreshing = true;
      final newAccessToken = await _refreshToken();
      await _onRefreshTokenSuccess(newAccessToken);
    } catch (e) {
      _onRefreshTokenError(e);
    } finally {
      _isRefreshing = false;
      _pendingRequests.clear();
    }
  }

  Future<String> _refreshToken() async {
    return '';
    // return _repository.refreshToken();
  }

  Future<void> _requestWithNewToken({
    required PendingRequest pendingRequest,
    required String newAccessToken,
  }) async {
    final options = pendingRequest.options;
    final handler = pendingRequest.handler;

    // Add the new token to the header
    options.headers['Authorization'] = 'Bearer $newAccessToken';

    try {
      final response = await _client.dio.fetch(options);
      handler.resolve(response);
    } catch (e) {
      handler.next(DioException(requestOptions: options, error: e));
    }
  }
}
