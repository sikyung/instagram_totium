import 'package:flutter/material.dart';
import 'package:instagramtotium/constants/size.dart';
import 'package:instagramtotium/util/profile_img_path.dart';

class Comment extends StatelessWidget {
  final String username;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  const Comment(
      {Key key,
      @required this.username,
      this.showProfile = false,
      this.dateTime,
      @required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(getProfileImagePath(username)),
            radius: profile_radius,
          ),
        ),
        SizedBox(width: commond_xs_gap,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: username,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: caption),
                    ]),
              ),
              SizedBox(height: commond_xxxs_gap,),
              Visibility(
                  visible: dateTime != null,
                  child: dateTime == null? SizedBox() : Text(dateTime.toIso8601String(), style: TextStyle(color: Colors.grey[500], fontSize: 10))),
            ],
          ),
        )
      ],
    );
  }
}
