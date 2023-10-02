// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/radio_provider.dart';

class radiowidget extends ConsumerWidget {
  const radiowidget({
    Key? key,
    required this.name,
    required this.valueInput,
    required this.onchageValue,
  }) : super(key: key);
  final String name;
  final int valueInput;
  final VoidCallback onchageValue;

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final radio= ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.green),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(offset: const Offset(-22, 0), child: Text(name) ,),
          
          
          value: valueInput, groupValue: radio, onChanged: (value)=> onchageValue()),
      ),
    );
  }
}
