sealed class AuthenticationStates{}
final class AuthenticationInitialState extends AuthenticationStates{}
final class AuthenticationLoadingState extends AuthenticationStates{}
final class AuthenticationErrorState extends AuthenticationStates{
  final String errorMessage;
  AuthenticationErrorState(this.errorMessage);
}
final class AuthenticationSuccessState extends AuthenticationStates{}
final class SuffixIconChangeState extends AuthenticationStates{}
final class SmallCharacterState extends AuthenticationStates{}
final class PagCharacterState extends AuthenticationStates{}
final class NumberSuccessState extends AuthenticationStates{}
final class SpecialCharacterState extends AuthenticationStates{}
final class YoungerThan8CharacterState extends AuthenticationStates{}