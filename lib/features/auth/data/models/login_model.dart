import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginParmas extends Equatable {
  final String username;
  final String password;

  const LoginParmas({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
