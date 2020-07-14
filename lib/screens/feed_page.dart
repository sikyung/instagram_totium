import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramtotium/constants/size.dart';
import 'package:instagramtotium/widgets/comment.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed:null, icon: ImageIcon(AssetImage('assets/actionbar_camera.png'), color: Colors.black,)),
        title: Image.asset(
          'assets/safewalk.png',
          height: 42,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/actionbar_camera.png'),
                color: Colors.black,
              )),
          IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/direct_message.png'),
                color: Colors.black,
              )),
          //ImageIcon(AssetImage('assets/direct_message.png')),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(index),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(index, context),
        _allComments()
      ],
    );
  }

  FlatButton _allComments() => FlatButton(onPressed:null, child: Text('show all 18 comments', style: TextStyle(color: Colors.grey[600]),));

  Padding _postCaption(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: commond_gap, vertical: commond_s_gap),
      child: Comment(
        //dateTime: DateTime.now(),
        //showProfile: true,
        username: 'SAFWALK $index',
        caption: ' 보행자 1442명, 무단횡단자 25명, 사망자 0명, 부상자 0명',
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: commond_gap),
      child: Text(
        '93% 양호',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/bookmark.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/comment.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/direct_message.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/heart_selected.png'),
            color: Colors.redAccent,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Row _postHeader(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(commond_gap),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://picsum.photos/id/$index/50/50'),
            radius: profile_radius,
          ),
        ),
        Expanded(child: Text('실시간 모니터링(구로디지털단지)')),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(index) {
    return CachedNetworkImage(
        //imageUrl: 'https://picsum.photos/id/$index/200/300',
        imageUrl: 'http://sikoung0129.cafe24.com/image/trafficLight$index.jpg',
        imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )),
              ),
            ));
  }
}
