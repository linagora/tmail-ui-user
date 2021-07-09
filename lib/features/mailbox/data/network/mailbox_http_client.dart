// LinShare is an open source filesharing software, part of the LinPKI software
// suite, developed by Linagora.
//
// Copyright (C) 2020 LINAGORA
//
// This program is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later version,
// provided you comply with the Additional Terms applicable for LinShare software by
// Linagora pursuant to Section 7 of the GNU Affero General Public License,
// subsections (b), (c), and (e), pursuant to which you must notably (i) retain the
// display in the interface of the “LinShare™” trademark/logo, the "Libre & Free" mention,
// the words “You are using the Free and Open Source version of LinShare™, powered by
// Linagora © 2009–2020. Contribute to Linshare R&D by subscribing to an Enterprise
// offer!”. You must also retain the latter notice in all asynchronous messages such as
// e-mails sent with the Program, (ii) retain all hypertext links between LinShare and
// http://www.linshare.org, between linagora.com and Linagora, and (iii) refrain from
// infringing Linagora intellectual property rights over its trademarks and commercial
// brands. Other Additional Terms apply, see
// <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf>
// for more details.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
// more details.
// You should have received a copy of the GNU Affero General Public License and its
// applicable Additional Terms for LinShare along with this program. If not, see
// <http://www.gnu.org/licenses/> for the GNU Affero General Public License version
//  3 and <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf> for
//  the Additional Terms applicable to LinShare software.

import 'dart:async';

import 'package:core/core.dart';
import 'package:jmap_dart_client/jmap/core/id.dart' as JMapId;
import 'package:jmap_dart_client/jmap/core/unsigned_int.dart' as JMapUnSignedId;
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart' as JMapMailbox;
import 'package:model/model.dart';

class MailboxHttpClient {

  final DioClient dioClient;

  MailboxHttpClient(this.dioClient);

  Future<List<Mailbox>> getAllMailbox() async {
    return [
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('1')),
        JMapMailbox.MailboxName('Inbox'),
        null,
        MailboxRole.inbox,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt(100)),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
        selectMode: SelectMode.ACTIVE),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('2')),
        JMapMailbox.MailboxName('Drafts'),
        null,
        MailboxRole.draft,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('3')),
        JMapMailbox.MailboxName('Sent'),
        null,
        MailboxRole.sent,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('4')),
        JMapMailbox.MailboxName('All mail'),
        null,
        MailboxRole.allMail,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt(1200)),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('5')),
        JMapMailbox.MailboxName('Trash'),
        null,
        MailboxRole.trash,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('6')),
        JMapMailbox.MailboxName('Spam'),
        null,
        MailboxRole.spam,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('7')),
        JMapMailbox.MailboxName('Templates'),
        null,
        MailboxRole.templates,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('8')),
        JMapMailbox.MailboxName('Folder 1'),
        JMapMailbox.MailboxId(JMapId.Id('1')),
        MailboxRole.none,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('81')),
        JMapMailbox.MailboxName('Sub Folder 1'),
        null,
        MailboxRole.none,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('82')),
        JMapMailbox.MailboxName('Sub Folder 2'),
        null,
        MailboxRole.none,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
      Mailbox(
        JMapMailbox.MailboxId(JMapId.Id('9')),
        JMapMailbox.MailboxName('Folder 2'),
        JMapMailbox.MailboxId(JMapId.Id('2')),
        MailboxRole.none,
        JMapMailbox.SortOrder(),
        JMapMailbox.TotalEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadEmails(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.TotalThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        JMapMailbox.UnreadThreads(JMapUnSignedId.UnsignedInt.defaultValue),
        null,
        JMapMailbox.IsSubscribed(false),
      ),
    ];
  }
}