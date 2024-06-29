// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRouter navigation = AppRouter(name: "root", path: "/");
  static AppRouter homescreen =
      AppRouter(name: "/homescreen", path: "/homescreen");
  static AppRouter searchscreen =
      AppRouter(name: "/searcscreen", path: "/searchscreen");
        static AppRouter profilescreen =
      AppRouter(name: "/profilescreen", path: "/profilescreen");
        static AppRouter schedulescreen =
      AppRouter(name: "/schedulescreen", path: "/schedulescreen");
}
