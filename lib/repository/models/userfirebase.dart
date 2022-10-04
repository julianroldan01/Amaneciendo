import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String id;

  const User({
    required this.email,
    required this.id,
    
  }) : assert(email != null),
  assert(id != null);

  static const empty = User(email: '', id: '');

  @override
  List<Object> get props => [email, id];
}