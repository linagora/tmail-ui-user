
import 'package:core/core.dart';
import 'package:core/presentation/extensions/color_extension.dart';
import 'package:core/presentation/views/button/icon_button_web.dart';
import 'package:core/presentation/views/text/text_field_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:model/mailbox/presentation_mailbox.dart';
import 'package:tmail_ui_user/features/base/mixin/app_loader_mixin.dart';
import 'package:tmail_ui_user/features/base/mixin/popup_menu_widget_mixin.dart';
import 'package:tmail_ui_user/features/mailbox/domain/state/search_mailbox_state.dart';
import 'package:tmail_ui_user/features/mailbox/presentation/model/context_item_mailbox_action.dart';
import 'package:tmail_ui_user/features/mailbox/presentation/model/mailbox_actions.dart';
import 'package:tmail_ui_user/features/mailbox/presentation/widgets/mailbox_bottom_sheet_action_tile_builder.dart';
import 'package:tmail_ui_user/features/search/mailbox/presentation/search_mailbox_controller.dart';
import 'package:tmail_ui_user/features/search/mailbox/presentation/utils/search_mailbox_utils.dart';
import 'package:tmail_ui_user/features/search/mailbox/presentation/widgets/mailbox_searched_item_builder.dart';
import 'package:tmail_ui_user/main/localizations/app_localizations.dart';

class SearchMailboxView extends GetWidget<SearchMailboxController>
    with AppLoaderMixin, PopupMenuWidgetMixin {

  final Color? backgroundColor;

  const SearchMailboxView({
    Key? key,
    this.backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: backgroundColor ?? Colors.white,
          child: Column(children: [
            Container(
              color: Colors.transparent,
              padding: SearchMailboxUtils.getPaddingAppBar(context, controller.responsiveUtils),
              child: _buildSearchInputForm(context)
            ),
            if (!controller.responsiveUtils.isWebDesktop(context))
              const Divider(color: AppColor.colorDividerComposer, height: 1),
            _buildLoadingView(),
            Expanded(child: _buildMailboxListView(context))
          ]),
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Obx(() => controller.viewState.value.fold(
      (failure) => const SizedBox.shrink(),
      (success) {
        if (success is LoadingSearchMailbox) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: loadingWidget);
        } else {
          return const SizedBox.shrink();
        }
      }
    ));
  }

  Widget _buildSearchInputForm(BuildContext context) {
    return Row(children: [
      buildIconWeb(
        minSize: SearchMailboxUtils.getIconSize(context, controller.responsiveUtils),
        iconPadding: EdgeInsets.zero,
        splashRadius: SearchMailboxUtils.getIconSplashRadius(context, controller.responsiveUtils),
        icon: SvgPicture.asset(
          controller.imagePaths.icBack,
          color: AppColor.colorTextButton,
          fit: BoxFit.fill
        ),
        tooltip: AppLocalizations.of(context).back,
        onTap: () => controller.closeSearchView(context)
      ),
      Expanded(child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(controller.responsiveUtils.isWebDesktop(context) ? 12 : 0)),
          color: controller.responsiveUtils.isWebDesktop(context)
            ? AppColor.colorBackgroundSearchMailboxInput
            : Colors.transparent
        ),
        alignment: Alignment.center,
        child: Row(children: [
          Padding(
            padding: SearchMailboxUtils.getPaddingInputSearchIcon(context, controller.responsiveUtils),
            child: buildIconWeb(
              minSize: 40,
              iconPadding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                controller.imagePaths.icSearchBar,
                color: AppColor.colorTextButton,
                fit: BoxFit.fill
              ),
              tooltip: AppLocalizations.of(context).search,
              onTap: controller.searchMailboxAction
            ),
          ),
          Expanded(child: _buildTextFieldSearchInput(context)),
          Obx(() {
            if (controller.currentSearchQuery.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(right: 2),
                child: buildIconWeb(
                  minSize: 40,
                  iconPadding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    controller.imagePaths.icClearSearchInput,
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill
                  ),
                  tooltip: AppLocalizations.of(context).clearAll,
                  onTap: controller.clearAllTextInputSearchForm),
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ])
      ))
    ]);
  }

  Widget _buildTextFieldSearchInput(BuildContext context) {
    return (TextFieldBuilder()
      ..onChange(controller.onTextSearchChange)
      ..textInputAction(TextInputAction.search)
      ..addController(controller.textInputSearchController)
      ..textStyle(const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal))
      ..keyboardType(TextInputType.text)
      ..onSubmitted((value) {
        final query = value.trim();
        if (query.isNotEmpty) {
          controller.submitSearchAction(context, query);
        }
      })
      ..maxLines(1)
      ..textDecoration(InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: AppLocalizations.of(context).searchForMailboxes,
          hintStyle: const TextStyle(
            color: AppColor.loginTextFieldHintColor,
            fontSize: 15,
            fontWeight: FontWeight.normal),
          border: InputBorder.none
      )
    )).build();
  }

  Widget _buildMailboxListView(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        padding: SearchMailboxUtils.getPaddingListViewMailboxSearched(context, controller.responsiveUtils),
        key: const Key('list_mailbox_searched'),
        itemCount: controller.listMailboxSearched.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return MailboxSearchedItemBuilder(
            controller.imagePaths,
            controller.responsiveUtils,
            controller.listMailboxSearched[index],
            onDragEmailToMailboxAccepted: controller.dashboardController.dragSelectedMultipleEmailToMailboxAction,
            onClickOpenMailboxAction: (mailbox) => controller.openMailboxAction(context, mailbox),
            onClickOpenMenuMailboxAction: (position, mailbox) => _openMailboxMenuAction(context, mailbox, position: position),
            onLongPressMailboxAction: (mailbox) => _openMailboxMenuAction(context, mailbox),
          );
        }
      );
    });
  }

  MailboxActions mailboxActionForSpam() {
    return controller.dashboardController.enableSpamReport
      ? MailboxActions.disableSpamReport
      : MailboxActions.enableSpamReport;
  }

  void _openMailboxMenuAction(
    BuildContext context,
    PresentationMailbox mailbox,
    {RelativeRect? position}
  ) {
    final mailboxActionsSupported = [
      MailboxActions.openInNewTab,
      if (mailbox.isPersonal && mailbox.isSpam)
        mailboxActionForSpam(),
      MailboxActions.markAsRead,
      MailboxActions.move,
      MailboxActions.rename,
      MailboxActions.delete
    ];

    final listContextMenuItemAction = mailboxActionsSupported
      .map((action) => ContextMenuItemMailboxAction(action, action.getContextMenuItemState(mailbox)))
      .toList();

    if (controller.responsiveUtils.isScreenWithShortestSide(context)) {
      controller.openContextMenuAction(
        context,
        _bottomSheetMailboxActionTiles(
          context,
          mailbox,
          listContextMenuItemAction
        )
      );
    } else {
      controller.openPopupMenuAction(
        context,
        position,
        _popupMenuMailboxActionTiles(
          context,
          mailbox,
          listContextMenuItemAction
        )
      );
    }
  }

  List<Widget> _bottomSheetMailboxActionTiles(
    BuildContext context,
    PresentationMailbox mailbox,
    List<ContextMenuItemMailboxAction> contextMenuActions
  ) {
    return contextMenuActions
      .map((action) => _mailboxContextMenuActionTile(context, action, mailbox))
      .toList();
  }

  Widget _mailboxContextMenuActionTile(
    BuildContext context,
    ContextMenuItemMailboxAction contextMenuItem,
    PresentationMailbox mailbox
  ) {
    return (MailboxBottomSheetActionTileBuilder(
          Key('${contextMenuItem.action.name}_action'),
          SvgPicture.asset(
            contextMenuItem.action.getContextMenuIcon(controller.imagePaths),
            width: 24,
            height: 24,
            color: contextMenuItem.action.getColorContextMenuIcon()
          ),
          contextMenuItem.action.getTitleContextMenu(context),
          mailbox,
          absorbing: !contextMenuItem.isActivated,
          opacity: !contextMenuItem.isActivated)
      ..actionTextStyle(textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black))
      ..onActionClick((mailbox) => controller.handleMailboxAction(context, contextMenuItem.action, mailbox))
    ).build();
  }

  List<PopupMenuEntry> _popupMenuMailboxActionTiles(
      BuildContext context,
      PresentationMailbox mailbox,
      List<ContextMenuItemMailboxAction> contextMenuActions
  ) {
    return contextMenuActions
      .map((action) => _mailboxPopupMenuActionTile(context, action, mailbox))
      .toList();
  }

  PopupMenuItem _mailboxPopupMenuActionTile(
      BuildContext context,
      ContextMenuItemMailboxAction contextMenuItem,
      PresentationMailbox mailbox
  ) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      child: AbsorbPointer(
        absorbing: !contextMenuItem.isActivated,
        child: Opacity(
          opacity: contextMenuItem.isActivated ? 1.0 : 0.3,
          child: popupItem(contextMenuItem.action.getContextMenuIcon(controller.imagePaths),
            contextMenuItem.action.getTitleContextMenu(context),
            colorIcon: contextMenuItem.action.getColorContextMenuIcon(),
            iconSize: 24,
            styleName: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: contextMenuItem.action.getColorContextMenuTitle()
            ),
            onCallbackAction: () => controller.handleMailboxAction(context, contextMenuItem.action, mailbox))
          ,
        )
      )
    );
  }
}