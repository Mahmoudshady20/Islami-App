import 'package:flutter/material.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/hadeth_feature/data/model/hadith_model.dart';

class HadethContent extends StatelessWidget {
  final HadithModel hadithModel;
  final void Function()? onPressed;
  final void Function()? onPressed2;

  const HadethContent({
    super.key,
    required this.hadithModel,
    required this.onPressed,
    required this.onPressed2,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
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
              IconButton(
                onPressed: onPressed2,
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Theme.of(context).dividerColor,
                ),
              ),
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }
}
