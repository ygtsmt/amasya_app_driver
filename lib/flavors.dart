enum Flavor {
  production,
  staging,
  development,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? "";

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return "Amasya App Driver";
      case Flavor.staging:
        return "Amasya App Driver";
      case Flavor.development:
        return "Amasya App Driver";
      // ignore: no_default_cases
      default:
        return "title";
    }
  }
}
