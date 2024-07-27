import 'package:tipkle/core/viewmodels/base_viewmodel.dart';

class LoginViewModel extends BaseModel {
  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetch();

    setBusy(false);
  }

  Future<void> fetch() async {}
}
