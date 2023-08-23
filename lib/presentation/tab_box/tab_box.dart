import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/presentation/tab_box/profile/profile_screen.dart';
import '../../cubits/auth/tab_box/tab_box_cubit.dart';
import '../../cubits/auth/tab_box/tab_box_state.dart';
import '../auth/page/login_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, TabBoxState>(
        builder: (context, state) {
          if (state is ProfileScreenState) {
            return const ProfileScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news_solid,
                  color: Colors.white, size: 30.sp),
              label: "Calculate"),
          BottomNavigationBarItem(
              icon:
              Icon(CupertinoIcons.profile_circled, color: Colors.white, size: 30.sp),
              label: "Login")
        ],
        onTap: (onTap) {
          context.read<TabBoxCubit>().updateScreen(index: onTap);
        },
      ),
    );
  }
}
