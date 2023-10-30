// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../../../lib.dart' as _i4;
import '../../application/use_cases/authentication_use_case.dart' as _i21;
import '../../application/use_cases/redirection_use_case.dart' as _i9;
import '../../application/use_cases/section_use_case.dart' as _i11;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i15;
import '../cache/cache_service.dart' as _i19;
import '../http/banner/custom_banner_service.dart' as _i5;
import '../http/cache/cache_token_repository.dart' as _i18;
import '../http/cache/cache_validador_service.dart' as _i14;
import '../http/dio/dio_client.dart' as _i7;
import '../http/dio/exceptions.dart' as _i6;
import '../http/dio/interceptors.dart' as _i16;
import '../repositories/http_section_repository.dart' as _i10;
import '../repositories/http_subsection_repository.dart' as _i12;
import '../services/http_authentication_service.dart' as _i20;
import '../services/url_launcher_redirection_service.dart' as _i8;
import '../services/url_launcher_section_dashboard_service.dart' as _i22;
import '../url_launcher/url_launcher.dart' as _i13;
import 'dependencies.dart' as _i23;

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
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
    gh.factory<_i4.IBannerService>(() => _i5.CustomBannerService());
    gh.factory<_i4.IHandlerExceptionService>(() => _i6.DioHandlerExcepton());
    gh.factory<_i4.IHttpClient>(() => _i7.DioHttpClient(gh<_i3.Dio>()));
    gh.factory<_i4.IRedirectionService>(
        () => _i8.UrlLauncherRedirectionService());
    gh.factory<_i4.IRedirectionUseCase>(
        () => _i9.RedirectionUseCase(gh<_i4.IRedirectionService>()));
    gh.factory<_i4.ISectionDataRepository>(
        () => _i10.HttpSectionRespository(gh<_i4.IHttpClient>()));
    gh.factory<_i4.IStoreSectionUseCase>(
        () => _i11.StoreSectionUseCase(gh<_i4.ISectionDataRepository>()));
    gh.factory<_i4.ISubSectionsDataRepository>(
        () => _i12.HttpSubSectionRepository(gh<_i4.IHttpClient>()));
    gh.factory<_i4.IUpdateSectionUseCase>(
        () => _i11.UpdateSectionUseCase(gh<_i4.ISectionDataRepository>()));
    gh.factory<_i4.IUpdateSubSectionUseCase>(() =>
        _i11.UpdateSubSectionUseCase(gh<_i4.ISubSectionsDataRepository>()));
    gh.factory<_i4.IUrlLauncher>(() => _i13.UrlLauncherImpl());
    gh.singleton<_i4.IValidatorService>(_i14.CacheValidatorService());
    gh.factory<List<_i3.Interceptor>>(() => dioModule.interceptors);
    gh.factory<_i15.LoginCtrl>(() => _i15.LoginCtrl());
    gh.factory<_i16.NotificationInterceptor>(
        () => _i16.NotificationInterceptor());
    await gh.factoryAsync<_i17.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i16.TokenInterceptor>(() => _i16.TokenInterceptor());
    gh.factory<_i4.TokenRepository>(() => _i18.CacheTokenRepository());
    gh.factory<_i16.ValidatorInterceptor>(() => _i16.ValidatorInterceptor());
    gh.lazySingleton<_i19.CacheService>(
        () => _i19.CacheServiceImpl(gh<_i17.SharedPreferences>()));
    gh.factory<_i4.IAuthenticationService>(
        () => _i20.HttpAuthenticationService(gh<_i4.IHttpClient>()));
    gh.factory<_i4.IConsultSectionsUseCase>(
        () => _i11.ConsultSectionUseCase(gh<_i4.ISectionDataRepository>()));
    gh.factory<_i4.IConsultSubSectionsUseCase>(() =>
        _i11.ConsultExtendedSectionUseCase(
            gh<_i4.ISubSectionsDataRepository>()));
    gh.factory<_i4.IDeleteSectionUseCase>(
        () => _i11.DeleteSectionUseCase(gh<_i4.ISectionDataRepository>()));
    gh.factory<_i4.IDeleteSubSectionUseCase>(() =>
        _i11.DeleteSubSectionUseCase(gh<_i4.ISubSectionsDataRepository>()));
    gh.factory<_i4.IGetUserUseCase>(
        () => _i21.GetUserUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.ILoginUseCase>(
        () => _i21.LoginUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.ILogoutUseCase>(
        () => _i21.LogoutUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IRefreshTokenUseCase>(
        () => _i21.RefreshTokenUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IRegisterUseCase>(
        () => _i21.RegisterUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.ISectionDashboardService>(
        () => _i22.UrlLauncherSectionDashboardService(gh<_i4.IUrlLauncher>()));
    gh.factory<_i4.IStoreSubSectionUseCase>(() =>
        _i11.StoreSubSectionUseCase(gh<_i4.ISubSectionsDataRepository>()));
    gh.factory<_i4.INavigateToDashboardUseCase>(() =>
        _i11.NavigateToDashboardUseCase(gh<_i4.ISectionDashboardService>()));
    return this;
  }
}

class _$DioModule extends _i23.DioModule {}

class _$SharedPreferencesModule extends _i23.SharedPreferencesModule {}
