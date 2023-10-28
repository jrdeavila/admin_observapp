import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher_string.dart';

@Injectable(as: IUrlLauncher)
class UrlLauncherImpl implements IUrlLauncher {
  @override
  Future<void> launchUrl(Uri url) {
    return url_launcher.launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    );
  }
}
