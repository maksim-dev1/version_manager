import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:version_manager_flutter/shared/services/api_client_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiClientService _apiClientService;
  AuthBloc({required ApiClientService apiClientService})
    : _apiClientService = apiClientService,
      super(const AuthState.loading()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        _CheckAuthentication() => _checkAuthentication(emit: emit),
        _Logout() => _logout(emit: emit),
      },
    );
  }

  Future<void> _checkAuthentication({required Emitter<AuthState> emit}) async {
    emit(const AuthState.loading());
    try {
      final isAuthenticated = _apiClientService.client.auth.isAuthenticated;
      if (isAuthenticated) {
        emit(const AuthState.authenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
  
  Future<void> _logout({required Emitter<AuthState> emit}) async {
    emit(const AuthState.loading());
    try {
      await _apiClientService.client.auth.signOutDevice();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}
