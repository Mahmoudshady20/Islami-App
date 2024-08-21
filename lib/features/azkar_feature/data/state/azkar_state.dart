import 'package:islamirevision/features/azkar_feature/data/model/azkar_model.dart';

abstract class AzkarState {}

final class AzkarInitial extends AzkarState {}
final class AzkarSucceed extends AzkarState {
  final AzkarModel azkarModel;
  AzkarSucceed({required this.azkarModel});
}
final class AzkarFailure extends AzkarState {
  final String message;
  AzkarFailure({required this.message});
}

