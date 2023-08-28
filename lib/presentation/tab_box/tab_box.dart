import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/presentation/tab_box/profile/profile_screen.dart';
import 'package:medium_project/presentation/tab_box/website/website_screen.dart';
import 'package:medium_project/utils/colors.dart';
import '../../cubits/cubits/auth/auth_cubit.dart';
import '../app_routes.dart';
import 'articles/article_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      const WebsiteScreen(),
      const ArticlesScreen(),
      const ProfileScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        child: screens[currentIndex],
        listener: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomNavigationBar(
          backgroundColor: AppColors.C_6C63FF,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.web, size: 30.r), label: "Website"),
            BottomNavigationBarItem(
                icon: Icon(Icons.article, size: 30.r), label: "Article"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled, size: 30.r),
                label: "Profile"),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
