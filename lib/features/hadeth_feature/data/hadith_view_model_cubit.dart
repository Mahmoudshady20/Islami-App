import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/features/hadeth_feature/data/model/hadith_model.dart';
import 'package:islamirevision/features/hadeth_feature/data/state/hadith_state.dart';


class HadithViewModelCubit extends Cubit<HadithStata> {
  HadithViewModelCubit() : super(HadithLoadingStata(message: 'Please wait...'));
  List<HadithModel> allHadethList = [];
  void init(){
    readHadethFile();
  }
  void readHadethFile() async{
    try{
      List<HadithModel> hadethList = [];
      String text = await rootBundle.loadString('assets/files/ahadeth.txt');
      List<String> allHadethContent = text.trim().split('#');
      for(int i=0;i<allHadethContent.length;i++){
        String singleHadethContent = allHadethContent[i];
        List<String> lines = singleHadethContent.trim().split('\n');
        String title = lines[0];
        lines.removeAt(0);
        String content = lines.join('\n');
        HadithModel hadeth = HadithModel(title: title,content:  content);
        hadethList.add(hadeth);
      }
      allHadethList = hadethList;
      emit(HadithInitialStata(allHadethList: allHadethList));
    } catch (e){
      emit(HadithFailureStata(message: e.toString()));
    }
  }
  void buildHadithScreen(int index){
    emit(HadithSucceedStata(allHadethList: allHadethList,index: index));
  }
  void copy(int index){
    final ClipboardData value = ClipboardData(text: allHadethList[index].content);
    Clipboard.setData(value);
  }
  void allHadithBackButton(){
    emit(HadithInitialStata(allHadethList: allHadethList));
  }
}
