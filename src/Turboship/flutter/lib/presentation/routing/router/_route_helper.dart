part of 'app_router.dart';

enum AppPages {
  tabARoot,
  tabAStacked,
  tabBRoot,
  tabBStacked,
  tabCRoot,
  tabCStacked,
  tabDRoot,
  tabDStacked,
  settings,
  privacy,
  entity,
}

extension AppPageX on AppPages {
  String get name {
    switch (this) {
      case AppPages.tabARoot:
        return 'TAB_A_ROOT';
      case AppPages.tabAStacked:
        return 'TAB_A_STACKED';
      case AppPages.tabBRoot:
        return 'TAB_B_ROOT';
      case AppPages.tabBStacked:
        return 'TAB_B_STACKED';
      case AppPages.tabCRoot:
        return 'TAB_C_ROOT';
      case AppPages.tabCStacked:
        return 'TAB_C_STACKED';
      case AppPages.tabDRoot:
        return 'TAB_D_ROOT';
      case AppPages.tabDStacked:
        return 'TAB_D_STACKED';
      case AppPages.entity:
        return 'TAB_A_ENTITY';
      case AppPages.privacy:
        return 'TAB_DRAWER_PRIVACY';
      case AppPages.settings:
        return 'TAB_DRAWER_SETTINGS';
    }
  }

  String get path {
    switch (this) {
      case AppPages.tabARoot:
        return '/tab_a_root';
      case AppPages.tabAStacked:
        return '/tab_a_stacked';
      case AppPages.tabBRoot:
        return '/tab_b_root';
      case AppPages.tabBStacked:
        return '/tab_b_stacked';
      case AppPages.tabCRoot:
        return '/tab_c_root';
      case AppPages.tabCStacked:
        return '/tab_c_stacked';
      case AppPages.tabDRoot:
        return '/tab_d_root';
      case AppPages.tabDStacked:
        return '/tab_d_stacked';
      case AppPages.entity:
        return '/tab_a_entity';
      case AppPages.settings:
        return '/tab_drawer_entity';
      case AppPages.privacy:
        return '/tab_drawer_privacy';
    }
  }
}
