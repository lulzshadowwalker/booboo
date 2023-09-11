import 'package:booboo/helpers/boo_const.dart';
import 'package:booboo/providers/l10n/l10n_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './l10n/l10n_imports.dart';

class Boo extends ConsumerWidget {
  const Boo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(asyncL10nProvider).when<Locale>(
          data: (locale) => locale,
          error: (_, __) => const Locale(BooConst.en),
          loading: () => const Locale(BooConst.en),
        );

    return MaterialApp(
      title: 'Booboo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: BL.localizationsDelegates,
      supportedLocales: BL.supportedLocales,
      locale: locale,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  BL.of(context).localeName == BooConst.en
                      ? ref.read(asyncL10nProvider.notifier).ar()
                      : ref.read(asyncL10nProvider.notifier).en();
                },
                child: Text(BL.of(context).helloWorld),
              ),
            ),
          );
        },
      ),
    );
  }
}
