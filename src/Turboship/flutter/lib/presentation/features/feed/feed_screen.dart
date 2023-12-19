import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:turboship/all.dart';
import 'package:turboship/presentation/features/feed/post/post.dart';

class FeedScreen extends StatefulWidget {
  final String tab;
  const FeedScreen({super.key, required this.tab});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with WidgetsBindingObserver {
  List<Map<String, dynamic>> posts = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: posts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) {
              return Post(post: posts[idx]);
            },
          ),
        ],
      ),
    );
  }

  Future<void> fetchData() async {
    var jsonData = await readJson('assets/data/posts.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonData);

    List<Map<String, dynamic>> fetchedPosts = await parseJson(jsonMap);
    setState(() {
      posts = fetchedPosts;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    fetchData();
  }

  Map<String, dynamic> mapJson(Map<String, dynamic> jsonMap) {
    Map<String, dynamic> resultMap = {};
    jsonMap.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        resultMap[key] = mapJson(value);
      } else if (value is List<dynamic>) {
        resultMap[key] = value.map((element) {
          if (element is Map<String, dynamic>) {
            return mapJson(element);
          } else {
            return element;
          }
        }).toList();
      } else {
        resultMap[key] = value;
      }
    });
    return resultMap;
  }

  List<Map<String, dynamic>> parseData(List<dynamic> dataList) {
    return dataList.map<Map<String, dynamic>>((item) {
      if (item is Map<String, dynamic>) {
        return mapJson(item);
      } else {
        return {};
      }
    }).toList();
  }

  Future<List<Map<String, dynamic>>> parseJson(
      Map<String, dynamic> jsonMap) async {
    if (jsonMap.containsKey('data')) {
      final data = jsonMap['data'];
      if (data is List<dynamic>) {
        return parseData(data);
      }
    }
    return [];
  }
}
