import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final Key key;
  final String userName;
  final String userImageUrl;

  MessageBubble(
    this.message,
    this.userName,
    this.userImageUrl,
    this.isUser, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isUser ? Colors.black45 : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      !isUser ? Radius.circular(0) : Radius.circular(12),
                  bottomRight:
                      isUser ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentTextTheme.bodyText1.color,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Theme.of(context).accentTextTheme.bodyText1.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isUser ? null : 120,
          right: isUser ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImageUrl),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
