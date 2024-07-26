import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:desoto_web/application/auth/sign_in_buttons/sign_in_buttons_bloc.dart';
import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/infrastructure/payment/one_vision_service.dart';
import 'package:desoto_web/infrastructure/profile/profile_repository.dart';
import 'package:desoto_web/injection.dart';
import 'package:desoto_web/presentation/common_widgets/styles.dart';
import 'package:desoto_web/presentation/common_widgets/text_form_field_visible_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

enum ButtonPressed { google }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  ButtonPressed? _buttonPressed;
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('DESOTO', style: AppStyles.s40w700),
              const SizedBox(height: 40),
              SizedBox(
                width: 400,
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Заполните поле' : null,
                  onSaved: (value) => email = value,
                  decoration: FormStyle.inputDecoration(hintText: 'E-mail'
                      // enable: _certificateString != null,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: TextFormFieldVisiblePassword(
                  onSaved: (value) => password = value,
                  autofocus: false,
                  style: FormStyle.textStyle,
                  label: "Пароль",
                  decoration: FormStyle.inputDecoration(
                      // enable: _certificateString != null,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              BlocConsumer<SignInButtonsBloc, SignInButtonsState>(
                listener: (context, state) {
                  log(_buttonPressed.toString());
                  state.authFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        FlushbarHelper.createError(
                          message: failure,
                        ).show(context);
                      },
                      (_) async {
                        final userRepo = ProfileRepository();

                        final usr = await userRepo.getProfile(
                            id: FirebaseAuth.instance.currentUser!.uid);
                        //check with button was pressed and trigger success animation

                        //move to main page after 1 second delay
                        Future.delayed(const Duration(microseconds: 500),
                            () async {
                          log('IsUSERPAYED: $usr');
                          log('user uuid: ${FirebaseAuth.instance.currentUser!.uid}');

                          if (usr?.isPayed ?? false) {
                            context.go('/auth/taskgenerator');
                          } else {
                            final result =
                                await OneVisionPayService().makePayment(
                              email: FirebaseAuth.instance.currentUser!.email!,
                            );

                            result.fold(
                                (l) => FlushbarHelper.createError(message: l)
                                    .show(context), (r) {
                              html.window.open(r, 'new tab');
                            });
                          }

                          // context.go('/auth/taskgenerator');
                        });
                      },
                    ),
                  );
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      MaterialButton(
                          minWidth: 400,
                          padding: const EdgeInsets.all(16),
                          color: AppColors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              log('$email : $password');
                              // UserCredential userCredential = await authInstance
                              //     .createUserWithEmailAndPassword(
                              //         email: email!, password: password!);
                              context.read<SignInButtonsBloc>().add(
                                  SignInButtonsEvent.signInWithEmail(
                                      email: email!, password: password!));
                              log(FirebaseAuth.instance.currentUser!.uid);
                            }
                          },
                          child: state.isSubmitting
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: AppColors.white))
                              : Text('Вход',
                                  style: AppStyles.s18w500
                                      .copyWith(color: AppColors.white))),
                      const SizedBox(height: 20),
                      const Text('Или зарегиструйтесь через',
                          style: AppStyles.s16w500),
                      const SizedBox(height: 20),
                      IconButton(
                          onPressed: () {
                            context.read<SignInButtonsBloc>().add(
                                const SignInButtonsEvent
                                    .signInWithGooglePressed());
                          },
                          icon: Image.asset(AppAssets.images.googleIos,
                              height: 48)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Новый пользователь?',
                                style: AppStyles.s16w500),
                            const SizedBox(width: 20),
                            TextButton(
                                onPressed: () {
                                  context.go('/registration');
                                },
                                child: Text('Регистрация',
                                    style: AppStyles.s16w500
                                        .copyWith(color: AppColors.green)))
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
