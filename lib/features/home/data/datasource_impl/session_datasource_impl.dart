import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/session/session.dart';
import 'package:jmap_dart_client/jmap/core/user_name.dart';
import 'package:tmail_ui_user/features/home/data/datasource/session_datasource.dart';
import 'package:tmail_ui_user/features/home/data/network/session_api.dart';
import 'package:tmail_ui_user/main/exceptions/exception_thrower.dart';

class SessionDataSourceImpl extends SessionDataSource {

  final SessionAPI _sessionAPI;
  final ExceptionThrower _exceptionThrower;

  SessionDataSourceImpl(this._sessionAPI, this._exceptionThrower);

  @override
  Future<Session> getSession() {
    return Future.sync(() async {
      return await _sessionAPI.getSession();
    }).catchError(_exceptionThrower.throwException);
  }

  @override
  Future<void> storeSession(Session session, AccountId accountId, UserName userName) {
    throw UnimplementedError();
  }

  @override
  Future<Session> getStoredSession(AccountId accountId, UserName userName) {
    throw UnimplementedError();
  }
}