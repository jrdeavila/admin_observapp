import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable(as: IRedirectionService)
class UrlLauncherRedirectionService implements IRedirectionService {
  @override
  Future<void> redirect(String url) {
    final uri = Uri.parse(url);

    return launchUrl(uri);
  }
}
