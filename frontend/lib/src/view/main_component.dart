import 'dart:core' as prefix0;
import 'dart:core';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/routes/routes.dart';
import 'package:demo/src/view/services/appointment_service.dart';
import 'package:demo/src/view/services/contact_service.dart';
import 'package:demo/src/view/services/dashboard_service.dart';
import 'package:demo/src/view/services/user_service.dart';

import 'components/login_component.dart';

@Component(
  selector: 'my-cal',
  styleUrls:['desktop.css','theme-672-1024.css','mobile.css'],
  templateUrl: 'main_component.html',
  directives: [routerDirectives],
  providers: [
    ClassProvider(AppointmentService),
    ClassProvider(UserService),
    ClassProvider(ContactService),
    ClassProvider(DashboardService),
    ],
  exports: [RoutePaths, Routes],
)
class AppComponent {

  final String title = 'innerComponent';

  //todo muss raus hier
  static bool showButtons = false;
  void logout() {
    LoginComponent.loggedIn = false;
    showButtons = false;
  }
}
// Connection Defaults soll später im Clienten einstellbar sein.
String domain = "localhost";
String port = ":8888";
String url="http://"+domain+port;
