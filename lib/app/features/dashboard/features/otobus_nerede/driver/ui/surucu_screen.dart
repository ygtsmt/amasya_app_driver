import 'package:amasyaappdriver/app/ui/widgets/amasya_home_button.dart';
import 'package:amasyaappdriver/app/ui/widgets/amasya_screen_header.dart';
import 'package:amasyaappdriver/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OtobusNeredeSurucuScreen extends StatelessWidget {
  const OtobusNeredeSurucuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AmasyaScreenHeader(title: "Sürücü"),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberOneScreenRoute());
                    },
                    title: "1 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberTwoScreenRoute());
                    },
                    title: "2 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberSixScreenRoute());
                    },
                    title: "6 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
