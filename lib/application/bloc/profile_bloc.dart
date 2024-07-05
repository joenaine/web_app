import 'package:bloc/bloc.dart';
import 'package:desoto_web/domain/profile/user_model.dart';
import 'package:desoto_web/infrastructure/profile/profile_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc(this._profileRepository) : super(const _Initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        getProfile: (e) async {
          emit(const ProfileState.loading());

          UserModel? user = await _profileRepository.getProfile(id: e.id);

          if (user != null) {
            emit(ProfileState.success(userModel: user));
          } else {
            emit(const ProfileState.failure());
          }
        },
      );
    });
  }
}
