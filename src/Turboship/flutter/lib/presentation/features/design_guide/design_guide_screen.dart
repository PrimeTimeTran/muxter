import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turboship/all.dart';

import 'text_colors.dart';

class DesignGuideScreen extends StatefulWidget {
  final String tab;
  const DesignGuideScreen({super.key, required this.tab});

  @override
  State<DesignGuideScreen> createState() => _DesignGuideScreenState();
}

class _DesignGuideScreenState extends State<DesignGuideScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const TextColors(), options()],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  options() {
    var alpha = context.l10n.accommodations;
    var locale = BlocProvider.of<AppBloc>(context).state.locale;
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        var isDarkTheme = BlocProvider.of<AppBloc>(context).state.isDarkTheme;
        var palette = BlocProvider.of<AppBloc>(context).state.palette;
        var darkText = isDarkTheme ? 'Toggle: Light' : 'Toggle: Dark';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Palette: $palette',
                style: context.textTheme.headingH33xlSemibold,
              ),
            ),
            TextButton(
              onPressed: () {
                getIt.get<AppBloc>().add(AppThemeChanged(!isDarkTheme));
              },
              child: Text(
                darkText,
                style: context.textTheme.b16LgCaps,
              ),
            ),
            TextButton(
              onPressed: () {
                var item = sampleTheme();
                getIt.get<AppBloc>().add(AppPaletteChanged(item));
              },
              child: Text(
                'Random Palette:',
                style: context.textTheme.headingH33xlSemibold,
              ),
            ),
            TextButton(
              onPressed: () {
                String local = locale == 'en' ? 'vi' : 'en';
                getIt.get<AppBloc>().add(AppLanguageChanged(local));
              },
              child: Text(
                'Toggle lang: $locale $alpha',
                style: context.textTheme.b16LgCaps,
              ),
            ),
          ],
        );
      },
    );
  }
}
