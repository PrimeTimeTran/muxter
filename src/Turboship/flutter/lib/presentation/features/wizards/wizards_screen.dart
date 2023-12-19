import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turboship/all.dart';

class WizardsScreen extends StatefulWidget {
  const WizardsScreen({super.key});

  @override
  State<WizardsScreen> createState() => _WizardsScreenState();
}

class _WizardsScreenState extends State<WizardsScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: 'Wizards',
        onLeadingPressed: _handleOnLeadingPressed,
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('WizardsScreen'),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void _handleOnLeadingPressed() {
    context.pop();
  }
}
