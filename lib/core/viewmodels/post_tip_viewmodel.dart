import 'package:flutter/material.dart';
import 'package:tipkle/core/models/tag_model.dart';
import 'package:tipkle/core/viewmodels/base_viewmodel.dart';

class PostTipViewmodel extends BaseModel {
  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetch();

    setBusy(false);
  }

  List<bool> isSelected = [false, false];
  List<bool> toggleSelected = [false, false, false];
  List<bool> categorySelected = [false, false, false, false, false];
  final PageController pageController = PageController();
  int currentPageIndex = 0;
  TextEditingController questionEditingController = TextEditingController();
  String questionText = "";

  List<TagModel> tagData = [
    TagModel(tagtitle: "#디자인"),
    TagModel(tagtitle: "#폰트"),
    TagModel(tagtitle: "#플러그인"),
    TagModel(tagtitle: "#코딩"),
    TagModel(tagtitle: "#블록체인"),
    TagModel(tagtitle: "#인공지능"),
    TagModel(tagtitle: "#앱"),
    TagModel(tagtitle: "#소프트웨어"),
    TagModel(tagtitle: "#데이터베이스"),
    TagModel(tagtitle: "#모바일"),
    TagModel(tagtitle: "#로보틱스"),
    TagModel(tagtitle: "#증강현실"),
    TagModel(tagtitle: "#UX/UI"),
  ];

  void changeCategoryToggle(int index) {
    for (int i = 0; i < categorySelected.length; i++) {
      if (i == index) {
        categorySelected[i] = true;
      } else {
        categorySelected[i] = false;
      }
    }
    notifyListeners();
  }

  void changeToggle(int index) {
    toggleSelected[index] = !toggleSelected[index];
    notifyListeners();
  }

  void changeTagState(int index) {
    tagData[index].isSelected = !tagData[index].isSelected;
    notifyListeners();
  }

  void changeQuestionTextState(String value) {
    questionText = value;
    notifyListeners();
  }

  void selectRange(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = true;
      } else {
        isSelected[i] = false;
      }
    }
    notifyListeners();
  }

  bool canGoNext() {
    if (currentPageIndex == 0) {
      return categorySelected.contains(true);
    } else if (currentPageIndex == 1) {
      return isSelected.contains(true);
    } else if (currentPageIndex == 2) {
      return (questionText.isNotEmpty &&
          tagData.any((element) => element.isSelected));
    } else if (currentPageIndex == 3) {
      return toggleSelected.every((element) => element);
    }
    return false;
  }

  Future<bool> onWillPop() async {
    if (pageController.page != 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<void> fetch() async {}
}
