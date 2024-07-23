import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:desoto_web/application/auth/sign_in_buttons/sign_in_buttons_bloc.dart';
import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/infrastructure/payment/one_vision_service.dart';
import 'package:desoto_web/presentation/common_widgets/styles.dart';
import 'package:desoto_web/presentation/common_widgets/text_form_field_visible_password.dart';
import 'package:desoto_web/presentation/desktop/widgets/footer_desktop_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

enum ButtonPressed { google }

class MobRegistrationPage extends StatefulWidget {
  const MobRegistrationPage({super.key});

  @override
  State<MobRegistrationPage> createState() => _MobRegistrationPageState();
}

class _MobRegistrationPageState extends State<MobRegistrationPage> {
  ButtonPressed? _buttonPressed;
  String? email;
  String? name;
  String? password;
  String? passwordConfirm;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('DESOTO', style: AppStyles.s40w700),
                const SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onSaved: (value) => name = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Заполните поле' : null,
                    decoration: FormStyle.inputDecoration(hintText: 'Имя'
                        // enable: _certificateString != null,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onSaved: (value) => email = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Заполните поле';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Неверный формат';
                      }
                      return null;
                    },
                    decoration: FormStyle.inputDecoration(hintText: 'E-mail'
                        // enable: _certificateString != null,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
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
                SizedBox(
                  width: 300,
                  child: TextFormFieldVisiblePassword(
                    onSaved: (value) => passwordConfirm = value,
                    autofocus: false,
                    style: FormStyle.textStyle,
                    label: "Повторите пароль",
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
                        (_) {
                          //check with button was pressed and trigger success animation

                          //move to main page after 1 second delay
                          Future.delayed(const Duration(microseconds: 500),
                              () async {
                            final result =
                                await OneVisionPayService().makePayment(
                              email: FirebaseAuth.instance.currentUser!.email!,
                            );

                            result.fold(
                                (l) => FlushbarHelper.createError(message: l)
                                    .show(context), (r) {
                              html.window.open(r, 'new tab');
                            });
                            // context.go('/taskgenerator');
                          });
                        },
                      ),
                    );
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        MaterialButton(
                            minWidth: 300,
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
                                    SignInButtonsEvent.signUpWithEmail(
                                        name: name!,
                                        email: email!,
                                        password: password!));
                                log(FirebaseAuth.instance.currentUser!.uid);
                              }
                            },
                            child: state.isSubmitting
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: AppColors.white))
                                : Text('Зарегистрироваться',
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
                              log(FirebaseAuth.instance.currentUser!.uid);
                            },
                            icon: Image.asset(AppAssets.images.googleIos,
                                height: 48)),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Назад к входу',
                                  style: AppStyles.s16w500),
                              const SizedBox(width: 20),
                              TextButton(
                                  onPressed: () {
                                    context.go('/auth');
                                  },
                                  child: Text('Вход',
                                      style: AppStyles.s16w500
                                          .copyWith(color: AppColors.green)))
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 400,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    'Нажимая кнопку зарегистрироваться, вы подтверждаете что ознакомились с ',
                                style: AppStyles.s12w400.copyWith(height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'публичной офертой',
                                    style: AppStyles.s12w400.copyWith(
                                        color: Colors.blue, height: 1.5),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        html.window.open(oferta, 'new tab');
                                      },
                                  ),
                                  const TextSpan(
                                      text: ' и ', style: AppStyles.s12w400),
                                  TextSpan(
                                    text: 'политикой конфиденциальности',
                                    style: AppStyles.s12w400.copyWith(
                                        color: Colors.blue, height: 1.5),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        html.window
                                            .open(politikaConf, 'new tab');
                                      },
                                  ),
                                ]),
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
      ),
    );
  }
}
