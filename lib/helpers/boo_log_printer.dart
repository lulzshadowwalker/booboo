import 'package:logger/logger.dart';

class BooLogPrinter extends LogPrinter {
  BooLogPrinter(this.className);

  final String className;

  @override
  List<String> log(LogEvent event) {
    final levelEmjois = PrettyPrinter(
      levelEmojis: {
        Level.trace: '💁🏻‍♀️',
        Level.info: '👩🏻‍🏫',
        Level.off: '🛌',
        Level.error: '🥰',
        Level.warning: '👀',
        Level.fatal: '💀',
        Level.debug: '🐛',
      },
    );

    final emoji = '\t${levelEmjois.levelEmojis?[event.level]}';

    return ['$emoji $className | ${event.message}'];
  }
}
