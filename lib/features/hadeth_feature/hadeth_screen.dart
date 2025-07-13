import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/hadeth_feature/data/hadith_view_model_cubit.dart';
import 'package:islamirevision/features/hadeth_feature/data/model/hadith_model.dart';
import 'package:islamirevision/features/hadeth_feature/data/state/hadith_state.dart';
import 'package:islamirevision/features/hadeth_feature/widget/hadeth_content.dart';
import 'package:islamirevision/shared/widget/custom_divider.dart';
import '../../shared/l10n/app_localizations.dart';
import 'package:islamirevision/features/hadeth_feature/widget/hadeth_number.dart';
import 'package:islamirevision/features/hadeth_feature/widget/hadith_loading_state.dart';
import 'package:islamirevision/features/hadeth_feature/widget/hadith_logo.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  final HadithViewModelCubit hadithViewModelCubit = HadithViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadithViewModelCubit, HadithStata>(
      listener: (context, state) {
        if(state is HadithSucceedStata){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: hadithViewModelCubit, // مرر الـ Cubit الحالي
                child: HadethContent(
                  hadithModel: HadithModel(
                    title: state.allHadethList[state.index].title,
                    content: state.allHadethList[state.index].content,
                  ),
                  onPressed: () {
                    hadithViewModelCubit.copy(state.index);
                  },
                ),
              ),
            ),
          );
        }
      },
      bloc: hadithViewModelCubit..init(),
      builder: (context, state) {
        if (state is HadithLoadingStata) {
          return const HadithLoading();
        } else if (state is HadithInitialStata) {
          return Column(
            children: [
              const HadithLogo(),
              const CustomDivider(
                bottom: 4,
              ),
              Text(
                AppLocalizations.of(context)!.hadeth_title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: AppStyles.getResponsiveFontSize(
                        context,
                        fontSize: 28,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const CustomDivider(
                top: 4,
              ),
              Expanded(
                flex: 3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (buildcontext, index) {
                    return HadethNumber(
                      state.allHadethList[index].title,
                      onTap: () {
                        hadithViewModelCubit.buildHadithScreen(index);
                      },
                    );
                  },
                  itemCount: state.allHadethList.length,
                  separatorBuilder: (buildcontext, index) =>
                      const CustomDivider(),
                ),
              )
            ],
          );
        } else if(state is HadithFailureStata){
          return const Center(
            child: Text('Something error'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
