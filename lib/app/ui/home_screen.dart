import "package:amasyaappdriver/app/features/auth/features/login/ui/login_form.dart";
import 'package:amasyaappdriver/app/ui/widgets/amasya_logo.dart';
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
              drawer: Drawer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            Images.logo,
                            color: Colors.white,
                            height: 100,
                          ),
                          Text(
                            "AMASYA APP",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (deneme.length > 2)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.logout),
                                  onPressed: () async {
                                    setState(() {
                                      deneme == "";
                                    });
                                    context.router.popUntilRoot();
                                    context.router.popForced();
                                    await context.router.root.replaceAll([const SplashScreenRoute()]);
                                  },
                                  label: const Text(
                                    "Çıkış Yap",
                                  ),
                                ),
                              ],
                            ),
                          if (deneme.length < 2)
                            ElevatedButton.icon(
                              icon: const Icon(Icons.login_outlined),
                              onPressed: () async {
                                context.router.popUntilRoot();
                                context.router.popForced();
                                await context.router.root.replaceAll([const LoginScreenRoute()]);
                              },
                              label: const Text(
                                "Sürücü Girişi Yap",
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (final context) {
                          return const AboutDialog(
                            applicationName: "AMASYA APP",
                            applicationVersion: "1.0.0",
                            applicationLegalese: "© 2023 AMASYA APP",
                          );
                        },
                      );
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
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  enableFeedback: true,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_outlined),
                      label: "DASHBOARD",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_city_outlined),
                      label: "KENT BİLGİSİ",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.info_outlined),
                      label: "İLETİŞİM",
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.person_outline),
                    //   label: "PROFİL",
                    // ),
                  ],
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                ),
              )),
        );
      },
    );
  }
}
