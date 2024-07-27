import 'package:tipkle/core/viewmodels/base_viewmodel.dart';

class PostTipViewmodel extends BaseModel {
  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetch();

    setBusy(false);
  }

  Future<void> fetch() async {}
}
