import 'package:flutter/material.dart';
import 'package:islamirevision/features/azkar_feature/azkar_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AzkarScreen extends StatelessWidget {
  static const List<String> names = [
    'أذكار الصباح',
    'أذكار المساء',
    'مايقال عن الاستيقاظ',
    'مايقال عند النوم',
    'مايقال عند الفزع من النوم',
    'مايقال قبل الوضوء',
    'مايقال بعد الوضوء',
    'أذكار الأذان',
    'مايقال إذا خرج إلى الصلاة',
    'ما يقول عند الخروج من المسجد',
    'ما يقول عند الدخول من المسجد',
    'دعاء استفتاح الصلاة',
    'مايقال قبل الطعام',
    'مايقال بعد الطعام',
    'مايقال إذا لبِس ثوبه',
    'ما يقال عند الخروج من المنزل',
    'ما يقال عند الدخول إلى المنزل',
  ];

  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/azkarlogo.png'),
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).hintColor,
          height: 2,
          margin: const EdgeInsets.only(bottom: 4),
        ),
        Text(AppLocalizations.of(context)!.azkar_title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).hintColor,
          height: 2,
          margin: const EdgeInsets.only(top: 4),
        ),
        Expanded(
            flex: 3,
            child: ListView.separated(
              itemBuilder: (context,index){
                return AzkarNameWidget(names[index],index);
              },
              itemCount: names.length,
              separatorBuilder: (buildcontext,index)=>Container(
                width: double.infinity,
                color: Theme.of(context).hintColor,
                height: 1,
              ),
            ))
      ],
    );
  }

}
