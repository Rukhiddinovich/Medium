import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../cubits/auth/auth/auth_cubit.dart';
import '../../utils/icons.dart';
import '../app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).checkLoggedState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state){
          return Center(child: Lottie.asset(AppImages.welcome),);
        },
        listener: (context, state){
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
          if (state is AuthLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }
        },
      ),
    );
  }
}
