import 'package:booboo/helpers/boo_log_printer.dart';
import 'package:logger/logger.dart';

final class BooHelpers {
  static final _log = getLogger('SalmonHelpers');

  /// Instantiate a [Logger] instance with the neseccary boilerplate code
  static Logger getLogger(String className) => Logger(
        printer: BooLogPrinter(className),
      );
}
