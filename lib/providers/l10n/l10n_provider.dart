import 'package:booboo/helpers/boo_const.dart';
import 'package:booboo/helpers/boo_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'l10n_provider.g.dart';

@Riverpod(keepAlive: true)
class AsyncL10n extends _$AsyncL10n {
  static const _storageKey = 'lang_code';
  static final _log = BooHelpers.getLogger('AsyncL10nProvider');

  @override
  Future<Locale> build() async {
    final box = GetStorage();

    final langCode = box.read<String>(_storageKey);
    if (langCode == null) {
      await box.write(_storageKey, BooConst.en);
      return const Locale(BooConst.en);
    }

    _log.t('locale initialized to "$langCode"');
    return Locale(langCode);
  }

  Future<void> ar() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await GetStorage().write(_storageKey, BooConst.ar);
      return const Locale(BooConst.ar);
    });
    _log.t('local has been set to "${BooConst.ar}');
  }

  Future<void> en() async {
    state = const AsyncValue.loading();

    await GetStorage().write(_storageKey, BooConst.en);
    state = await AsyncValue.guard(() async {
      return const Locale(BooConst.en);
    });
    _log.t('local has been set to "${BooConst.en}');
  }
}
