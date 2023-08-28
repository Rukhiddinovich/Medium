import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/presentation/app_routes.dart';
import 'cubits/cubits/auth/auth_cubit.dart';
import 'cubits/cubits/profile/profile_cubit.dart';
import 'cubits/cubits/tab_box/tab_box_cubit.dart';
import 'cubits/cubits/user_data/user_data_cubit.dart';
import 'cubits/cubits/website/website_cubit.dart';
import 'data/local/storage_repository/storage_repository.dart';
import 'data/network/api_service.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/profile_repository.dart';
import 'data/repository/website_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageRepository.getInstance();

  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => WebsiteRepository(apiService: apiService),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(create: (context) => TabBoxCubit()),
          BlocProvider(create: (context) => UserDataCubit()),
          BlocProvider(create: (context) => ProfileCubit()),
          BlocProvider(
              create: (context) => WebsiteCubit(
                  websiteRepository: context.read<WebsiteRepository>())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RouteNames.splashScreen,
        );
      },
    );
  }
}
