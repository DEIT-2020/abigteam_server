import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'hero_list_component.template.dart' as hero_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import 'login_component.template.dart' as login_template;

export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
  routePath: RoutePaths.dashboard,
  component: dashboard_template.DashboardComponentNgFactory,
  );
  static final login = RouteDefinition(
  routePath: RoutePaths.login,
  component: login_template.LoginComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    heroes,
    dashboard,
    login,
     RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.login.toUrl(),
  ),
  ];
}