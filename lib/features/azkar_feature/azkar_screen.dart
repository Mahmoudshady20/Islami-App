import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/azkar_feature/data/view_model/azkar_cubit.dart';
import 'package:islamirevision/features/azkar_feature/data/state/azkar_state.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_content.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_logo.dart';
import 'package:islamirevision/features/azkar_feature/widget/azkar_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/shared/widget/custom_divider.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  static AzkarCubit azkarCubit = AzkarCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
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
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AzkarNameWidget(
                      title: azkarCubit.names[index],
                      index: index,
                      onTap: () {
                        azkarCubit.readFile(index);
                      },
                    );
                  },
                  itemCount: azkarCubit.names.length,
                  separatorBuilder: (buildcontext, index) => Container(
                    width: double.infinity,
                    color: Theme.of(context).hintColor,
                    height: 1,
                  ),
                ),
              ),
            ],
          );
        } else if(state is AzkarSucceed){
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        azkarCubit.azkarBackButton();
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
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          state.azkarModel.title,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: AppStyles.getResponsiveFontSize(
                              context,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (buildcontext,index){
                      return AzkarContent(state.azkarModel.content[index],azkarCubit.counters[index]);
                    },
                    itemCount: azkarCubit.content.length,
                    separatorBuilder: (buildcontext,index)=>Container(
                      width: double.infinity,
                      color: Theme.of(context).hintColor,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
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
