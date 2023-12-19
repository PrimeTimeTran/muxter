# Turboship

Welcome aboard!

## Dependencies

- [Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)
- [Go Router](https://pub.dev/packages/go_router)
- [Flutter Bloc](https://bloclibrary.dev/)
- [JsonSerializable](https://pub.dev/packages/json_serializable)
- [SyncFusion Charts](https://help.syncfusion.com/flutter/introduction/widget-examples)

## Architecture
Turboship uses [Clean Architecture](https://www.youtube.com/watch?v=zon3WgmcqQw&ab_channel=FlutterGuys).

### [Data Layer](https://www.youtube.com/watch?v=0ShDhjiEruQ&ab_channel=MaxonFlutter)

- Repositories 
- Data sources
  - Remote
  - Local
- Model

### [Domain](https://www.youtube.com/watch?v=AlOVRC6eJqE&ab_channel=MaxonFlutter)

- Entities
  - Objects returned to us or those we send to an api
- Repository
  - Abstract classes, contracts
- Use case
  - App specific business rules.
    - Sign up, login...
### [Presentation](https://www.youtube.com/watch?v=jUZQwXdTICg&ab_channel=MaxonFlutter)

---

## Getting Started 🚀

This project contains 2 flavors:

- development
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
flutter run --dart-define=FLAVOR=development

# Production
flutter run --dart-define=FLAVOR=production
```

## Release Builds

### Web

<!-- Check on local first -->
```sh
flutter build web --release --web-renderer html --no-tree-shake-icons --dart-define=FLAVOR=production && flutter run --release -d chrome
```

<!-- On Netlify -->
```sh
if cd flutter; then git pull && cd ..; else git clone https://github.com/flutter/flutter.git; fi && flutter/bin/flutter config --enable-web && flutter/bin/flutter build web --web-renderer html --no-tree-shake-icons --dart-define=FLAVOR=production --dart-define=TENANT_ID=64f8b45d93e2e85811609d7b && sed -i 's#<base href="/">#<base href="https://turboship.ltran.net">#g' build/web/index.html
```

### iOS
Creates a .ipa at `./build/ios/ipa`

```sh
# Check on local first
flutter run --dart-define=FLAVOR=production

# Then build production ipa
flutter build ipa --dart-define=FLAVOR=production --export-options-plist ./ios/ExportOptions.plist
```

### Android
Creates an app bundle at `./build/app/outputs/bundle/productionRelease/app-production-release.aab`

```sh
# Check on local first
flutter run appbundle --flavor=production
# Then build production ipa
flutter build appbundle --dart-define=FLAVOR=production
```
## Troubleshooting

### Troubleshooting

CLI flavor arguments don't seem to pass to iOS




