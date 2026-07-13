import 'package:flutter/material.dart';

import '../constants.dart';
import '../providers/setting_provider.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    required this.settingProvider,
    required this.settingName,
    required this.dialog,
    required this.value,
  });

  final SettingProvider settingProvider;
  final String settingName;
  final Function dialog;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              settingName,
              style: kGreySmallTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight(500)),
                ),
                TextButton(
                  onPressed: () {
                    dialog(context);
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
