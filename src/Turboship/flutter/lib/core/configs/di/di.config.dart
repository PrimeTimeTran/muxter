// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:turboship/all.dart' as _i6;
import 'package:turboship/core/configs/di/di.dart' as _i44;
import 'package:turboship/core/configs/di/raw_config.dart' as _i17;
import 'package:turboship/core/configs/env_config.dart' as _i27;
import 'package:turboship/data/datasources/all.dart' as _i22;
import 'package:turboship/data/datasources/auth_datasource.dart' as _i35;
import 'package:turboship/data/datasources/entity_datasource.dart' as _i30;
import 'package:turboship/data/datasources/providers/api/api.dart' as _i20;
import 'package:turboship/data/datasources/providers/api/clients/authenticated_rest_api_client.dart'
    as _i29;
import 'package:turboship/data/datasources/providers/api/clients/none_authenticated_rest_api_client.dart'
    as _i16;
import 'package:turboship/data/datasources/providers/api/clients/refresh_token_rest_api_client.dart'
    as _i23;
import 'package:turboship/data/datasources/providers/api/interceptor/access_token_interceptor.dart'
    as _i3;
import 'package:turboship/data/datasources/providers/api/interceptor/connectivity_interceptor.dart'
    as _i8;
import 'package:turboship/data/datasources/providers/api/interceptor/log_interceptor.dart'
    as _i9;
import 'package:turboship/data/datasources/providers/api/interceptor/refresh_token_interceptor.dart'
    as _i28;
import 'package:turboship/data/datasources/providers/api/interceptor/trim_interceptor.dart'
    as _i25;
import 'package:turboship/data/datasources/refresh_token_datasource.dart'
    as _i19;
import 'package:turboship/data/datasources/user_datasource.dart' as _i33;
import 'package:turboship/data/mappers/all.dart' as _i38;
import 'package:turboship/data/mappers/entity_mapper.dart' as _i13;
import 'package:turboship/data/mappers/response_mapper/success_response/data_json_array_response_mapper.dart'
    as _i10;
import 'package:turboship/data/mappers/response_mapper/success_response/data_json_object_response_mapper.dart'
    as _i11;
import 'package:turboship/data/mappers/response_mapper/success_response/json_array_success_response_mapper.dart'
    as _i14;
import 'package:turboship/data/mappers/response_mapper/success_response/json_object_success_response_mapper.dart'
    as _i15;
import 'package:turboship/data/mappers/response_mapper/success_response/paged_json_array_success_response_mapper.dart'
    as _i18;
import 'package:turboship/data/mappers/server_config_mapper.dart' as _i24;
import 'package:turboship/data/mappers/user_mapper.dart' as _i26;
import 'package:turboship/data/repositories/auth_repo_impl.dart' as _i37;
import 'package:turboship/data/repositories/entity_repo_impl.dart' as _i31;
import 'package:turboship/data/repositories/refresh_token_repo.dart' as _i21;
import 'package:turboship/data/repositories/user_repo_impl.dart' as _i34;
import 'package:turboship/domain/all.dart' as _i36;
import 'package:turboship/domain/repositories/user_repo.dart' as _i42;
import 'package:turboship/domain/usecases/entities/get_entities_usecase.dart'
    as _i32;
import 'package:turboship/domain/usecases/get_server_config_usecases.dart'
    as _i40;
import 'package:turboship/domain/usecases/user/get_current_user_usecase.dart'
    as _i39;
import 'package:turboship/domain/usecases/user/update_user_usecase.dart'
    as _i41;
import 'package:turboship/presentation/base/bloc/common/common_bloc.dart'
    as _i7;
import 'package:turboship/presentation/common_blocs/app/app_bloc.dart' as _i43;
import 'package:turboship/presentation/common_blocs/entity_bloc/entity_bloc.dart'
    as _i12;
import 'package:turboship/presentation/common_blocs/overlay/overlay_bloc.dart'
    as _i5;
import 'package:turboship/presentation/routing/observer/navigator_observer.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AccessTokenInterceptor>(() => _i3.AccessTokenInterceptor());
    gh.lazySingleton<_i4.AppNavigatorObserver>(
        () => _i4.AppNavigatorObserver());
    gh.lazySingleton<_i5.AppOverlayBloc>(() => _i5.AppOverlayBloc());
    await gh.singletonAsync<_i6.AppPreferences>(
      () => registerModule.appPreferences,
      preResolve: true,
    );
    gh.factory<_i7.CommonBloc>(() => _i7.CommonBloc());
    gh.factory<_i8.ConnectivityInterceptor>(
        () => _i8.ConnectivityInterceptor());
    gh.factory<_i9.CustomLogInterceptor>(() => _i9.CustomLogInterceptor(
          enableLogRequestInfo: gh<bool>(),
          enableLogSuccessResponse: gh<bool>(),
          enableLogErrorResponse: gh<bool>(),
          enableLogHeader: gh<bool>(),
          enableLogRequestBody: gh<bool>(),
          enableLogResponseData: gh<bool>(),
        ));
    gh.factory<_i10.DataJsonArrayResponseMapper<dynamic>>(
        () => _i10.DataJsonArrayResponseMapper<dynamic>());
    gh.factory<_i11.DataJsonObjectResponseMapper<dynamic>>(
        () => _i11.DataJsonObjectResponseMapper<dynamic>());
    gh.lazySingleton<_i12.EntityBloc>(() => _i12.EntityBloc());
    gh.factory<_i13.EntityMapper>(() => _i13.EntityMapper());
    gh.factory<_i14.JsonArraySuccessResponseMapper<dynamic>>(
        () => _i14.JsonArraySuccessResponseMapper<dynamic>());
    gh.factory<_i15.JsonObjectSuccessResponseMapper<dynamic>>(
        () => _i15.JsonObjectSuccessResponseMapper<dynamic>());
    gh.lazySingleton<_i16.NoneAuthenticatedRestApiClient>(
        () => _i16.NoneAuthenticatedRestApiClient());
    await gh.singletonAsync<_i17.RawConfig>(
      () => registerModule.configEnv(),
      preResolve: true,
    );
    gh.factory<_i18.RecordsJsonArraySuccessResponseMapper<dynamic>>(
        () => _i18.RecordsJsonArraySuccessResponseMapper<dynamic>());
    gh.lazySingleton<_i19.RefreshTokenDatasource>(() =>
        _i19.RefreshTokenDatasource(gh<_i20.NoneAuthenticatedRestApiClient>()));
    gh.lazySingleton<_i21.RefreshTokenRepository>(
        () => _i21.RefreshTokenRepository(
              gh<_i22.RefreshTokenDatasource>(),
              gh<_i22.AppPreferences>(),
            ));
    gh.lazySingleton<_i23.RefreshTokenRestApiClient>(
        () => _i23.RefreshTokenRestApiClient());
    gh.factory<_i24.ServerConfigMapper>(() => _i24.ServerConfigMapper());
    gh.factory<_i25.TrimInterceptor>(() => _i25.TrimInterceptor());
    gh.factory<_i26.UserMapper>(() => _i26.UserMapper());
    gh.singleton<_i27.EnvConfig>(_i27.EnvConfig(gh<_i17.RawConfig>()));
    gh.factory<_i28.RefreshTokenInterceptor>(() => _i28.RefreshTokenInterceptor(
          gh<_i6.RefreshTokenRepository>(),
          gh<_i6.NoneAuthenticatedRestApiClient>(),
        ));
    gh.lazySingleton<_i29.AuthenticatedRestApiClient>(
        () => _i29.AuthenticatedRestApiClient(
              refreshTokenInterceptor: gh<_i6.RefreshTokenInterceptor>(),
              accessTokenInterceptor: gh<_i6.AccessTokenInterceptor>(),
            ));
    gh.lazySingleton<_i30.EntityDataSource>(
        () => _i30.EntityDataSourceImpl(gh<_i6.AuthenticatedRestApiClient>()));
    gh.lazySingleton<_i6.EntityRepository>(() => _i31.EntityRepositoryImpl(
          gh<_i30.EntityDataSource>(),
          gh<_i6.EntityMapper>(),
          gh<_i6.AppPreferences>(),
          gh<_i6.RefreshTokenRepository>(),
        ));
    gh.factory<_i32.GetEntitiesUseCase>(
        () => _i32.GetEntitiesUseCase(gh<_i6.EntityRepository>()));
    gh.lazySingleton<_i33.UserDataSource>(
        () => _i33.UserDataSourceImpl(gh<_i6.AuthenticatedRestApiClient>()));
    gh.lazySingleton<_i6.UserRepository>(() => _i34.UserRepositoryImpl(
          gh<_i6.UserDataSource>(),
          gh<_i6.UserMapper>(),
          gh<_i6.AppPreferences>(),
          gh<_i6.RefreshTokenRepository>(),
        ));
    gh.factory<_i35.AuthDatasource>(() => _i35.AuthDataSourceImpl(
          gh<_i20.NoneAuthenticatedRestApiClient>(),
          gh<_i20.AuthenticatedRestApiClient>(),
        ));
    gh.factory<_i36.AuthRepository>(() => _i37.AuthRepositoryImpl(
          gh<_i22.AppPreferences>(),
          gh<_i22.AuthDatasource>(),
          gh<_i38.ServerConfigMapper>(),
        ));
    gh.factory<_i39.GetCurrentUserUseCase>(
        () => _i39.GetCurrentUserUseCase(gh<_i6.UserRepository>()));
    gh.factory<_i40.GetServerConfigUseCase>(
        () => _i40.GetServerConfigUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i41.UpdateUserUseCase>(
        () => _i41.UpdateUserUseCase(gh<_i42.UserRepository>()));
    gh.lazySingleton<_i43.AppBloc>(() => _i43.AppBloc(
          gh<_i6.GetCurrentUserUseCase>(),
          gh<_i6.GetEntitiesUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i44.RegisterModule {}
