import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/features/azkar_feature/data/model/azkar_model.dart';
import 'package:islamirevision/features/azkar_feature/data/view_model/azkar_cubit.dart';

import '../../../core/utils/app_styles.dart';
import 'azkar_content.dart';

class AzkarListWidget extends StatelessWidget {
  final String title;
  final int azkarContentLength;
  final AzkarModel azkarModel;
  final List<String> counters;

  const AzkarListWidget({super.key, required this.title, required this.azkarContentLength, required this.azkarModel, required this.counters});

  @override
  Widget build(BuildContext context) {
    final azkarCubit = context.read<AzkarCubit>(); // Use existing cubit
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        azkarCubit.azkarBackButton();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              azkarCubit.azkarBackButton();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).dividerColor,
              size: AppStyles.getResponsiveFontSize(
                context,
                fontSize: 28,
              ),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: AppStyles.getResponsiveFontSize(
                context,
                fontSize: 28,
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: List.generate(
                    azkarContentLength * 2 - 1,
                        (index) {
                      if (index.isEven) {
                        final actualIndex = index ~/ 2;
                        return AzkarContent(
                          azkarModel.content[actualIndex],
                          counters[actualIndex],
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          color: Theme.of(context).hintColor,
                          height: 1,
                        );
                      }
                    },
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
