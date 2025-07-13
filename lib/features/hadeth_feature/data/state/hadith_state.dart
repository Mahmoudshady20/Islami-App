import 'package:islamirevision/features/hadeth_feature/data/model/hadith_model.dart';

abstract class HadithStata {}

class HadithLoadingStata extends HadithStata {
  String message;
  HadithLoadingStata({required this.message});
}
class HadithPop extends HadithStata {}
class HadithInitialStata extends HadithStata {
  final List<HadithModel> allHadethList;
  HadithInitialStata({required this.allHadethList});
}
class HadithSucceedStata extends HadithStata {
  final List<HadithModel> allHadethList;
  final int index;
  HadithSucceedStata({required this.allHadethList,required this.index});
}
class HadithFailureStata extends HadithStata {
  String message;
  HadithFailureStata({required this.message});
}