// Generated by dart2js (NullSafetyMode.sound, trust primitives, omit checks, lax runtime type, csp, deferred-serialization, intern-composite-values), the Dart to JavaScript compiler version: 2.19.2.
self.$__dart_deferred_initializers__ = self.$__dart_deferred_initializers__ || Object.create(null);
$__dart_deferred_initializers__.current = function(hunkHelpers, init, holdersList, $) {
  var B = {FocusedMenuItem: function FocusedMenuItem(t0, t1, t2) {
      this.title = t0;
      this.backgroundColor = t1;
      this.onPressed = t2;
    }, SearchMailboxView: function SearchMailboxView(t0, t1) {
      this.backgroundColor = t0;
      this.key = t1;
    }, SearchMailboxView_build_closure: function SearchMailboxView_build_closure(t0) {
      this.context = t0;
    }, SearchMailboxView__buildLoadingView_closure: function SearchMailboxView__buildLoadingView_closure(t0) {
      this.$this = t0;
    }, SearchMailboxView__buildLoadingView__closure: function SearchMailboxView__buildLoadingView__closure() {
    }, SearchMailboxView__buildLoadingView__closure0: function SearchMailboxView__buildLoadingView__closure0(t0) {
      this.$this = t0;
    }, SearchMailboxView__buildSearchInputForm_closure: function SearchMailboxView__buildSearchInputForm_closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildSearchInputForm_closure0: function SearchMailboxView__buildSearchInputForm_closure0(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildSearchInputForm_closure1: function SearchMailboxView__buildSearchInputForm_closure1(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildTextFieldSearchInput_closure: function SearchMailboxView__buildTextFieldSearchInput_closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildMailboxListView_closure: function SearchMailboxView__buildMailboxListView_closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildMailboxListView__closure: function SearchMailboxView__buildMailboxListView__closure(t0) {
      this.$this = t0;
    }, SearchMailboxView__buildMailboxListView___closure: function SearchMailboxView__buildMailboxListView___closure(t0, t1) {
      this.$this = t0;
      this.index = t1;
    }, SearchMailboxView__buildMailboxListView____closure: function SearchMailboxView__buildMailboxListView____closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildMailboxListView____closure0: function SearchMailboxView__buildMailboxListView____closure0(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__buildMailboxListView____closure1: function SearchMailboxView__buildMailboxListView____closure1(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, SearchMailboxView__listPopupMenuItemAction_closure: function SearchMailboxView__listPopupMenuItemAction_closure(t0, t1, t2) {
      this.$this = t0;
      this.context = t1;
      this.mailbox = t2;
    }, SearchMailboxView__mailboxFocusedMenuItem_closure: function SearchMailboxView__mailboxFocusedMenuItem_closure(t0, t1, t2, t3) {
      var _ = this;
      _.$this = t0;
      _.context = t1;
      _.contextMenuItem = t2;
      _.mailbox = t3;
    }, _SearchMailboxView_GetWidget_AppLoaderMixin: function _SearchMailboxView_GetWidget_AppLoaderMixin() {
    }, _SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin: function _SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin() {
    }, MailboxSearchedItemBuilder: function MailboxSearchedItemBuilder(t0, t1, t2, t3, t4, t5, t6, t7, t8, t9) {
      var _ = this;
      _._mailbox_searched_item_builder$_presentationMailbox = t0;
      _._mailbox_searched_item_builder$_imagePaths = t1;
      _._mailbox_searched_item_builder$_responsiveUtils = t2;
      _.maxWidth = t3;
      _.onClickOpenMailboxAction = t4;
      _.onClickOpenMenuMailboxAction = t5;
      _.onDragEmailToMailboxAccepted = t6;
      _.onLongPressMailboxAction = t7;
      _.listPopupMenuItemAction = t8;
      _.key = t9;
    }, _MailboxSearchedItemBuilderState: function _MailboxSearchedItemBuilderState(t0) {
      var _ = this;
      _.isHoverItem = false;
      _._widget = null;
      _._debugLifecycleState = t0;
      _._framework$_element = null;
    }, _MailboxSearchedItemBuilderState_build_closure: function _MailboxSearchedItemBuilderState_build_closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    }, _MailboxSearchedItemBuilderState_build_closure0: function _MailboxSearchedItemBuilderState_build_closure0(t0) {
      this.$this = t0;
    }, _MailboxSearchedItemBuilderState__buildMailboxItem_closure: function _MailboxSearchedItemBuilderState__buildMailboxItem_closure(t0) {
      this.$this = t0;
    }, _MailboxSearchedItemBuilderState__buildMailboxItem__closure: function _MailboxSearchedItemBuilderState__buildMailboxItem__closure(t0, t1) {
      this.$this = t0;
      this.value = t1;
    }, _MailboxSearchedItemBuilderState__buildMenuIcon_closure: function _MailboxSearchedItemBuilderState__buildMenuIcon_closure(t0, t1) {
      this.$this = t0;
      this.context = t1;
    },
    SearchMailboxUtils_getPaddingAppBar(context, responsiveUtils) {
      var t1 = type$.MediaQuery,
        t2 = context.dependOnInheritedWidgetOfExactType$1$0(t1).data;
      if (t2.size._dx >= 1200)
        return C.EdgeInsets_16_8_16_8;
      else if (context.dependOnInheritedWidgetOfExactType$1$0(t1).data.size.get$shortestSide() < 600)
        return C.EdgeInsets_12_8_12_8;
      else
        return C.EdgeInsets_28_8_28_8;
    },
    SearchMailboxUtils_getPaddingInputSearchIcon(context, responsiveUtils) {
      var t1 = type$.MediaQuery,
        t2 = context.dependOnInheritedWidgetOfExactType$1$0(t1).data;
      if (t2.size._dx >= 1200)
        return D.EdgeInsets_5_0_2_0;
      else if (context.dependOnInheritedWidgetOfExactType$1$0(t1).data.size.get$shortestSide() < 600)
        return D.EdgeInsets_6_0_14_0;
      else
        return D.EdgeInsets_8_0_16_0;
    },
    SearchMailboxUtils_getIconSize(context, responsiveUtils) {
      var t1 = context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data;
      if (t1.size._dx >= 1200)
        return 30;
      else
        return 40;
    },
    SearchMailboxUtils_getIconSplashRadius(context, responsiveUtils) {
      var t1 = context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data;
      if (t1.size._dx >= 1200)
        return 10;
      else
        return 15;
    },
    SearchMailboxUtils_getPaddingListViewMailboxSearched(context, responsiveUtils) {
      var t1 = type$.MediaQuery,
        t2 = context.dependOnInheritedWidgetOfExactType$1$0(t1).data;
      if (t2.size._dx >= 1200)
        return C.EdgeInsets_16_0_16_16;
      else if (context.dependOnInheritedWidgetOfExactType$1$0(t1).data.size.get$shortestSide() < 600)
        return C.EdgeInsets_16_16_16_16;
      else
        return F.EdgeInsets_32_16_32_16;
    }
  },
  A, C, E, J, D, F;
  B = hunkHelpers.updateHolder(holdersList[13], B);
  A = holdersList[0];
  C = holdersList[2];
  E = holdersList[17];
  J = holdersList[1];
  D = holdersList[30];
  F = holdersList[29];
  B.FocusedMenuItem.prototype = {};
  B.SearchMailboxView.prototype = {
    build$1(context) {
      var _null = null,
        t1 = A.PointerInterceptor$(this._buildSearchBody$1(context));
      return A.Scaffold$(_null, _null, A.GestureDetector$(_null, t1, C.DragStartBehavior_1, false, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, new B.SearchMailboxView_build_closure(context), _null, _null, _null, _null, _null, _null, _null), _null, _null, true, _null, _null, _null);
    },
    _buildSearchBody$1(context) {
      var t2, t3, t4, _this = this, _null = null,
        t1 = _this.backgroundColor;
      if (t1 == null)
        t1 = C.Color_4294967295;
      t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      t2 = t2._jsWeakMap;
      t3 = A._instanceType(_this)._eval$1("GetWidget.S");
      t4 = B.SearchMailboxUtils_getPaddingAppBar(context, t3._as(t2.get(_this)).responsiveUtils);
      t4 = A._setArrayType([A.Container$(_null, _this._buildSearchInputForm$1(context), C.Clip_0, C.Color_0, _null, _null, _null, _null, _null, _null, t4, _null, _null, _null)], type$.JSArray_Widget);
      A.Expando__checkType(_this);
      t3._as(t2.get(_this)).toString;
      t2 = context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data;
      if (!(t2.size._dx >= 1200))
        t4.push(E.Divider_6xV);
      t4.push(_this._search_mailbox_view$_buildLoadingView$0());
      t4.push(A.Expanded$(_this._buildMailboxListView$1(context), 1));
      return A.Container$(_null, A.Column$(t4, C.CrossAxisAlignment_2, _null, C.MainAxisAlignment_0, C.MainAxisSize_1, C.VerticalDirection_1), C.Clip_0, t1, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null);
    },
    _search_mailbox_view$_buildLoadingView$0() {
      return new A.Obx(new B.SearchMailboxView__buildLoadingView_closure(this), null);
    },
    _buildSearchInputForm$1(context) {
      var t2, t3, t4, t5, t6, t7, _this = this, _null = null,
        t1 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      t1 = t1._jsWeakMap;
      t2 = A._instanceType(_this)._eval$1("GetWidget.S");
      t3 = B.SearchMailboxUtils_getIconSize(context, t2._as(t1.get(_this)).responsiveUtils);
      A.Expando__checkType(_this);
      t4 = B.SearchMailboxUtils_getIconSplashRadius(context, t2._as(t1.get(_this)).responsiveUtils);
      A.Expando__checkType(_this);
      t2._as(t1.get(_this)).toString;
      t5 = A.SvgPicture$asset("assets/images/ic_back.svg", A.ColorNullableExtension_asFilter(C.Color_4278221567), C.BoxFit_0, _null, _null, _null);
      t6 = type$.AppLocalizations;
      A.Localizations_of(context, C.Type_AppLocalizations_swi, t6).toString;
      t4 = A.buildIconWeb(_null, _null, t5, C.EdgeInsets_0_0_0_0, _null, t3, new B.SearchMailboxView__buildSearchInputForm_closure(_this, context), t4, A.Intl__message("Back", _null, "back", _null, _null));
      A.Expando__checkType(_this);
      t2._as(t1.get(_this)).toString;
      t3 = type$.MediaQuery;
      t5 = context.dependOnInheritedWidgetOfExactType$1$0(t3).data;
      t5 = t5.size._dx >= 1200 ? 12 : 0;
      t5 = A.BorderRadius$all(new A.Radius(t5, t5));
      A.Expando__checkType(_this);
      t2._as(t1.get(_this)).toString;
      t3 = context.dependOnInheritedWidgetOfExactType$1$0(t3).data;
      t3 = t3.size._dx >= 1200 ? C.Color_4293651952 : C.Color_0;
      A.Expando__checkType(_this);
      t7 = B.SearchMailboxUtils_getPaddingInputSearchIcon(context, t2._as(t1.get(_this)).responsiveUtils);
      A.Expando__checkType(_this);
      t2._as(t1.get(_this)).toString;
      t1 = A.SvgPicture$asset("assets/images/ic_search_bar.svg", A.ColorNullableExtension_asFilter(C.Color_4278221567), C.BoxFit_0, _null, _null, _null);
      A.Localizations_of(context, C.Type_AppLocalizations_swi, t6).toString;
      t6 = type$.JSArray_Widget;
      return A.Row$(A._setArrayType([t4, A.Expanded$(A.Container$(C.Alignment_0_0, A.Row$(A._setArrayType([new A.Padding(t7, A.buildIconWeb(_null, _null, t1, C.EdgeInsets_0_0_0_0, _null, 40, new B.SearchMailboxView__buildSearchInputForm_closure0(_this, context), _null, A.Intl__message("Search", _null, "search", _null, _null)), _null), A.Expanded$(_this._buildTextFieldSearchInput$1(context), 1), new A.Obx(new B.SearchMailboxView__buildSearchInputForm_closure1(_this, context), _null)], t6), C.CrossAxisAlignment_2, C.MainAxisAlignment_0, C.MainAxisSize_1, _null), C.Clip_0, _null, _null, new A.BoxDecoration(t3, _null, _null, t5, _null, _null, _null, C.BoxShape_0), _null, _null, _null, _null, _null, _null, _null, _null), 1)], t6), C.CrossAxisAlignment_2, C.MainAxisAlignment_0, C.MainAxisSize_1, _null);
    },
    _buildTextFieldSearchInput$1(context) {
      var t2, t3, _this = this, _null = null,
        t1 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      t1 = t1._jsWeakMap;
      t2 = A._instanceType(_this)._eval$1("GetWidget.S");
      t3 = t2._as(t1.get(_this)).get$onTextSearchChange();
      A.Expando__checkType(_this);
      t1 = t2._as(t1.get(_this)).textInputSearchController;
      t2 = context.dependOnInheritedWidgetOfExactType$1$0(type$._LocalizationsScope).localizationsState._localizations$_locale;
      t2 = A.Bidi_isRtlLanguage(t2.get$languageCode(t2)) ? C.TextDirection_0 : C.TextDirection_1;
      A.Localizations_of(context, C.Type_AppLocalizations_swi, type$.AppLocalizations).toString;
      return A.TextFieldBuilder$(true, t1, C.Color_4278221567, A.InputDecoration$(_null, C._NoInputBorder_uXA, _null, C.EdgeInsets_0_0_0_0, _null, _null, _null, _null, true, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, C.TextStyle_chs2, A.Intl__message("Search for mailboxes", _null, "searchForMailboxes", _null, _null), _null, _null, _null, _null, false, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null), _null, _null, C.TextInputType_0_null_null, 1, _null, _null, _null, t3, new B.SearchMailboxView__buildTextFieldSearchInput_closure(_this, context), false, t2, C.TextInputAction_4, C.TextStyle_oHY3);
    },
    _buildMailboxListView$1(context) {
      return new A.Obx(new B.SearchMailboxView__buildMailboxListView_closure(this, context), null);
    },
    _listPopupMenuItemAction$2(context, mailbox) {
      var contextMenuActions, _this = this,
        t1 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      t1 = A._instanceType(_this)._eval$1("GetWidget.S")._as(t1._jsWeakMap.get(_this)).dashboardController.spamReportController._spamReportState;
      contextMenuActions = _this.listContextMenuItemAction$2(mailbox, J.$eq$(t1.get$value(t1), C.SpamReportState_0));
      t1 = A._arrayInstanceType(contextMenuActions)._eval$1("MappedListIterable<1,FocusedMenuItem>");
      return A.List_List$of(new A.MappedListIterable(contextMenuActions, new B.SearchMailboxView__listPopupMenuItemAction_closure(_this, context, mailbox), t1), true, t1._eval$1("ListIterable.E"));
    },
    _mailboxFocusedMenuItem$3(context, contextMenuItem, mailbox) {
      var _this = this, _null = null,
        t1 = contextMenuItem.state === C.ContextMenuItemState_0,
        t2 = t1 ? 1 : 0.3,
        t3 = contextMenuItem.action,
        t4 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      return new B.FocusedMenuItem(A.Expanded$(A.AbsorbPointer$(!t1, A.Opacity$(A.Row$(A._setArrayType([A.SvgPicture$asset(A.MailboxActionsExtension_getContextMenuIcon(t3, A._instanceType(_this)._eval$1("GetWidget.S")._as(t4._jsWeakMap.get(_this)).imagePaths), A.ColorNullableExtension_asFilter(A.MailboxActionsExtension_getColorContextMenuIcon(t3)), C.BoxFit_0, 24, _null, 24), C.SizedBox_12_null_null_null, A.Expanded$(A.Text$(A.MailboxActionsExtension_getTitleContextMenu(t3, context), _null, _null, _null, _null, _null, A.TextStyle$(_null, _null, A.MailboxActionsExtension_getColorContextMenuTitle(t3), _null, _null, _null, _null, _null, _null, _null, _null, 16, _null, _null, C.FontWeight_4_500, _null, _null, true, _null, _null, _null, _null, _null, _null, _null, _null), _null, _null, _null), 1)], type$.JSArray_Widget), C.CrossAxisAlignment_2, C.MainAxisAlignment_0, C.MainAxisSize_1, _null), _null, t2)), 1), C.Color_4294967295, new B.SearchMailboxView__mailboxFocusedMenuItem_closure(_this, context, contextMenuItem, mailbox));
    },
    _openMailboxMenuAction$3$position(context, mailbox, position) {
      var t2, t3, contextMenuActions, t4, _this = this,
        t1 = $.$get$GetWidget__cache();
      A.Expando__checkType(_this);
      t1 = t1._jsWeakMap;
      t2 = A._instanceType(_this)._eval$1("GetWidget.S");
      t3 = t2._as(t1.get(_this)).dashboardController.spamReportController._spamReportState;
      contextMenuActions = _this.listContextMenuItemAction$2(mailbox, J.$eq$(t3.get$value(t3), C.SpamReportState_0));
      if (contextMenuActions.length === 0)
        return;
      A.Expando__checkType(_this);
      t2._as(t1.get(_this)).toString;
      if (context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data.size.get$shortestSide() < 600 || position == null) {
        A.Expando__checkType(_this);
        t3 = t2._as(t1.get(_this));
        A.Expando__checkType(_this);
        t4 = t2._as(t1.get(_this)).imagePaths;
        A.Expando__checkType(_this);
        t3.openContextMenuAction$2(context, _this.contextMenuMailboxActionTiles$5$handleMailboxAction(context, t4, mailbox, contextMenuActions, t2._as(t1.get(_this)).get$handleMailboxAction()));
      } else {
        A.Expando__checkType(_this);
        t3 = t2._as(t1.get(_this));
        A.Expando__checkType(_this);
        t4 = t2._as(t1.get(_this)).imagePaths;
        A.Expando__checkType(_this);
        t3.openPopupMenuAction$3(context, position, _this.popupMenuMailboxActionTiles$5$handleMailboxAction(context, t4, mailbox, contextMenuActions, t2._as(t1.get(_this)).get$handleMailboxAction()));
      }
    },
    _openMailboxMenuAction$2(context, mailbox) {
      return this._openMailboxMenuAction$3$position(context, mailbox, null);
    }
  };
  B._SearchMailboxView_GetWidget_AppLoaderMixin.prototype = {};
  B._SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin.prototype = {};
  B.MailboxSearchedItemBuilder.prototype = {
    createState$0() {
      return new B._MailboxSearchedItemBuilderState(C._StateLifecycle_0);
    }
  };
  B._MailboxSearchedItemBuilderState.prototype = {
    build$1(context) {
      var t1 = A.DragTarget$(new B._MailboxSearchedItemBuilderState_build_closure(this, context), new B._MailboxSearchedItemBuilderState_build_closure0(this), type$.List_PresentationEmail);
      return t1;
    },
    _mailbox_searched_item_builder$_buildMailboxItem$1(context) {
      var _this = this, _null = null,
        t1 = A.BorderRadius$circular(8),
        t2 = _this.getBackgroundColorItem$1(context),
        t3 = A.SearchMailboxUtils_getPaddingItemListView(context, _this._widget._mailbox_searched_item_builder$_responsiveUtils),
        t4 = _this._widget._mailbox_searched_item_builder$_presentationMailbox,
        t5 = t4.mailboxPath;
      if ((t5 == null ? _null : t5.length !== 0) !== true) {
        t5 = t4.namespace;
        t4 = !(t5 == null || t5.$eq(0, new A.Namespace("Personal"))) && !t4.hasParentId$0();
      } else
        t4 = true;
      t4 = t4 ? C.CrossAxisAlignment_0 : C.CrossAxisAlignment_2;
      t5 = type$.JSArray_Widget;
      return A.InkWell$(false, _null, true, A.Container$(_null, A.Row$(A._setArrayType([_this._mailbox_searched_item_builder$_buildMailboxIcon$0(), A.Expanded$(new A.Padding(C.EdgeInsets_8_0_8_0, A.Column$(A._setArrayType([A.TextOverflowBuilder$(A.PresentationMailboxExtension_getDisplayName(_this._widget._mailbox_searched_item_builder$_presentationMailbox, context), C.TextStyle_cMb), _this._mailbox_searched_item_builder$_buildSubtitleItem$0()], t5), C.CrossAxisAlignment_0, _null, C.MainAxisAlignment_0, C.MainAxisSize_1, C.VerticalDirection_1), _null), 1), _this._mailbox_searched_item_builder$_buildMenuIcon$1(context)], t5), t4, C.MainAxisAlignment_0, C.MainAxisSize_1, _null), C.Clip_0, _null, _null, new A.BoxDecoration(t2, _null, _null, t1, _null, _null, _null, C.BoxShape_0), _null, _null, _null, _null, t3, _null, _null, _null), _null, true, _null, _null, _null, _null, _null, _null, _null, _null, _null, new B._MailboxSearchedItemBuilderState__buildMailboxItem_closure(_this), _null, _this.get$_mailbox_searched_item_builder$_onTapMailboxAction(), _null, _null, _null, _null, _null, _null, _null);
    },
    _mailbox_searched_item_builder$_onTapMailboxAction$0() {
      var t1 = this._widget._mailbox_searched_item_builder$_presentationMailbox;
      if (!t1.get$isSubscribedMailbox()) {
        t1 = t1.role;
        t1 = t1 != null && t1.value.length !== 0;
      } else
        t1 = true;
      if (t1) {
        t1 = this._widget;
        t1.onClickOpenMailboxAction.call$1(t1._mailbox_searched_item_builder$_presentationMailbox);
      }
    },
    _mailbox_searched_item_builder$_buildMailboxIcon$0() {
      var t2,
        t1 = this._widget._mailbox_searched_item_builder$_presentationMailbox;
      if (!t1.get$isSubscribedMailbox()) {
        t1 = t1.role;
        t1 = t1 != null && t1.value.length !== 0;
      } else
        t1 = true;
      t2 = this._widget;
      if (t1)
        t1 = A.PresentationMailboxExtension_getMailboxIcon(t2._mailbox_searched_item_builder$_presentationMailbox, t2._mailbox_searched_item_builder$_imagePaths);
      else {
        t2.toString;
        t1 = "assets/images/ic_hide_folder.svg";
      }
      return A.SvgPicture$asset(t1, null, C.BoxFit_0, 20, null, 20);
    },
    _mailbox_searched_item_builder$_buildSubtitleItem$0() {
      var t1 = this._widget._mailbox_searched_item_builder$_presentationMailbox,
        t2 = t1.mailboxPath,
        t3 = t2 == null;
      if ((t3 ? null : t2.length !== 0) === true)
        return A.TextOverflowBuilder$(t3 ? "" : t2, C.TextStyle_chs0);
      else {
        t2 = t1.namespace;
        if (!(t2 == null || t2.$eq(0, new A.Namespace("Personal"))) && !t1.hasParentId$0()) {
          t1 = this._widget._mailbox_searched_item_builder$_presentationMailbox.get$emailTeamMailBoxes();
          return A.TextOverflowBuilder$(t1 == null ? "" : t1, C.TextStyle_chs0);
        } else
          return C.SizedBox_0_0_null_null;
      }
    },
    _mailbox_searched_item_builder$_buildMenuIcon$1(context) {
      var t1, _this = this, _null = null;
      if (_this.isHoverItem)
        t1 = _this._widget.listPopupMenuItemAction.length !== 0;
      else
        t1 = false;
      if (t1) {
        _this._widget.toString;
        return A.InkWell$(false, _null, true, A.SvgPicture$asset("assets/images/ic_composer_menu.svg", _null, C.BoxFit_0, 20, _null, 20), _null, true, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, _null, new B._MailboxSearchedItemBuilderState__buildMenuIcon_closure(_this, context), _null, _null, _null, _null, _null);
      } else
        return C.SizedBox_0_0_null_null;
    },
    getBackgroundColorItem$1(context) {
      if (this.isHoverItem)
        return C.Color_2581915884;
      else {
        this._widget.toString;
        return context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data.size._dx >= 1200 ? C.Color_4294375158 : C.Color_0;
      }
    }
  };
  var typesOffset = hunkHelpers.updateTypes(["MailboxSearchedItemBuilder(BuildContext,BoxConstraints)", "FocusedMenuItem(ContextMenuItemMailboxAction)", "~()"]);
  B.SearchMailboxView_build_closure.prototype = {
    call$0() {
      return A.FocusScope_of(this.context).unfocus$0();
    },
    $signature: 0
  };
  B.SearchMailboxView__buildLoadingView_closure.prototype = {
    call$0() {
      var t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t2 = A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1)).viewState;
      return J.fold$2$ax(t2.get$value(t2), new B.SearchMailboxView__buildLoadingView__closure(), new B.SearchMailboxView__buildLoadingView__closure0(t1));
    },
    $signature: 3
  };
  B.SearchMailboxView__buildLoadingView__closure.prototype = {
    call$1(failure) {
      return C.SizedBox_0_0_null_null;
    },
    $signature: 40
  };
  B.SearchMailboxView__buildLoadingView__closure0.prototype = {
    call$1(success) {
      if (success instanceof A.LoadingSearchMailbox)
        return new A.Padding(C.EdgeInsets_0_16_0_16, C.Center_Jxw, null);
      else
        return C.SizedBox_0_0_null_null;
    },
    $signature: 54
  };
  B.SearchMailboxView__buildSearchInputForm_closure.prototype = {
    call$0() {
      var t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      return A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1)).closeSearchView$1(this.context);
    },
    $signature: 0
  };
  B.SearchMailboxView__buildSearchInputForm_closure0.prototype = {
    call$0() {
      var t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t1 = A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1));
      A.FocusScope_of(this.context).unfocus$0();
      t1.searchMailboxAction$0();
      return null;
    },
    $signature: 0
  };
  B.SearchMailboxView__buildSearchInputForm_closure1.prototype = {
    call$0() {
      var t3, t4, t5, _null = null,
        t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t2 = t2._jsWeakMap;
      t3 = A._instanceType(t1)._eval$1("GetWidget.S");
      t4 = t3._as(t2.get(t1)).currentSearchQuery;
      if (J.get$length$asx(t4.get$value(t4)) !== 0) {
        A.Expando__checkType(t1);
        t3._as(t2.get(t1)).toString;
        t4 = A.SvgPicture$asset("assets/images/ic_clear_search_input.svg", _null, C.BoxFit_0, 24, _null, 24);
        A.Localizations_of(this.context, C.Type_AppLocalizations_swi, type$.AppLocalizations).toString;
        t5 = A.Intl__message("Clear all", _null, "clearAll", _null, _null);
        A.Expando__checkType(t1);
        return new A.Padding(D.EdgeInsets_0_0_2_0, A.buildIconWeb(_null, _null, t4, C.EdgeInsets_0_0_0_0, _null, 40, t3._as(t2.get(t1)).get$clearAllTextInputSearchForm(), _null, t5), _null);
      } else
        return C.SizedBox_0_0_null_null;
    },
    $signature: 89
  };
  B.SearchMailboxView__buildTextFieldSearchInput_closure.prototype = {
    call$1(text) {
      var query,
        t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t1 = A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1));
      query = C.JSString_methods.trim$0(text);
      if (query.length !== 0) {
        A.FocusScope_of(this.context).unfocus$0();
        t1.currentSearchQuery.set$value(0, query);
        t1.searchMailboxAction$0();
      }
      return null;
    },
    $signature: 8
  };
  B.SearchMailboxView__buildMailboxListView_closure.prototype = {
    call$0() {
      var t3, t4,
        t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t2 = t2._jsWeakMap;
      t3 = A._instanceType(t1)._eval$1("GetWidget.S");
      t4 = B.SearchMailboxUtils_getPaddingListViewMailboxSearched(this.context, t3._as(t2.get(t1)).responsiveUtils);
      A.Expando__checkType(t1);
      t2 = t3._as(t2.get(t1)).listMailboxSearched;
      return A.ListView$builder(null, new B.SearchMailboxView__buildMailboxListView__closure(t1), J.get$length$asx(t2.get$value(t2)), null, C.ValueKey_list_mailbox_searched, t4, null, false, C.Axis_1, true);
    },
    $signature: 246
  };
  B.SearchMailboxView__buildMailboxListView__closure.prototype = {
    call$2(context, index) {
      return new A.LayoutBuilder(new B.SearchMailboxView__buildMailboxListView___closure(this.$this, index), null);
    },
    $signature: 1537
  };
  B.SearchMailboxView__buildMailboxListView___closure.prototype = {
    call$2(context, constraints) {
      var t3, t4, mailboxCurrent, t5,
        t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t2 = t2._jsWeakMap;
      t3 = A._instanceType(t1)._eval$1("GetWidget.S");
      t4 = t3._as(t2.get(t1)).listMailboxSearched;
      mailboxCurrent = J.$index$asx(t4.get$value(t4), this.index);
      A.Expando__checkType(t1);
      t4 = t3._as(t2.get(t1)).imagePaths;
      A.Expando__checkType(t1);
      t5 = t3._as(t2.get(t1)).responsiveUtils;
      A.Expando__checkType(t1);
      return new B.MailboxSearchedItemBuilder(mailboxCurrent, t4, t5, constraints.maxWidth, new B.SearchMailboxView__buildMailboxListView____closure(t1, context), new B.SearchMailboxView__buildMailboxListView____closure0(t1, context), t3._as(t2.get(t1)).dashboardController.get$dragSelectedMultipleEmailToMailboxAction(), new B.SearchMailboxView__buildMailboxListView____closure1(t1, context), t1._listPopupMenuItemAction$2(context, mailboxCurrent), null);
    },
    $signature: typesOffset + 0
  };
  B.SearchMailboxView__buildMailboxListView____closure.prototype = {
    call$1(mailbox) {
      var t3, t4,
        t1 = this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      t1 = A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1));
      t2 = this.context;
      A.FocusScope_of(t2).unfocus$0();
      t3 = t1.dashboardController;
      t4 = new A.OpenMailboxAction(mailbox);
      A.log("MailboxDashBoardController::dispatchMailboxUIAction():newAction: " + A.getRuntimeType(t4).toString$0(0));
      t3.mailboxUIAction.set$value(0, t4);
      t3 = t2.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data;
      if (!(t3.size._dx >= 1200))
        t1.closeSearchView$1(t2);
      return null;
    },
    $signature: 133
  };
  B.SearchMailboxView__buildMailboxListView____closure0.prototype = {
    call$2(position, mailbox) {
      return this.$this._openMailboxMenuAction$3$position(this.context, mailbox, position);
    },
    $signature: 1538
  };
  B.SearchMailboxView__buildMailboxListView____closure1.prototype = {
    call$1(mailbox) {
      return this.$this._openMailboxMenuAction$2(this.context, mailbox);
    },
    $signature: 133
  };
  B.SearchMailboxView__listPopupMenuItemAction_closure.prototype = {
    call$1(action) {
      return this.$this._mailboxFocusedMenuItem$3(this.context, action, this.mailbox);
    },
    $signature: typesOffset + 1
  };
  B.SearchMailboxView__mailboxFocusedMenuItem_closure.prototype = {
    call$0() {
      var _this = this,
        t1 = _this.$this,
        t2 = $.$get$GetWidget__cache();
      A.Expando__checkType(t1);
      return A._instanceType(t1)._eval$1("GetWidget.S")._as(t2._jsWeakMap.get(t1)).handleMailboxAction$4$isFocusedMenu(_this.context, _this.contextMenuItem.action, _this.mailbox, true);
    },
    $signature: 0
  };
  B._MailboxSearchedItemBuilderState_build_closure.prototype = {
    call$3(_, __, ___) {
      return this.$this._mailbox_searched_item_builder$_buildMailboxItem$1(this.context);
    },
    $signature: 312
  };
  B._MailboxSearchedItemBuilderState_build_closure0.prototype = {
    call$1(emails) {
      var t1 = this.$this._widget;
      t1.onDragEmailToMailboxAccepted.call$2(emails, t1._mailbox_searched_item_builder$_presentationMailbox);
    },
    $signature: 311
  };
  B._MailboxSearchedItemBuilderState__buildMailboxItem_closure.prototype = {
    call$1(value) {
      var t1 = this.$this;
      return t1.setState$1(new B._MailboxSearchedItemBuilderState__buildMailboxItem__closure(t1, value));
    },
    $signature: 14
  };
  B._MailboxSearchedItemBuilderState__buildMailboxItem__closure.prototype = {
    call$0() {
      return this.$this.isHoverItem = this.value;
    },
    $signature: 0
  };
  B._MailboxSearchedItemBuilderState__buildMenuIcon_closure.prototype = {
    call$1(detail) {
      var screenSize = this.context.dependOnInheritedWidgetOfExactType$1$0(type$.MediaQuery).data.size,
        offset = detail.globalPosition,
        t1 = offset._dx,
        t2 = offset._dy,
        t3 = this.$this._widget;
      t3.onClickOpenMenuMailboxAction.call$2(new A.RelativeRect(t1, t2, screenSize._dx - t1, screenSize._dy - t2), t3._mailbox_searched_item_builder$_presentationMailbox);
    },
    $signature: 25
  };
  (function installTearOffs() {
    var _instance_0_u = hunkHelpers._instance_0u;
    _instance_0_u(B._MailboxSearchedItemBuilderState.prototype, "get$_mailbox_searched_item_builder$_onTapMailboxAction", "_mailbox_searched_item_builder$_onTapMailboxAction$0", 2);
  })();
  (function inheritance() {
    var _mixin = hunkHelpers.mixin,
      _inherit = hunkHelpers.inherit,
      _inheritMany = hunkHelpers.inheritMany;
    _inherit(B.FocusedMenuItem, A.Object);
    _inherit(B._SearchMailboxView_GetWidget_AppLoaderMixin, A.GetWidget);
    _inherit(B._SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin, B._SearchMailboxView_GetWidget_AppLoaderMixin);
    _inherit(B.SearchMailboxView, B._SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin);
    _inheritMany(A.Closure0Args, [B.SearchMailboxView_build_closure, B.SearchMailboxView__buildLoadingView_closure, B.SearchMailboxView__buildSearchInputForm_closure, B.SearchMailboxView__buildSearchInputForm_closure0, B.SearchMailboxView__buildSearchInputForm_closure1, B.SearchMailboxView__buildMailboxListView_closure, B.SearchMailboxView__mailboxFocusedMenuItem_closure, B._MailboxSearchedItemBuilderState__buildMailboxItem__closure]);
    _inheritMany(A.Closure, [B.SearchMailboxView__buildLoadingView__closure, B.SearchMailboxView__buildLoadingView__closure0, B.SearchMailboxView__buildTextFieldSearchInput_closure, B.SearchMailboxView__buildMailboxListView____closure, B.SearchMailboxView__buildMailboxListView____closure1, B.SearchMailboxView__listPopupMenuItemAction_closure, B._MailboxSearchedItemBuilderState_build_closure, B._MailboxSearchedItemBuilderState_build_closure0, B._MailboxSearchedItemBuilderState__buildMailboxItem_closure, B._MailboxSearchedItemBuilderState__buildMenuIcon_closure]);
    _inheritMany(A.Closure2Args, [B.SearchMailboxView__buildMailboxListView__closure, B.SearchMailboxView__buildMailboxListView___closure, B.SearchMailboxView__buildMailboxListView____closure0]);
    _inherit(B.MailboxSearchedItemBuilder, A.StatefulWidget);
    _inherit(B._MailboxSearchedItemBuilderState, A.State0);
    _mixin(B._SearchMailboxView_GetWidget_AppLoaderMixin, A.AppLoaderMixin);
    _mixin(B._SearchMailboxView_GetWidget_AppLoaderMixin_MailboxWidgetMixin, A.MailboxWidgetMixin);
  })();
  A._Universe_addRules(init.typeUniverse, JSON.parse('{"SearchMailboxView":{"GetWidget":["SearchMailboxController"],"Widget":[],"DiagnosticableTree":[],"GetWidget.S":"SearchMailboxController"},"MailboxSearchedItemBuilder":{"StatefulWidget":[],"Widget":[],"DiagnosticableTree":[]},"_MailboxSearchedItemBuilderState":{"State0":["MailboxSearchedItemBuilder"]}}'));
  var type$ = {
    AppLocalizations: A.findType("AppLocalizations"),
    JSArray_Widget: A.findType("JSArray<Widget>"),
    List_PresentationEmail: A.findType("List<PresentationEmail>"),
    MediaQuery: A.findType("MediaQuery"),
    _LocalizationsScope: A.findType("_LocalizationsScope")
  };
  (function constants() {
    D.EdgeInsets_0_0_2_0 = new A.EdgeInsets(0, 0, 2, 0);
    D.EdgeInsets_5_0_2_0 = new A.EdgeInsets(5, 0, 2, 0);
    D.EdgeInsets_6_0_14_0 = new A.EdgeInsets(6, 0, 14, 0);
    D.EdgeInsets_8_0_16_0 = new A.EdgeInsets(8, 0, 16, 0);
  })();
};

$__dart_deferred_initializers__["+k3ECgXDrJlf6WaDhGwwWY+R0e8="] = $__dart_deferred_initializers__.current
