import 'package:amasyaappdriver/app/ui/widgets/amasya_home_button.dart';
import 'package:amasyaappdriver/app/ui/widgets/amasya_screen_header.dart';
import 'package:amasyaappdriver/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AmasyaScreenHeader(
            title: "Sürücü",
          ),
          Row(
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
          Row(
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
          Row(
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
        ],
      ),
    );
  }
}
