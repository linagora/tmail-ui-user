import 'dart:async';

import 'package:core/presentation/state/failure.dart';
import 'package:core/presentation/state/success.dart';
import 'package:dartz/dartz.dart';
import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/session/session.dart';
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart';
import 'package:tmail_ui_user/features/email/domain/repository/email_repository.dart';
import 'package:tmail_ui_user/features/mailbox/domain/repository/mailbox_repository.dart';
import 'package:tmail_ui_user/features/thread/domain/repository/thread_repository.dart';
import 'package:tmail_ui_user/features/thread/domain/state/move_all_selection_all_emails_state.dart';

class MoveAllSelectionAllEmailsInteractor {
  final EmailRepository _emailRepository;
  final MailboxRepository _mailboxRepository;
  final ThreadRepository _threadRepository;

  MoveAllSelectionAllEmailsInteractor(
    this._emailRepository,
    this._mailboxRepository,
    this._threadRepository,
  );

  Stream<Either<Failure, Success>> execute(
    Session session,
    AccountId accountId,
    MailboxId currentMailboxId,
    MailboxId destinationMailboxId,
    String destinationPath,
    int totalEmails,
    StreamController<Either<Failure, Success>> onProgressController,
    {
      bool isDestinationSpamMailbox = false
    }
  ) async* {
    try {
      yield Right(MoveAllSelectionAllEmailsLoading());
      onProgressController.add(Right(MoveAllSelectionAllEmailsLoading()));

      final listState = await Future.wait([
        _mailboxRepository.getMailboxState(session, accountId),
        _emailRepository.getEmailState(session, accountId),
      ], eagerError: true);

      final currentMailboxState = listState.first;
      final currentEmailState = listState.last;

      final listEmailId = await _threadRepository.moveAllSelectionAllEmails(
        session,
        accountId,
        currentMailboxId,
        destinationMailboxId,
        totalEmails,
        onProgressController,
        isDestinationSpamMailbox: isDestinationSpamMailbox);

      if (totalEmails == listEmailId.length) {
        yield Right(MoveAllSelectionAllEmailsAllSuccess(
          destinationPath,
          currentEmailState: currentEmailState,
          currentMailboxState: currentMailboxState));
      } else if (listEmailId.isNotEmpty) {
        yield Right(MoveAllSelectionAllEmailsHasSomeEmailFailure(
          destinationPath,
          listEmailId.length,
          currentEmailState: currentEmailState,
          currentMailboxState: currentMailboxState));
      } else {
        yield Left(MoveAllSelectionAllEmailsAllFailure(destinationPath));
      }
    } catch (e) {
      yield Left(MoveAllSelectionAllEmailsFailure(destinationPath: destinationPath, exception: e));
    }
  }
}