import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

import 'post_image.dart';

class Post extends StatefulWidget {
  final Map<String, dynamic> post;
  const Post({super.key, required this.post});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: C(context, Kolor.outline),
          ),
        ),
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.post['user']['name']),
                leading: Avatar(imageUrl: widget.post['user']['urlAvatar']),
                subtitle: const Text(
                  'A sufficiently long subtitle warrants three lines.',
                ),
              ),
              Text(widget.post['body']),
              PostImage(url: widget.post['assets']?[0]?['url']),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Row(
                          children: [
                            Text(
                              'Reactions ${widget.post['reactions']['meta']['countComments']}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                            'Comments ${widget.post['reactions']['meta']['countComments']}')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            'Reposts ${widget.post['reactions']['meta']['countShares']}')
                      ],
                    ),
                  ],
                ),
              ),
              _buildActions()
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Row(
                children: [
                  Text(
                    'As',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Row(
                children: [
                  Text(
                    'Like',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Row(
                children: [
                  Text(
                    'Comment',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: const Row(
                children: [
                  Text(
                    'Repost',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: const Row(
                children: [
                  Text(
                    'Send',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
