import 'dart:math';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jmap_dart_client/jmap/mail/mailbox/mailbox.dart';
import 'package:model/model.dart';
import 'package:tmail_ui_user/features/thread/domain/model/search_query.dart';
import 'package:tmail_ui_user/features/thread/presentation/model/search_status.dart';

typedef OnOpenEmailActionClick = void Function(PresentationEmail selectedEmail);
typedef OnSelectEmailActionClick = void Function(PresentationEmail selectedEmail);
typedef OnMarkAsStarEmailActionClick = void Function(PresentationEmail selectedEmail);

class EmailTileBuilder {

  final SelectMode _selectMode;
  final ImagePaths _imagePaths;
  final PresentationEmail _presentationEmail;
  final BuildContext _context;
  final ResponsiveUtils _responsiveUtils;
  final SelectMode _selectModeAll;
  final Role? _mailboxRole;
  final SearchStatus _searchStatus;
  final SearchQuery? _searchQuery;

  OnOpenEmailActionClick? _onOpenEmailActionClick;
  OnSelectEmailActionClick? _onSelectEmailActionClick;
  OnMarkAsStarEmailActionClick? _onMarkAsStarEmailActionClick;

  EmailTileBuilder(
    this._context,
    this._imagePaths,
    this._selectMode,
    this._presentationEmail,
    this._responsiveUtils,
    this._mailboxRole,
    this._selectModeAll,
    this._searchStatus,
    this._searchQuery,
  );

  void onOpenEmailAction(OnOpenEmailActionClick onOpenEmailActionClick) {
    _onOpenEmailActionClick = onOpenEmailActionClick;
  }

  void onSelectEmailAction(OnSelectEmailActionClick onSelectEmailActionClick) {
    _onSelectEmailActionClick = onSelectEmailActionClick;
  }

  void addOnMarkAsStarEmailActionClick(OnMarkAsStarEmailActionClick onMarkAsStarEmailActionClick) {
    _onMarkAsStarEmailActionClick = onMarkAsStarEmailActionClick;
  }

  Widget build() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent),
      child: Container(
        key: Key('thread_tile'),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: _getBackgroundColorItem()),
        child: MediaQuery(
          data: MediaQueryData(padding: EdgeInsets.zero),
          child: Column(children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => {
                if (_onOpenEmailActionClick != null) {
                  _onOpenEmailActionClick!(_presentationEmail)
                }
              },
              onLongPress: () => {
                if (_onSelectEmailActionClick != null) {
                  _onSelectEmailActionClick!(_presentationEmail)
                }
              },
              leading: Transform(
                  transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                  child: _buildAvatarIcon()),
              title: Transform(
                  transform: Matrix4.translationValues(-8.0, 0.0, 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (_presentationEmail.isUnReadEmail())
                        Padding(
                          padding: EdgeInsets.only(top: 6, right: 5),
                          child: SvgPicture.asset(_imagePaths.icUnread, width: 9, height: 9, fit: BoxFit.fill)),
                      Expanded(
                          child: _searchStatus == SearchStatus.ACTIVE && _searchQuery != null && _searchQuery!.value.isNotEmpty
                              ? RichTextBuilder(
                                  _getInformationSender(),
                                  '${_searchQuery!.value}',
                                  TextStyle(fontSize: 15, color: AppColor.colorNameEmail, fontWeight: FontWeight.w600),
                                  TextStyle(fontSize: 15, color: AppColor.colorNameEmail, backgroundColor: AppColor.bgWordSearch, fontWeight: FontWeight.w600)).build()
                              : Text(
                                  _getInformationSender(),
                                  maxLines: 1,
                                  overflow:TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: AppColor.colorNameEmail, fontWeight: FontWeight.w600))
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Text(
                              '${_presentationEmail.getReceivedAt(Localizations.localeOf(_context).toLanguageTag())}',
                              maxLines: 1,
                              overflow:TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13, color: AppColor.colorContentEmail)))
                    ],
                  )
              ),
              subtitle: Transform(
                  transform: Matrix4.translationValues(-8.0, 8.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.zero,
                          child: Row(
                            children: [
                              Expanded(
                                  child: _searchStatus == SearchStatus.ACTIVE && _searchQuery != null && _searchQuery!.value.isNotEmpty
                                      ? RichTextBuilder(
                                          '${_presentationEmail.getEmailTitle()}',
                                          '${_searchQuery!.value}',
                                          TextStyle(
                                              fontSize: 13,
                                              color: _presentationEmail.isUnReadEmail() ? AppColor.subjectEmailTextColorUnRead : AppColor.colorNameEmail),
                                          TextStyle(
                                              fontSize: 13,
                                              backgroundColor: AppColor.bgWordSearch,
                                              color: _presentationEmail.isUnReadEmail() ? AppColor.subjectEmailTextColorUnRead : AppColor.colorNameEmail)).build()
                                      : Text(
                                          '${_presentationEmail.getEmailTitle()}',
                                          maxLines: 1,
                                          overflow:TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13, color: AppColor.colorNameEmail))
                              ),
                              if (_searchStatus == SearchStatus.ACTIVE && _presentationEmail.mailboxName.isNotEmpty)
                                Container(
                                    margin: EdgeInsets.only(left: 8),
                                    padding: EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
                                    constraints: BoxConstraints(maxWidth: 100),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.backgroundCounterMailboxColor),
                                    child: Text(
                                      '${_presentationEmail.mailboxName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10, color: AppColor.mailboxTextColor, fontWeight: FontWeight.bold),
                                    )
                                )
                            ],
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: _searchStatus == SearchStatus.ACTIVE && _searchQuery != null && _searchQuery!.value.isNotEmpty
                                  ? RichTextBuilder(
                                      '${_presentationEmail.getPartialContent()}',
                                      '${_searchQuery!.value}',
                                      TextStyle(fontSize: 13, color: AppColor.colorContentEmail),
                                      TextStyle(fontSize: 13, color: AppColor.colorContentEmail, backgroundColor: AppColor.bgWordSearch)).build()
                                  : Text(
                                      '${_presentationEmail.getPartialContent()}',
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13, color: AppColor.colorContentEmail))
                          ),
                          if (_presentationEmail.hasAttachment == true)
                            (ButtonBuilder(_imagePaths.icShare)
                              ..padding(5)
                              ..size(20))
                            .build(),
                          (ButtonBuilder(_presentationEmail.isFlaggedEmail() ? _imagePaths.icFlagged : _imagePaths.icFlag)
                            ..padding(5)
                            ..size(20)
                            ..onPressActionClick(() {
                              if (_onMarkAsStarEmailActionClick != null) {
                                _onMarkAsStarEmailActionClick!(_presentationEmail);
                              }
                            }))
                          .build(),
                        ],
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 12),
              child: Divider(color: AppColor.lineItemListColor, height: 1, thickness: 0.2)),
          ]),
        )
      )
    );
  }

  Widget _buildAvatarIcon() {
    if (_selectModeAll == SelectMode.ACTIVE) {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: __transitionBuilder,
        child: _presentationEmail.selectMode == SelectMode.ACTIVE
          ? (IconBuilder(_imagePaths.icSelected)
                ..addOnTapActionClick(() {
                  if (_selectModeAll == SelectMode.ACTIVE && _onSelectEmailActionClick != null) {
                    _onSelectEmailActionClick!(_presentationEmail);
                  }}))
              .build()
          : (AvatarBuilder()
                ..text('${_presentationEmail.getAvatarText()}')
                ..size(56)
                ..textColor(Colors.white)
                ..avatarColor(_presentationEmail.avatarColors)
                // .iconStatus(_imagePaths.icOffline)
                ..addOnTapActionClick(() {
                    if (_selectModeAll == SelectMode.ACTIVE && _onSelectEmailActionClick != null) {
                    _onSelectEmailActionClick!(_presentationEmail);
                    }}))
              .build()
      );
    } else {
      return (AvatarBuilder()
          ..text('${_presentationEmail.getAvatarText()}')
          ..size(56)
          ..textColor(Colors.white)
          ..avatarColor(_presentationEmail.avatarColors))
        // .iconStatus(_imagePaths.icOffline)
        .build();
    }
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = _presentationEmail.selectMode == SelectMode.ACTIVE;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Color _getBackgroundColorItem() {
    return _responsiveUtils.isMobile(_context) ? AppColor.bgMailboxListMail : Colors.white;
  }

  String _getInformationSender() {
    if (_mailboxRole == PresentationMailbox.roleSent
        || _mailboxRole == PresentationMailbox.roleDrafts
        || _mailboxRole == PresentationMailbox.roleOutbox) {
      return '${_presentationEmail.recipientsName()}';
    }
    return '${_presentationEmail.getSenderName()}';
  }
}