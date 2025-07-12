import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/l10n/app_localizations.dart';
import 'package:islamirevision/core/utils/app_styles.dart';
import 'package:islamirevision/features/sebha_feature/data/sebha_cubit.dart';
import 'package:islamirevision/features/sebha_feature/data/sebha_state.dart';
import 'package:islamirevision/features/sebha_feature/widget/sebha_content.dart';
import 'package:islamirevision/features/sebha_feature/widget/sebha_count.dart';
import 'package:islamirevision/features/sebha_feature/widget/sebha_header.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});
  static SebhaCubit sebhaCubit = SebhaCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaState>(
      bloc: sebhaCubit,
      builder: (context, state) {
        return Column(
          children: [
            const SebhaHeader(),
            Text(
              AppLocalizations.of(context)!.sebha_title,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: AppStyles.getResponsiveFontSize(
                      context,
                      fontSize: 24,
                    ),
                  ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (buildcontext, index) => Column(
                  children: [
                    SebhaCount(count: sebhaCubit.counter[index].toString()),
                    SebhaContent(
                      title: sebhaCubit.tasbeh[index],
                      onTapIncrement: () {
                        sebhaCubit.incrementSebha(index);
                      },
                      onTapRestart: () {
                        sebhaCubit.restartSebha(index);
                      },
                    ),
                  ],
                ),
                itemCount: sebhaCubit.tasbeh.length,
                padEnds: false,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
