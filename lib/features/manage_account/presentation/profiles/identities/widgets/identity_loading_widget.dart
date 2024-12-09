import 'package:core/presentation/extensions/color_extension.dart';
import 'package:core/presentation/state/failure.dart';
import 'package:core/presentation/state/success.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmail_ui_user/features/home/domain/state/get_session_state.dart';
import 'package:tmail_ui_user/features/manage_account/domain/state/get_all_identities_state.dart';

class IdentityLoadingWidget extends StatelessWidget {

  final Either<Failure, Success> identityViewState;

  const IdentityLoadingWidget({
    super.key,
    required this.identityViewState,
  });

  @override
  Widget build(BuildContext context) {
    return identityViewState.fold(
      (failure) => const SizedBox.shrink(),
      (success) {
        if (success is GetAllIdentitiesLoading || success is GetSessionLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CupertinoActivityIndicator(color: AppColor.colorLoading),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }
    );
  }
}