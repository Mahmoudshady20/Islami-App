import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/azkar_feature/data/view_model/azkar_cubit.dart';
import 'package:islamirevision/features/azkar_feature/data/state/azkar_state.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_list_widget.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_logo.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_name_widget.dart';
import '../../shared/l10n/app_localizations.dart';
import 'package:islamirevision/shared/widget/custom_divider.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  static AzkarCubit azkarCubit = AzkarCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
        if(state is AzkarSucceed){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: azkarCubit, // مرر الـ Cubit الحالي
                child: AzkarListWidget(
                    title: state.azkarModel.title,
                    azkarContentLength: azkarCubit.content.length,
                    azkarModel: state.azkarModel,
                    counters: azkarCubit.counters,
                ),
              ),
            ),
          );
        }
      },
      bloc: azkarCubit,
      builder: (context, state) {
        if(state is AzkarInitial){
          return Column(
            children: [
              const AzkarLogo(),
              const CustomDivider(
                bottom: 4,
              ),
              Text(
                AppLocalizations.of(context)!.azkar_title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 24),
                ),
              ),
              const CustomDivider(
                top: 4,
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  children: List.generate(
                    azkarCubit.names.length * 2 - 1,
                        (index) {
                      if (index.isEven) {
                        final actualIndex = index ~/ 2;
                        return AzkarNameWidget(
                          title: azkarCubit.names[actualIndex],
                          index: actualIndex,
                          onTap: () {
                            azkarCubit.readFile(actualIndex);
                          },
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
          );
        } else {
          return const Center(
            child: Text('Something error'),
          );
        }
      },
    );
  }
}
