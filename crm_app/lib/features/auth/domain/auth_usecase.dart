import 'package:crm_app/core/errors/failures.dart';
import 'package:crm_app/core/usecase/usecase.dart';
import 'package:crm_app/features/auth/domain/auth_repositary.dart';
import 'package:crm_app/features/auth/domain/user_entity.dart';
import 'package:fpdart/src/either.dart';

class SignInUsecase implements Usecase<UserEntity , SignInParams>{
  final AuthRepositary repositary;

  SignInUsecase(this.repositary);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
    return repositary.signIn(params.email, params.password);
  }

}

class SignInParams{
  final String email;
  final String password;
  
  SignInParams(this.email  , this.password);
}