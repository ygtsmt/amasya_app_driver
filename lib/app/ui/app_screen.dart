import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:amasyaappdriver/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart";
import 'package:amasyaappdriver/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart';
import "package:amasyaappdriver/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_bloc.dart";
import "package:amasyaappdriver/core/color_schemes.g.dart";
import "package:amasyaappdriver/core/core.dart";

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      // ignore: deprecated_member_use
      final String defaultRouteName = WidgetsBinding.instance.window.defaultRouteName;
      if (defaultRouteName != "/") {
        SystemNavigator.routeInformationUpdated(location: "/", replace: true);
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
        BlocProvider<HaberListBloc>(
          create: (final context) => getIt<HaberListBloc>(),
        ),
        BlocProvider<DuyuruListBloc>(
          create: (final context) => getIt<DuyuruListBloc>(),
        ),
        BlocProvider<HalFiyatlariListBloc>(
          create: (final context) => getIt<HalFiyatlariListBloc>(),
        ),
        
        
      ],
      child:  MaterialApp.router(
            scaffoldMessengerKey: snackbarKey,
            debugShowCheckedModeBanner: false,
           
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
            //  fontFamily: GoogleFonts.lato().fontFamily,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
             //   fontFamily: GoogleFonts.lato().fontFamily,
            ),
            
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          )
    );
  }
}
