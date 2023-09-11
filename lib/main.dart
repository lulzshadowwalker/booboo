import 'package:booboo/boo.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await GetStorage.init();

  runApp(
    const ProviderScope(
      child: Boo(),
    ),
  );
}
