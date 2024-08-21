import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/features/azkar_feature/data/model/azkar_model.dart';
import 'package:islamirevision/features/azkar_feature/data/state/azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
 final List<String> names = [
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
  List<String> content =[];
  List<String> counters =[];
  int counter = 0;
  void readFile(int index) async{
    try{
       String text = await rootBundle.loadString('assets/files/azkar${index+1}.txt');
       content = text.split('#');
       String textCounter = await rootBundle.loadString('assets/files/count${index+1}.txt');
       counters = textCounter.split('#');
       emit(AzkarSucceed(azkarModel: AzkarModel(title: names[index], content: content),),);
    } catch (e){
       emit(AzkarFailure(message: e.toString()));
    }
  }
  void azkarBackButton(){
    emit(AzkarInitial());
  }
}
