import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/identities/identity.dart';
import 'package:tmail_ui_user/features/manage_account/data/datasource/manage_account_datasource.dart';
import 'package:tmail_ui_user/features/manage_account/domain/model/create_new_identity_request.dart';
import 'package:tmail_ui_user/features/manage_account/domain/model/edit_identity_request.dart';
import 'package:tmail_ui_user/features/manage_account/domain/model/identities_response.dart';
import 'package:tmail_ui_user/features/manage_account/domain/repository/manage_account_repository.dart';

class ManageAccountRepositoryImpl extends ManageAccountRepository {

  final ManageAccountDataSource dataSource;

  ManageAccountRepositoryImpl(this.dataSource);

  @override
  Future<IdentitiesResponse> getAllIdentities(AccountId accountId) {
    return dataSource.getAllIdentities(accountId);
  }

  @override
  Future<Identity> createNewIdentity(AccountId accountId, CreateNewIdentityRequest identityRequest) {
    return dataSource.createNewIdentity(accountId, identityRequest);
  }

  @override
  Future<bool> deleteIdentity(AccountId accountId, IdentityId identityId) {
    return dataSource.deleteIdentity(accountId, identityId);
  }

  @override
  Future<Identity> editIdentity(AccountId accountId, EditIdentityRequest identityRequest) {
    return dataSource.editIdentity(accountId, identityRequest);
  }
}