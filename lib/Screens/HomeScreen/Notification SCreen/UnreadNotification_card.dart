import 'package:flutter/material.dart';

import 'Button.dart';
import 'Notification_text.dart';
import 'TimeAndStatus.dart';


class UnreadCard extends StatelessWidget {
  const UnreadCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 170,
      width: 480,
      color: Colors.red.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeAndOnlineStatus(),
          SizedBox(
            height: 5,
          ),
          NotiText(),
          SubNotiText(),
          TextbUtton()
        ],
      ),
    );
  }
}