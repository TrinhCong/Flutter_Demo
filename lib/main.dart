import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/observers/route_observer.dart';
import 'package:flutter_demo/pages/main.dart';
import 'package:flutter_demo/routes.dart';
import 'package:flutter_demo/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/io_client.dart';
import 'package:jaguar_resty/routes/routes.dart';


void main() {
  runApp(new FreeMoApp());
}

final GlobalKey<NavigatorState> mNavigatorKey = new GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> mRouteObserver = RouteObserver<PageRoute>();

class FreeMoApp extends StatelessWidget {
  ReceivePort port = ReceivePort();

  Locale prevLocale;

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ArchRoutes.main:
        return MainRoute(MainPage(), settings: settings);
      default:
          return MainRoute(MainPage(), settings: settings);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    print('Initializing...');
    // await NotifierManager.initialize();
    print('Initialization done');
  }

  static void callback(List<String> notifications) async {
    print('Notifications: $notifications');
//    final SendPort send = IsolateNameServer.lookupPortByName('notifier_send_port');
//    send?.send(e.toString());
  }


  @override
  Widget build(BuildContext context) {
    globalClient = IOClient();
    return Container(
            child: MaterialApp(
              navigatorKey: mNavigatorKey,
              navigatorObservers: [mRouteObserver],
              title: "FreeMo",
              theme: ArchTheme.theme,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('vi', 'VN'),
              ],
              locale:  Locale('vi', 'VN'),
              initialRoute: ArchRoutes.main,
              onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
            ),
          );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) =>
                RouteAwareWidget(routeObserver: mRouteObserver, child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class FabRoute<T> extends MaterialPageRoute<T> {
  FabRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) =>
                RouteAwareWidget(routeObserver: mRouteObserver, child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
