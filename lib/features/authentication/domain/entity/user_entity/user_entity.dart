import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/enums/enums.dart';

class UserEntity extends Equatable {
  final int? userId;
  final String? userName;
  final UserProffession? proffession;
  final String? phoneNumber;
  final String? userEmail;
  final String? userPassword;
  const UserEntity({
     this.userId,
     this.userName,
     this.proffession,
     this.phoneNumber,
     this.userEmail,
     this.userPassword,
  });

  

  @override
  List<Object?> get props {
    return [
      userId,
      userName,
      phoneNumber,
      proffession,
      userEmail,
      userPassword,
    ];
  }
}