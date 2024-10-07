part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class SignUpEvent extends AuthEvent {
  final UserEntity userEntity;
  SignUpEvent({
    required this.userEntity,
  });
  @override
  List<Object?> get props => [userEntity,];
}
class LogInEvent extends AuthEvent{
  final UserEntity userEntity;
  LogInEvent({
    required this.userEntity,
  });
  @override
  List<Object?> get props => [userEntity,];
}
class SelectProffessionEvent extends AuthEvent {
  final UserProffession? selectedProffession;
  SelectProffessionEvent({
    required this.selectedProffession,
  });
  @override
  List<Object?> get props => [selectedProffession];
}
class CheckUserLoggedInEvent extends AuthEvent{}
class LogOutEvent extends AuthEvent{}