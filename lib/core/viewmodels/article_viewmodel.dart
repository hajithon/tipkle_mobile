import 'package:tipkle/core/viewmodels/base_viewmodel.dart';

class ArticleViewmodel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetch();

    setBusy(false);
  }

  Future<void> fetch() async {}
}
