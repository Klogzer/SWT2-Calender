import 'package:angular_router/angular_router.dart';

const String idParam = 'id';

class RoutePaths {
  static final RoutePath sample = RoutePath(path: 'sample');
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath appointments = RoutePath(path: 'appointments');
  static final RoutePath appointment = RoutePath(path: '${appointments.path}/:$idParam');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
