import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turboship/all.dart';

import '_colors.dart';
// import '_icons.dart';

class ProfileScreen extends StatefulWidget {
  final String tab;
  const ProfileScreen({super.key, required this.tab});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [options(), const TextColors()],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  options() {
    final locale = BlocProvider.of<AppBloc>(context).state.locale;
    final palette = BlocProvider.of<AppBloc>(context).state.palette;
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        final isDarkTheme = BlocProvider.of<AppBloc>(context).state.isDarkTheme;
        final darkText = isDarkTheme ? 'Toggle: Light' : 'Toggle: Dark';
        // TextButton, ElevatedButton, Outlined Button
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                label: Text(darkText),
                onPressed: () {
                  getIt.get<AppBloc>().add(AppThemeChanged(!isDarkTheme));
                },
                icon: isDarkTheme
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.nightlight),
              ),
              ElevatedButton.icon(
                label: Text('Random Color Palette: Current($palette)'),
                onPressed: () {
                  var item = sampleTheme();
                  getIt.get<AppBloc>().add(AppPaletteChanged(item));
                },
                icon: const Icon(Icons.slow_motion_video),
              ),
              ElevatedButton(
                onPressed: () {
                  String local = locale == 'en' ? 'vi' : 'en';
                  getIt.get<AppBloc>().add(AppLanguageChanged(local));
                },
                child: Text(
                  'Switch to locale ${locale == 'en' ? 'vi' : 'en'}',
                  style: context.textTheme.b16LgCaps,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
