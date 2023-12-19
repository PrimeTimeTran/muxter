import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

class EntityScreen extends StatefulWidget {
  final Map<String, dynamic> entityJson;
  const EntityScreen({super.key, required this.entityJson});

  @override
  State<EntityScreen> createState() => _EntityScreenState();
}

class _EntityScreenState extends State<EntityScreen>
    with WidgetsBindingObserver {
  late Entity entity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(entity.jobTitle ?? ''),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    entity = Entity.fromJson(widget.entityJson);
  }
}
