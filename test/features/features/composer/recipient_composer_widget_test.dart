import 'package:core/presentation/resources/image_paths.dart';
import 'package:core/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jmap_dart_client/jmap/mail/email/email_address.dart';
import 'package:model/email/prefix_email_address.dart';
import 'package:super_tag_editor/tag_editor.dart';
import 'package:tmail_ui_user/features/composer/presentation/widgets/recipient_composer_widget.dart';
import 'package:tmail_ui_user/features/composer/presentation/widgets/recipient_tag_item_widget.dart';
import 'package:tmail_ui_user/main/localizations/app_localizations_delegate.dart';
import 'package:tmail_ui_user/main/localizations/localization_service.dart';

void main() {
  group('recipient_composer_widget test', () {
    final imagePaths = ImagePaths();
    final keyEmailTagEditor = GlobalKey<TagsEditorState>();
    const prefix = PrefixEmailAddress.to;

    Widget makeTestableWidget({required Widget child}) {
      return GetMaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalizationService.supportedLocales,
        home: Scaffold(body: child),
      );
    }

    testWidgets('RecipientComposerWidget renders correctly', (tester) async {
      final listEmailAddress = <EmailAddress>[];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 360,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final recipientComposerWidgetFinder = find.byType(RecipientComposerWidget);

      expect(recipientComposerWidgetFinder, findsOneWidget);
    });

    testWidgets('RecipientComposerWidget renders list email address correctly', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress(null, 'test1@example.com'),
        EmailAddress(null, 'test2@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 360,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      expect(find.byType(RecipientTagItemWidget), findsNWidgets(2));
      expect(find.text('test1@example.com'), findsOneWidget);
      expect(find.text('test2@example.com'), findsOneWidget);
    });

    testWidgets('RecipientTagItemWidget should have a `maxWidth` equal to the RecipientComposerWidget\'s `maxWidth`', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress('test1', 'test1@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 360,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final recipientTagItemWidgetFinder = find.byKey(Key('recipient_tag_item_${prefix.name}_0'));

      final Container recipientTagItemWidget = tester.widget(recipientTagItemWidgetFinder);

      expect(recipientTagItemWidgetFinder, findsOneWidget);
      expect(recipientTagItemWidget.constraints!.maxWidth, 360);
    });

    testWidgets('WHEN EmailAddress has address is not empty AND display name is not empty\n'
        'RecipientTagItemWidget should have all the components (AvatarIcon, Label, DeleteIcon)', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress('test1', 'test1@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 360,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final recipientTagItemWidgetFinder = find.byKey(Key('recipient_tag_item_${prefix.name}_0'));
      final labelRecipientTagItemWidgetFinder = find.byKey(Key('label_recipient_tag_item_${prefix.name}_0'));
      final deleteIconRecipientTagItemWidgetFinder = find.byKey(Key('delete_icon_recipient_tag_item_${prefix.name}_0'));
      final avatarIconRecipientTagItemWidgetFinder = find.byKey(Key('avatar_icon_recipient_tag_item_${prefix.name}_0'));

      final Size recipientTagItemWidgetSize = tester.getSize(recipientTagItemWidgetFinder);
      final Size labelRecipientTagItemWidgetSize = tester.getSize(labelRecipientTagItemWidgetFinder);
      final Size deleteIconRecipientTagItemWidgetSize = tester.getSize(deleteIconRecipientTagItemWidgetFinder);
      final Size avatarIconRecipientTagItemWidgetSize = tester.getSize(avatarIconRecipientTagItemWidgetFinder);

      log('recipient_composer_widget_test::main: TagSize = $recipientTagItemWidgetSize | LabelTagSize = $labelRecipientTagItemWidgetSize | DeleteIconTagSize = $deleteIconRecipientTagItemWidgetSize | AvatarIconTagSize = $avatarIconRecipientTagItemWidgetSize');

      expect(labelRecipientTagItemWidgetFinder, findsOneWidget);
      expect(deleteIconRecipientTagItemWidgetFinder, findsOneWidget);
      expect(avatarIconRecipientTagItemWidgetFinder, findsOneWidget);

      expect(
        labelRecipientTagItemWidgetSize.width + deleteIconRecipientTagItemWidgetSize.width + avatarIconRecipientTagItemWidgetSize.width,
        lessThanOrEqualTo(recipientTagItemWidgetSize.width)
      );
    });

    testWidgets('RecipientComponentWidget should have all the components (PrefixLabel, RecipientTagItemWidget)', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress('test1', 'test1@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 360,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final prefixRecipientComposerWidgetFinder = find.byKey(Key('prefix_${prefix.name}_recipient_composer_widget'));
      final recipientTagItemWidgetFinder = find.byKey(Key('recipient_tag_item_${prefix.name}_0'));

      final Size prefixRecipientComposerWidgetSize = tester.getSize(prefixRecipientComposerWidgetFinder);
      final Size recipientTagItemWidgetSize = tester.getSize(prefixRecipientComposerWidgetFinder);

      log('recipient_composer_widget_test::main: PrefixLabelSize = $prefixRecipientComposerWidgetSize | TagSize = $recipientTagItemWidgetSize');

      expect(prefixRecipientComposerWidgetFinder, findsOneWidget);
      expect(recipientTagItemWidgetFinder, findsOneWidget);
      expect(
        prefixRecipientComposerWidgetSize.width + recipientTagItemWidgetSize.width,
        lessThanOrEqualTo(360)
      );
    });

    testWidgets('WHEN EmailAddress has address is too long AND display name is NULL\n'
        'RecipientTagItemWidget should have all the components (Label, DeleteIcon)', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress(null, 'test123456789123456789@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 392.7,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final recipientTagItemWidgetFinder = find.byKey(Key('recipient_tag_item_${prefix.name}_0'));
      final labelRecipientTagItemWidgetFinder = find.byKey(Key('label_recipient_tag_item_${prefix.name}_0'));
      final deleteIconRecipientTagItemWidgetFinder = find.byKey(Key('delete_icon_recipient_tag_item_${prefix.name}_0'));

      final Size recipientTagItemWidgetSize = tester.getSize(recipientTagItemWidgetFinder);
      final Size labelRecipientTagItemWidgetSize = tester.getSize(labelRecipientTagItemWidgetFinder);
      final Size deleteIconRecipientTagItemWidgetSize = tester.getSize(deleteIconRecipientTagItemWidgetFinder);

      log('recipient_composer_widget_test::main: TagSize = $recipientTagItemWidgetSize | LabelTagSize = $labelRecipientTagItemWidgetSize | DeleteIconTagSize = $deleteIconRecipientTagItemWidgetSize');

      expect(labelRecipientTagItemWidgetFinder, findsOneWidget);
      expect(deleteIconRecipientTagItemWidgetFinder, findsOneWidget);

      expect(
          labelRecipientTagItemWidgetSize.width + deleteIconRecipientTagItemWidgetSize.width,
          lessThanOrEqualTo(recipientTagItemWidgetSize.width)
      );
    });

    testWidgets('WHEN EmailAddress has address is too long AND display name is too long\n'
        'RecipientTagItemWidget should have all the components (AvatarIcon, Label, DeleteIcon)', (tester) async {
      final listEmailAddress = <EmailAddress>[
        EmailAddress('test12345678912345678909123456789', 'test1234567891234567895678909123456789@example.com'),
      ];

      final widget = makeTestableWidget(
        child: RecipientComposerWidget(
          prefix: prefix,
          listEmailAddress: listEmailAddress,
          imagePaths: imagePaths,
          maxWidth: 392.7,
          keyTagEditor: keyEmailTagEditor,
        ),
      );

      await tester.pumpWidget(widget);

      await tester.pumpAndSettle();

      final recipientTagItemWidgetFinder = find.byKey(Key('recipient_tag_item_${prefix.name}_0'));
      final labelRecipientTagItemWidgetFinder = find.byKey(Key('label_recipient_tag_item_${prefix.name}_0'));
      final deleteIconRecipientTagItemWidgetFinder = find.byKey(Key('delete_icon_recipient_tag_item_${prefix.name}_0'));
      final avatarIconRecipientTagItemWidgetFinder = find.byKey(Key('avatar_icon_recipient_tag_item_${prefix.name}_0'));

      final Size recipientTagItemWidgetSize = tester.getSize(recipientTagItemWidgetFinder);
      final Size labelRecipientTagItemWidgetSize = tester.getSize(labelRecipientTagItemWidgetFinder);
      final Size deleteIconRecipientTagItemWidgetSize = tester.getSize(deleteIconRecipientTagItemWidgetFinder);
      final Size avatarIconRecipientTagItemWidgetSize = tester.getSize(avatarIconRecipientTagItemWidgetFinder);

      log('recipient_composer_widget_test::main: TagSize = $recipientTagItemWidgetSize | LabelTagSize = $labelRecipientTagItemWidgetSize | DeleteIconTagSize = $deleteIconRecipientTagItemWidgetSize | AvatarIconTagSize = $avatarIconRecipientTagItemWidgetSize');

      expect(labelRecipientTagItemWidgetFinder, findsOneWidget);
      expect(deleteIconRecipientTagItemWidgetFinder, findsOneWidget);
      expect(avatarIconRecipientTagItemWidgetFinder, findsOneWidget);

      expect(
        labelRecipientTagItemWidgetSize.width + deleteIconRecipientTagItemWidgetSize.width + avatarIconRecipientTagItemWidgetSize.width,
        lessThanOrEqualTo(recipientTagItemWidgetSize.width)
      );
    });
  });
}