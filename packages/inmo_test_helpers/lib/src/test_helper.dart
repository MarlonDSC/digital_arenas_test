import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<GoogleSignIn>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInAuthentication>(),
  MockSpec<TimerBloc>(),
  MockSpec<GoRouter>(),
])
void main() {}
