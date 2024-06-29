// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:desoto_web/application/auth/auth_bloc.dart' as _i9;
import 'package:desoto_web/application/auth/sign_in_buttons/sign_in_buttons_bloc.dart'
    as _i8;
import 'package:desoto_web/infrastructure/auth/firebase_auth_facade.dart'
    as _i7;
import 'package:desoto_web/infrastructure/core/firebase_injectable_module.dart'
    as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
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
    gh.lazySingleton<_i4.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i5.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i7.FirebaseAuthFacade>(() => _i7.FirebaseAuthFacade(
          gh<_i5.FirebaseAuth>(),
          gh<_i4.GoogleSignIn>(),
        ));
    gh.factory<_i8.SignInButtonsBloc>(
        () => _i8.SignInButtonsBloc(gh<_i7.FirebaseAuthFacade>()));
    gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(gh<_i7.FirebaseAuthFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i10.FirebaseInjectableModule {}
