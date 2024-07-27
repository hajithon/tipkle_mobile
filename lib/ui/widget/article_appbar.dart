import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/underline_text.dart';

class ArticleAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(170.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: UnderlinedText(
                text: "IT",
                textStyle: AppTextStyles.body1Regular,
                underlineColor: AppColors.black,
                underlineThickness: 2,
              )),
              const SizedBox(height: 20),
              Text(
                "중앙",
                style: AppTextStyles.display1Bold,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100,
                      color: Colors.red,
                      child: Center(child: Text("태그 리스트1")),
                    ),
                    Container(
                      width: 100,
                      color: Colors.orange,
                      child: Center(child: Text("태그 리스트2")),
                    ),
                    Container(
                      width: 100,
                      color: Colors.yellow,
                      child: Center(child: Text("태그 리스트3")),
                    ),
                    Container(
                      width: 100,
                      color: Colors.green,
                      child: Center(child: Text("태그 리스트4")),
                    ),
                    Container(
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("태그 리스트5")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
