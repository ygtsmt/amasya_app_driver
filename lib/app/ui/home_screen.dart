import "package:amasyaappdriver/app/features/auth/features/login/ui/login_form.dart";
import "package:amasyaappdriver/app/ui/widgets/amasya_logo.dart";
import "package:amasyaappdriver/core/core.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashbordTabRouter(),
        PeTabRouter(),
        CollectionTabRouter(),
        // ProfileTabRouter(),
      ],
      builder: (final context, final child, final animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                leading: const AutoLeadingButton(),
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
                title: const Center(
                  child: SizedBox(
                    height: 40,
                    child: AmasyaLogo(),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () async {
                      setState(() {
                        deneme == "";
                      });
                      context.router.popUntilRoot();
                      context.router.popForced();
                      await context.router.root.replaceAll([const SplashScreenRoute()]);
                    },
                  ),
                ],
              ),
              body: SafeArea(
                child: AdaptiveBuilder(
                  layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
                    handset: (final BuildContext context, final Screen screen) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: child,
                      );
                    },
                    tablet: (final BuildContext context, final Screen screen) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: child,
                      );
                    },
                    desktop: (final BuildContext context, final Screen screen) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: child,
                      );
                    },
                  ),
                  defaultBuilder: (final BuildContext context, final Screen screen) {
                    return child;
                  },
                ),
              ),
            ));
      },
    );
  }
}
