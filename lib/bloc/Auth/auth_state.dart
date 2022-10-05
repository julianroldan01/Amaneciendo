part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable{}
class Loading extends AuthState {
// final Map<String,dynamic> decodeResp = json.decode() ;
// if (decodeResp.containsKey('tokenFirebase')){
//   return null;
// }else {
//   return decodeResp['error']['message'];
// }
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}


//   final bool existUser;
//   final FirebaseAuth? user;

//   const UserState({
//     this.existUser = false, 
//     this.user});
// }

// class UserInitialState extends UserState {
//   const UserInitialState(): super (existUser: true, user: null);
// } 

// class UserSetState extends UserState {
//   final FirebaseAuth newUser;
//   const UserSetState(this.newUser)
//   :super(existUser: true, user: newUser);
// }  
