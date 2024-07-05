// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:desoto_web/application/auth/auth_bloc.dart' as _i13;
import 'package:desoto_web/application/auth/sign_in_buttons/sign_in_buttons_bloc.dart'
    as _i12;
import 'package:desoto_web/application/bloc/profile_bloc.dart' as _i10;
import 'package:desoto_web/core/helpers/dio_helper.dart' as _i4;
import 'package:desoto_web/infrastructure/auth/firebase_auth_facade.dart'
    as _i11;
import 'package:desoto_web/infrastructure/core/firebase_injectable_module.dart'
    as _i14;
import 'package:desoto_web/infrastructure/profile/profile_repository.dart'
    as _i9;
import 'package:desoto_web/infrastructure/registration/registration_repository.dart'
    as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => firebaseInjectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.DioHelper>(() => _i4.DioHelper());
    gh.lazySingleton<_i5.RegistrationRepository>(
        () => _i5.RegistrationRepository());
    gh.lazySingleton<_i6.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i7.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i8.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i9.ProfileRepository>(() => _i9.ProfileRepository());
    gh.factory<_i10.ProfileBloc>(
        () => _i10.ProfileBloc(gh<_i9.ProfileRepository>()));
    gh.lazySingleton<_i11.FirebaseAuthFacade>(() => _i11.FirebaseAuthFacade(
          gh<_i7.FirebaseAuth>(),
          gh<_i6.GoogleSignIn>(),
        ));
    gh.factory<_i12.SignInButtonsBloc>(() => _i12.SignInButtonsBloc(
          gh<_i11.FirebaseAuthFacade>(),
          gh<_i5.RegistrationRepository>(),
        ));
    gh.factory<_i13.AuthBloc>(
        () => _i13.AuthBloc(gh<_i11.FirebaseAuthFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
