import 'package:hive_flutter/adapters.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/features/authentication/domain/entity/user_entity/user_entity.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @HiveField(0)
  final int? userid;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? userProffession;
  @HiveField(3)
  final String? userPhoneNumber;
  @HiveField(4)
  final String? useremail;
  @HiveField(5)
  final String? userpassword;
   UserModel({
    this.userid,
    this.username,
    this.userProffession,
    this.userPhoneNumber,
    this.useremail,
    this.userpassword,
  }) : super(
          phoneNumber: userPhoneNumber,
          proffession:UserProffession.values.byName(userProffession ?? 'none'),
          userEmail: useremail,
          userId: userid,
          userPassword: userpassword,
          userName: username,
        );

  UserModel copyWith({
    int? userid,
    String? username,
    String? userProffession,
    String? userPhoneNumber,
    String? useremail,
    String? userpassword,
  }) {
    return UserModel(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      userProffession: userProffession ?? this.userProffession,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      useremail: useremail ?? this.useremail,
      userpassword: userpassword ?? this.userpassword,
    );
  }
}
