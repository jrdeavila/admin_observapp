import 'dart:developer';

import 'package:mobile_opservapp/lib.dart';

void handlerException(
  Object exception,
  StackTrace stack,
) {
  final handler = getIt<IHandlerExceptionService>();
  handler.handlerException(exception, stack);
  log("=================== Handler Exception ===================");
  log("Exception", error: exception);
}
