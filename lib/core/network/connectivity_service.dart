import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:base_app/core/network/api_client.dart';

class ConnectivityService {
  ConnectivityService(this._apiClient);

  final ApiClient _apiClient;

  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      try {
        final response = await _apiClient.get('https://google.com/');
        if (response.statusCode == 200) {
          return true;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
