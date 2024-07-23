import 'package:desoto_web/application/bloc/profile_bloc.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_internal_variable_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:desoto_web/presentation/task_generator/mobile/task_screen_mobile.dart';
import 'package:desoto_web/presentation/task_generator/task_generator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProgressMobileScreen extends StatefulWidget {
  const ProgressMobileScreen({super.key});

  @override
  State<ProgressMobileScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressMobileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(
        ProfileEvent.getProfile(id: FirebaseAuth.instance.currentUser!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskHeaderMobile(
        isProgress: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: Center(
                        child: Text('Описание', style: AppStyles.s18w700))),
                Flexible(
                    child: Center(
                        child: Text('Статус', style: AppStyles.s18w700))),
              ],
            ),
          ),
          const Divider(),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.map(
                  initial: (_) => const SizedBox(),
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  success: (e) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: e.userModel?.savedTasks?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        int? id = e.userModel?.savedTasks?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Center(
                                  child: Text(
                                    AppExamples.taskList[id!].topicTitle,
                                    style: AppStyles.s16w700,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: MaterialButton(
                                  visualDensity: VisualDensity.comfortable,
                                  onPressed: () {
                                    queryNumber = id;
                                    context.go(
                                      '/auth/taskgenerator',
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(16),
                                  color: AppColors.primary,
                                  child: Text('Приступить',
                                      style: AppStyles.s16w400
                                          .copyWith(color: AppColors.white)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  failure: (value) => const SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
