
class AuthenticationModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String userType;
  final String createAt;

  const AuthenticationModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.createAt,
  });

factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userType: json['user_type'] as String,
      createAt: json['create_at'] as String,
    );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'user_type': userType,
    'create_at': createAt,
  };

}
