import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/utils/colors.dart';
import '../../cubits/auth/tab_box/tab_box_cubit.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {

  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TabBoxCubit, TabBoxState>(
        builder: (context, state) {
          return context
              .watch<TabBoxCubit>()
              .screens[context.watch<TabBoxCubit>().currentScreenIndex];
        },
        listener: (context, state) {
          if (state is TabBoxArticleState) {
            context.read<TabBoxCubit>().getArticles();
            setState(() {
              activeIndex = 0;
            });
          }
          if (state is TabBoxProfileState) {
            setState(() {
              activeIndex = 1;
            });
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: AppColors.C_6C63FF,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news_solid,
                  color: Colors.white, size: 30.sp),
              label: "Calculate"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled,
                  color: Colors.white, size: 30.sp),
              label: "Login")
        ],
        currentIndex: activeIndex,
        onTap: (value) {
          activeIndex == 0
              ? context.read<TabBoxCubit>().selectProfileState()
              : context.read<TabBoxCubit>().selectHomeState();
          setState(() {
            activeIndex = value;
          });
        },
      ),
    );
  }
}
