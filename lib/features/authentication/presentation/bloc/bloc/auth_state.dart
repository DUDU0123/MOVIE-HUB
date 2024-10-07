part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final bool isLoading;
  final UserProffession? selectedProffession;
  const AuthState({
    this.isLoading = false,
    this.selectedProffession = UserProffession.developer,
  });

  AuthState copyWith({
    bool? isLoading,
    UserProffession? selectedProffession,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      selectedProffession: selectedProffession ?? this.selectedProffession,
    );
  }

  @override
  List<Object> get props => [isLoading,selectedProffession??UserProffession.developer, ];
}

class AuthInitial extends AuthState {
  final bool? isLoggedIn;
  const AuthInitial({
     this.isLoggedIn= false,
  });
  @override
  List<Object> get props => [isLoggedIn??false];
}
class AuthSuccessState extends AuthState{

}
class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message,];
}
