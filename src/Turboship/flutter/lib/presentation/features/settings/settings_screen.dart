import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turboship/all.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var alpha = context.l10n.accommodations;
    var locale = BlocProvider.of<AppBloc>(context).state.locale;
    return CommonScaffold(
      appBar: CommonAppBar(
        title: 'Settings',
        onLeadingPressed: _handleOnLeadingPressed,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (c, state) {
                var isDarkTheme =
                    BlocProvider.of<AppBloc>(context).state.isDarkTheme;
                var palette = BlocProvider.of<AppBloc>(context).state.palette;
                var darkText =
                    isDarkTheme ? 'Change to light' : 'Change to dark';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        LogUtil.i('Changing Theme $isDarkTheme');
                        getIt.get<AppBloc>().add(AppThemeChanged(!isDarkTheme));
                      },
                      child: Text(
                        darkText,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        LogUtil.i('Changing Palette');
                        var item = sampleTheme();
                        LogUtil.i(item);
                        getIt.get<AppBloc>().add(AppPaletteChanged(item));
                      },
                      child: Text(
                        'Sample $palette',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        LogUtil.i('Changing Theme $locale');
                        String local = locale == 'en' ? 'vi' : 'en';
                        getIt.get<AppBloc>().add(AppLanguageChanged(local));
                      },
                      child: Text(
                        'Change from $locale $alpha',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    AppSpacing.gapH12,
                    AppButton.primary(
                      onPressed: () {
                        // context.go(AppPages.settings.path);
                      },
                      width: double.infinity,
                      label: 'Welcome',
                    ),
                    AppSpacing.gapH12,
                  ],
                );
              },
            ),
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
    final lastIdx = AppRouter.navMap['tabIdx'];
    context.goNamed(AppRouter.tabs[lastIdx].name);
  }
}
