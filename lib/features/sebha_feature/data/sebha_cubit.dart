import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamirevision/core/local_db/shared_preferences/shared_preferences.dart';
import 'package:islamirevision/features/sebha_feature/data/sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitialState());
  List<int> counter = [
    SharedPrefs.getCounter1(),
    SharedPrefs.getCounter2(),
    SharedPrefs.getCounter3(),
    SharedPrefs.getCounter4(),
    SharedPrefs.getCounter5(),
    SharedPrefs.getCounter6(),
  ];
  List<String> tasbeh = [
    'سُبْحَانَ اللَّهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد',
    'أستغفر الله',
  ];
  void incrementSebha(int index) {
    counter[index]++;
    if (index == 0) {
      SharedPrefs.setCounter1(counter[index]);
    } else if (index == 1) {
      SharedPrefs.setCounter2(counter[index]);
    } else if (index == 2) {
      SharedPrefs.setCounter3(counter[index]);
    } else if (index == 3) {
      SharedPrefs.setCounter4(counter[index]);
    } else if (index == 4) {
      SharedPrefs.setCounter5(counter[index]);
    } else if (index == 5) {
      SharedPrefs.setCounter6(counter[index]);
    }
    emit(SebhaInitialState());
  }

  void restartSebha(int index) {
    counter[index] = 0;
    if (index == 0) {
      SharedPrefs.setCounter1(counter[index]);
    } else if (index == 1) {
      SharedPrefs.setCounter2(counter[index]);
    } else if (index == 2) {
      SharedPrefs.setCounter3(counter[index]);
    } else if (index == 3) {
      SharedPrefs.setCounter4(counter[index]);
    } else if (index == 4) {
      SharedPrefs.setCounter5(counter[index]);
    } else if (index == 5) {
      SharedPrefs.setCounter6(counter[index]);
    }
    emit(SebhaInitialState());
  }
}
