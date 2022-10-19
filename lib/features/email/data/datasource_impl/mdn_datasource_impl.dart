import 'dart:async';

import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/mdn/mdn.dart';
import 'package:tmail_ui_user/features/email/data/datasource/mdn_datasource.dart';
import 'package:tmail_ui_user/features/email/data/network/mdn_api.dart';
import 'package:tmail_ui_user/features/email/domain/model/send_receipt_to_sender_request.dart';

class MdnDataSourceImpl extends MdnDataSource {

  final MdnAPI _mdnAPI;

  MdnDataSourceImpl(this._mdnAPI);

  @override
  Future<MDN?> sendReceiptToSender(AccountId accountId, SendReceiptToSenderRequest request) {
    return Future.sync(() async {
      return await _mdnAPI.sendReceiptToSender(accountId, request);
    }).catchError((error) {
      throw error;
    });
  }
}