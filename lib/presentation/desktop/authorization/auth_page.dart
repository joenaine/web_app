import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:desoto_web/application/auth/sign_in_buttons/sign_in_buttons_bloc.dart';
import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/presentation/common_widgets/styles.dart';
import 'package:desoto_web/presentation/common_widgets/text_form_field_visible_password.dart';
import 'package:desoto_web/presentation/google_auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('DESOTO', style: AppStyles.s40w700),
            const SizedBox(height: 40),
            SizedBox(
              width: 400,
              child: TextFormField(
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
                        message: failure.map(
                          cancelledByUser: (_) => 'Cancelled',
                          serverError: (_) => 'Server error, try again later',
                          credentialAlreadyUsed: (_) =>
                              'Credentials already used',
                          networkError: (_) =>
                              'Network error, check your internet connection',
                        ),
                      ).show(context);
                    },
                    (_) {
                      //check with button was pressed and trigger success animation

                      //move to main page after 1 second delay
                      Future.delayed(const Duration(seconds: 1), () {
                        context.go('/tasks');
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
                        onPressed: () {},
                        child: Text('Вход',
                            style: AppStyles.s18w500
                                .copyWith(color: AppColors.white))),
                    const SizedBox(height: 20),
                    const Text('Или зарегестрируйтесь через',
                        style: AppStyles.s14w400),
                    const SizedBox(height: 20),
                    IconButton(
                        onPressed: () {
                          context.read<SignInButtonsBloc>().add(
                              const SignInButtonsEvent
                                  .signInWithGooglePressed());
                          log(FirebaseAuth.instance.currentUser!.uid);
                        },
                        icon:
                            Image.asset(AppAssets.images.googleIos, height: 48))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
