import 'package:core/presentation/state/failure.dart';
import 'package:core/presentation/state/success.dart';
import 'package:jmap_dart_client/jmap/core/state.dart' as jmap;
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart';
import 'package:tmail_ui_user/features/base/state/ui_action_state.dart';

class MarkAllAsUnreadSelectionAllEmailsLoading extends LoadingState {}

class MarkAllAsUnreadSelectionAllEmailsUpdating extends UIState {

  final MailboxId mailboxId;
  final int totalRead;
  final int countUnread;

  MarkAllAsUnreadSelectionAllEmailsUpdating({
    required this.mailboxId,
    required this.totalRead,
    required this.countUnread
  });

  @override
  List<Object?> get props => [mailboxId, totalRead, countUnread];
}

class MarkAllAsUnreadSelectionAllEmailsAllSuccess extends UIActionState {

  final String mailboxDisplayName;

  MarkAllAsUnreadSelectionAllEmailsAllSuccess(this.mailboxDisplayName,
    {
      jmap.State? currentEmailState,
      jmap.State? currentMailboxState,
    }
  ) : super(currentMailboxState, currentEmailState);

  @override
  List<Object?> get props => [
    mailboxDisplayName,
    ...super.props
  ];
}

class MarkAllAsUnreadSelectionAllEmailsHasSomeEmailFailure extends UIActionState {

  final String mailboxDisplayName;
  final int countEmailsUnread;

  MarkAllAsUnreadSelectionAllEmailsHasSomeEmailFailure(
    this.mailboxDisplayName,
    this.countEmailsUnread,
    {
      jmap.State? currentEmailState,
      jmap.State? currentMailboxState,
    }
  ) : super(currentMailboxState, currentEmailState);

  @override
  List<Object?> get props => [
    mailboxDisplayName,
    countEmailsUnread,
    ...super.props
  ];
}

class  MarkAllAsUnreadSelectionAllEmailsAllFailure extends FeatureFailure {
  final String mailboxDisplayName;

  MarkAllAsUnreadSelectionAllEmailsAllFailure({required this.mailboxDisplayName});

  @override
  List<Object?> get props => [mailboxDisplayName];
}

class MarkAllAsUnreadSelectionAllEmailsFailure extends FeatureFailure {

  final String mailboxDisplayName;

  MarkAllAsUnreadSelectionAllEmailsFailure({
    required this.mailboxDisplayName,
    dynamic exception
  }) : super(exception: exception);

  @override
  List<Object?> get props => [mailboxDisplayName, ...super.props];
}