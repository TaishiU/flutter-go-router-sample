// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  bool get isObscure => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get emailError => throw _privateConstructorUsedError;
  String get passwordError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isObscure,
      String email,
      String password,
      String emailError,
      String passwordError});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isObscure = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_value.copyWith(
      isObscure: isObscure == freezed
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String,
      passwordError: passwordError == freezed
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isObscure,
      String email,
      String password,
      String emailError,
      String passwordError});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, (v) => _then(v as _$_AuthState));

  @override
  _$_AuthState get _value => super._value as _$_AuthState;

  @override
  $Res call({
    Object? isObscure = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_$_AuthState(
      isObscure: isObscure == freezed
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String,
      passwordError: passwordError == freezed
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.isObscure = true,
      this.email = '',
      this.password = '',
      this.emailError = '',
      this.passwordError = ''});

  @override
  @JsonKey()
  final bool isObscure;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String emailError;
  @override
  @JsonKey()
  final String passwordError;

  @override
  String toString() {
    return 'AuthState(isObscure: $isObscure, email: $email, password: $password, emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            const DeepCollectionEquality().equals(other.isObscure, isObscure) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.emailError, emailError) &&
            const DeepCollectionEquality()
                .equals(other.passwordError, passwordError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isObscure),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(emailError),
      const DeepCollectionEquality().hash(passwordError));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final bool isObscure,
      final String email,
      final String password,
      final String emailError,
      final String passwordError}) = _$_AuthState;

  @override
  bool get isObscure => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get emailError => throw _privateConstructorUsedError;
  @override
  String get passwordError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
