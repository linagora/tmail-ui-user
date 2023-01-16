// Mocks generated by Mockito 5.2.0 from annotations
// in tmail_ui_user/test/features/thread/domain/usecases/get_emails_in_mailbox_interactor_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:jmap_dart_client/jmap/account_id.dart' as _i6;
import 'package:jmap_dart_client/jmap/core/filter/filter.dart' as _i14;
import 'package:jmap_dart_client/jmap/core/properties/properties.dart' as _i10;
import 'package:jmap_dart_client/jmap/core/sort/comparator.dart' as _i8;
import 'package:jmap_dart_client/jmap/core/state.dart' as _i11;
import 'package:jmap_dart_client/jmap/core/unsigned_int.dart' as _i7;
import 'package:jmap_dart_client/jmap/mail/email/email.dart' as _i13;
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart' as _i15;
import 'package:mockito/mockito.dart' as _i1;
import 'package:model/email/presentation_email.dart' as _i2;
import 'package:tmail_ui_user/features/thread/domain/model/email_filter.dart'
    as _i9;
import 'package:tmail_ui_user/features/thread/domain/model/email_response.dart'
    as _i5;
import 'package:tmail_ui_user/features/thread/domain/model/get_email_request.dart'
    as _i12;
import 'package:tmail_ui_user/features/thread/domain/repository/thread_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePresentationEmail_0 extends _i1.Fake
    implements _i2.PresentationEmail {}

/// A class which mocks [ThreadRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockThreadRepository extends _i1.Mock implements _i3.ThreadRepository {
  MockThreadRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.EmailsResponse> getAllEmail(
    _i6.AccountId? accountId, {
    _i7.UnsignedInt? limit,
    Set<_i8.Comparator>? sort,
    _i9.EmailFilter? emailFilter,
    _i10.Properties? propertiesCreated,
    _i10.Properties? propertiesUpdated,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllEmail,
          [accountId],
          {
            #limit: limit,
            #sort: sort,
            #emailFilter: emailFilter,
            #propertiesCreated: propertiesCreated,
            #propertiesUpdated: propertiesUpdated,
          },
        ),
        returnValue: Stream<_i5.EmailsResponse>.empty(),
      ) as _i4.Stream<_i5.EmailsResponse>);
  @override
  _i4.Stream<_i5.EmailsResponse> refreshChanges(
    _i6.AccountId? accountId,
    _i11.State? currentState, {
    Set<_i8.Comparator>? sort,
    _i9.EmailFilter? emailFilter,
    _i10.Properties? propertiesCreated,
    _i10.Properties? propertiesUpdated,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #refreshChanges,
          [
            accountId,
            currentState,
          ],
          {
            #sort: sort,
            #emailFilter: emailFilter,
            #propertiesCreated: propertiesCreated,
            #propertiesUpdated: propertiesUpdated,
          },
        ),
        returnValue: Stream<_i5.EmailsResponse>.empty(),
      ) as _i4.Stream<_i5.EmailsResponse>);
  @override
  _i4.Stream<_i5.EmailsResponse> loadMoreEmails(
          _i12.GetEmailRequest? emailRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadMoreEmails,
          [emailRequest],
        ),
        returnValue: Stream<_i5.EmailsResponse>.empty(),
      ) as _i4.Stream<_i5.EmailsResponse>);
  @override
  _i4.Future<List<_i13.Email>> searchEmails(
    _i6.AccountId? accountId, {
    _i7.UnsignedInt? limit,
    Set<_i8.Comparator>? sort,
    _i14.Filter? filter,
    _i10.Properties? properties,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchEmails,
          [accountId],
          {
            #limit: limit,
            #sort: sort,
            #filter: filter,
            #properties: properties,
          },
        ),
        returnValue: Future<List<_i13.Email>>.value(<_i13.Email>[]),
      ) as _i4.Future<List<_i13.Email>>);
  @override
  _i4.Future<List<_i13.EmailId>> emptyTrashFolder(
    _i6.AccountId? accountId,
    _i15.MailboxId? trashMailboxId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #emptyTrashFolder,
          [
            accountId,
            trashMailboxId,
          ],
        ),
        returnValue: Future<List<_i13.EmailId>>.value(<_i13.EmailId>[]),
      ) as _i4.Future<List<_i13.EmailId>>);
  @override
  _i4.Future<_i2.PresentationEmail> getEmailById(
    _i6.AccountId? accountId,
    _i13.EmailId? emailId, {
    _i10.Properties? properties,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEmailById,
          [
            accountId,
            emailId,
          ],
          {#properties: properties},
        ),
        returnValue:
            Future<_i2.PresentationEmail>.value(_FakePresentationEmail_0()),
      ) as _i4.Future<_i2.PresentationEmail>);
}
