import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IRedirectionUseCase)
class RedirectionUseCase implements IRedirectionUseCase {
  final IRedirectionService _redirectionService;

  RedirectionUseCase(this._redirectionService);
  @override
  Future<void> redirect(String url) {
    return _redirectionService.redirect(url);
  }
}
