import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/sizes.dart';


class RouteAwareWidget extends StatefulWidget {
  final RouteObserver routeObserver;
  final Widget child;

  RouteAwareWidget({this.routeObserver, this.child});

  State<RouteAwareWidget> createState() =>
      RouteAwareWidgetState(routeObserver: routeObserver, child: child);
}

class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  final RouteObserver routeObserver;
  final Widget child;

  RouteAwareWidgetState({this.routeObserver, this.child});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
  }

  @override
  Widget build(BuildContext context) {
    ArchMediaSizes().init(context);
    return Container(child: child);
  }
}
