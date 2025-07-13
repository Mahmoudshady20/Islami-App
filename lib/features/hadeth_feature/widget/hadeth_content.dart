import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/hadeth_feature/data/model/hadith_model.dart';
import '../../../shared/l10n/app_localizations.dart';
import '../data/hadith_view_model_cubit.dart';

class HadethContent extends StatelessWidget {
  final HadithModel hadithModel;
  final void Function()? onPressed;

  const HadethContent({
    super.key,
    required this.hadithModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hadithCubit = context.read<HadithViewModelCubit>(); // Use existing cubit

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        hadithCubit.allHadithBackButton(); // ✅ رجع الحالة الأساسية
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              hadithCubit.allHadithBackButton(); // ✅ رجع الحالة الأساسية
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).dividerColor,
            ),
          ),
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        body: Card(
          elevation: 24,
          color: Theme.of(context).cardColor,
          margin: const EdgeInsets.symmetric(
            vertical: 48,
            horizontal: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        hadithModel.title,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: AppStyles.getResponsiveFontSize(
                            context,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.copy,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).hintColor,
                height: 1,
              ),
              Expanded(
                child: hadithModel.content.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  child: Text(
                    hadithModel.content,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      fontSize: AppStyles.getResponsiveFontSize(
                        context,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
