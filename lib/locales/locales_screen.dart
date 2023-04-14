// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalesScreen extends StatelessWidget {
  const LocalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            onTap: () => context.setLocale(const Locale('en')),
            title: const Text('english').tr(),
          ),
          ListTile(
            onTap: () => context.setLocale(const Locale('lt')),
            title: const Text('lietuviu').tr(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child:
                Text("${'currentLocale'.tr()}: " + context.locale.toString()),
          ),
        ],
      ),
    );
  }
}
