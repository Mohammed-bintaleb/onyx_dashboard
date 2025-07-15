import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'networking.dart';

class NetworkIfnoImpl implements Netwokinfo {
  final InternetConnectionChecker connectionChecker;

  NetworkIfnoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
