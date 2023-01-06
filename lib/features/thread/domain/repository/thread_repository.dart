import 'dart:async';

import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/filter/filter.dart';
import 'package:jmap_dart_client/jmap/core/properties/properties.dart';
import 'package:jmap_dart_client/jmap/core/sort/comparator.dart';
import 'package:jmap_dart_client/jmap/core/state.dart' as jmap;
import 'package:jmap_dart_client/jmap/core/unsigned_int.dart';
import 'package:jmap_dart_client/jmap/mail/email/email.dart';
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart';
import 'package:model/email/presentation_email.dart';
import 'package:tmail_ui_user/features/thread/domain/model/email_filter.dart';
import 'package:tmail_ui_user/features/thread/domain/model/email_response.dart';
import 'package:tmail_ui_user/features/thread/domain/model/get_email_request.dart';

abstract class ThreadRepository {
  Stream<EmailsResponse> getAllEmail(
    AccountId accountId,
    {
      UnsignedInt? limit,
      Set<Comparator>? sort,
      EmailFilter? emailFilter,
      Properties? propertiesCreated,
      Properties? propertiesUpdated,
    }
  );

  Stream<EmailsResponse> refreshChanges(
    AccountId accountId,
    jmap.State currentState,
    {
      Set<Comparator>? sort,
      EmailFilter? emailFilter,
      Properties? propertiesCreated,
      Properties? propertiesUpdated,
    }
  );

  Stream<EmailsResponse> loadMoreEmails(GetEmailRequest emailRequest);

  Future<List<Email>> searchEmails(
    AccountId accountId,
    {
      UnsignedInt? limit,
      Set<Comparator>? sort,
      Filter? filter,
      Properties? properties,
    }
  );

  Future<List<EmailId>> emptyTrashFolder(
      AccountId accountId,
      MailboxId trashMailboxId,
  );

  Future<PresentationEmail> getEmailById(AccountId accountId, EmailId emailId, {Properties? properties});
}