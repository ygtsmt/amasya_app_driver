// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

  
import 'package:amasyaappdriver/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart'
    as _i27;
import 'package:amasyaappdriver/app/features/dashboard/features/duyuru_list/data/duyuru_usecase.dart'
    as _i18;
import 'package:amasyaappdriver/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart'
    as _i28;
import 'package:amasyaappdriver/app/features/dashboard/features/haber_list/data/haberler_usecase.dart'
    as _i19;
import 'package:amasyaappdriver/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_bloc.dart'
    as _i21;
import 'package:amasyaappdriver/app/features/dashboard/features/hal_fiyatlari_list/data/hal_fiyatlari_usecase.dart'
    as _i20;
import 'package:amasyaappdriver/core/core.dart' as _i16;
import 'package:amasyaappdriver/core/data_sources/local_data_source/secure_data_storage.dart'
    as _i10;
import 'package:amasyaappdriver/core/injection/modules/dio_module.dart' as _i30;
import 'package:amasyaappdriver/core/injection/modules/image_picker_module.dart'
    as _i32;
import 'package:amasyaappdriver/core/injection/modules/secure_storage_module.dart'
    as _i31;
import 'package:amasyaappdriver/core/routes/app_router.dart' as _i4;
import 'package:amasyaappdriver/core/services/account_permission_service.dart' as _i3;
import 'package:amasyaappdriver/core/services/bottom_sheet_service.dart' as _i5;
import 'package:amasyaappdriver/core/services/image_picker_service.dart' as _i9;
import 'package:amasyaappdriver/core/services/snackbar_service.dart' as _i11;
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final imagePickerModule = _$ImagePickerModule();
    gh.factory<_i3.AccountPermissionService>(
        () => _i3.AccountPermissionService());
    gh.factory<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i4.AuctionGuard>(() => _i4.AuctionGuard());
    gh.lazySingleton<_i5.BottomSheetService>(() => _i5.BottomSheetService());
    gh.singleton<_i6.Dio>(dioModule.dio());
    gh.singleton<_i7.FlutterSecureStorage>(secureStorageModule.storage());
    gh.factory<_i8.ImagePicker>(() => imagePickerModule.imagePicker());
    gh.factory<_i9.ImagePickerService>(
        () => _i9.ImagePickerService(gh<_i8.ImagePicker>()));
    gh.singleton<_i10.SecureDataStorage>(
        _i10.SecureDataStorage(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i11.SnackBarService>(() => _i11.SnackBarService());

   

    
    gh.factory<_i18.DuyuruListUseCase>(
        () => _i18.DuyuruListUseCase(gh<_i16.SnackBarService>()));
    gh.factory<_i19.HaberListUseCase>(
        () => _i19.HaberListUseCase(gh<_i16.SnackBarService>()));
    gh.factory<_i20.HalFIyatlariListUseCase>(
        () => _i20.HalFIyatlariListUseCase(gh<_i16.SnackBarService>()));
    gh.singleton<_i21.HalFiyatlariListBloc>(
        _i21.HalFiyatlariListBloc(gh<_i20.HalFIyatlariListUseCase>()));
   
    gh.singleton<_i27.DuyuruListBloc>(
        _i27.DuyuruListBloc(gh<_i18.DuyuruListUseCase>()));
    gh.singleton<_i28.HaberListBloc>(
        _i28.HaberListBloc(gh<_i19.HaberListUseCase>()));

    return this;
  }
}

class _$DioModule extends _i30.DioModule {}

class _$SecureStorageModule extends _i31.SecureStorageModule {}

class _$ImagePickerModule extends _i32.ImagePickerModule {}
