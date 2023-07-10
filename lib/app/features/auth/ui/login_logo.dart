import "package:amasyaappdriver/app/ui/widgets/amasya_splash.dart";
import "package:flutter/material.dart";
import "package:flutter_adaptive_ui/flutter_adaptive_ui.dart";

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return AdaptiveBuilder(
      layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
        handset: (final BuildContext context, final Screen screen) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const AmasyaSplash(),
          );
        },
        tablet: (final BuildContext context, final Screen screen) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: const AmasyaSplash(),
          );
        },
        desktop: (final BuildContext context, final Screen screen) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 8,
            child: const AmasyaSplash(),
          );
        },
      ),
      defaultBuilder: (final BuildContext context, final Screen screen) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const AmasyaSplash(),
        );
      },
    );
  }
}
