import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('vi')
  ];

  /// No description provided for @accommodations.
  ///
  /// In en, this message translates to:
  /// **'Accommodations'**
  String get accommodations;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @account_number.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get account_number;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @add_bank_account__account_number_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid account number'**
  String get add_bank_account__account_number_error;

  /// No description provided for @add_bank_account__account_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter account number'**
  String get add_bank_account__account_number_hint;

  /// No description provided for @add_bank_account__account_number_label.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get add_bank_account__account_number_label;

  /// No description provided for @add_bank_account__choose_bank_label.
  ///
  /// In en, this message translates to:
  /// **'Choose Bank'**
  String get add_bank_account__choose_bank_label;

  /// No description provided for @add_bank_account__search_bank_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter bank name'**
  String get add_bank_account__search_bank_hint;

  /// No description provided for @add_bank_account__title.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get add_bank_account__title;

  /// No description provided for @add_item.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get add_item;

  /// No description provided for @alcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get alcohol;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @all_accounts.
  ///
  /// In en, this message translates to:
  /// **'All Accounts'**
  String get all_accounts;

  /// No description provided for @all_time.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get all_time;

  /// No description provided for @all_types.
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get all_types;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @amount_withdrawn.
  ///
  /// In en, this message translates to:
  /// **'Amount Withdrawn'**
  String get amount_withdrawn;

  /// No description provided for @annualized_historic_return.
  ///
  /// In en, this message translates to:
  /// **'Annualized Historic Returns'**
  String get annualized_historic_return;

  /// No description provided for @asset_class.
  ///
  /// In en, this message translates to:
  /// **'Asset Class'**
  String get asset_class;

  /// No description provided for @auth_app.
  ///
  /// In en, this message translates to:
  /// **'Authenticator App'**
  String get auth_app;

  /// No description provided for @auth_app_prompt.
  ///
  /// In en, this message translates to:
  /// **'Secure your account with Google Auth or Authy'**
  String get auth_app_prompt;

  /// No description provided for @automated_bonds.
  ///
  /// In en, this message translates to:
  /// **'Automated Bonds'**
  String get automated_bonds;

  /// No description provided for @automated_investing.
  ///
  /// In en, this message translates to:
  /// **'Automated Investing'**
  String get automated_investing;

  /// No description provided for @automated_investing_prompt.
  ///
  /// In en, this message translates to:
  /// **'Get stable returns with low-fee stock and bond indexes.'**
  String get automated_investing_prompt;

  /// No description provided for @automated_stocks.
  ///
  /// In en, this message translates to:
  /// **'1Hedge'**
  String get automated_stocks;

  /// No description provided for @automated_stocks_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Diversified Companies • 1Long'**
  String get automated_stocks_subtitle;

  /// No description provided for @available_balance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get available_balance;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @bad_credentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email/password'**
  String get bad_credentials;

  /// No description provided for @balanced_retirement.
  ///
  /// In en, this message translates to:
  /// **'Balanced Retirement'**
  String get balanced_retirement;

  /// No description provided for @bank_name.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bank_name;

  /// No description provided for @beneficiaries.
  ///
  /// In en, this message translates to:
  /// **'Beneficiaries'**
  String get beneficiaries;

  /// No description provided for @beneficiaries_prompt.
  ///
  /// In en, this message translates to:
  /// **'Add beneficiaries for your Individual account'**
  String get beneficiaries_prompt;

  /// No description provided for @benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits;

  /// No description provided for @benefits_1.
  ///
  /// In en, this message translates to:
  /// **'✔️ High-Yield, low-risk cash equivalents'**
  String get benefits_1;

  /// No description provided for @benefits_2.
  ///
  /// In en, this message translates to:
  /// **'✔️ Frequent scans to optimize yields'**
  String get benefits_2;

  /// No description provided for @benefits_3.
  ///
  /// In en, this message translates to:
  /// **'✔️ Personalized to your tax return'**
  String get benefits_3;

  /// No description provided for @benefits_4.
  ///
  /// In en, this message translates to:
  /// **'✔️ Monthly interest payouts'**
  String get benefits_4;

  /// No description provided for @benefits_5.
  ///
  /// In en, this message translates to:
  /// **'✔️ No 1Long Advisory Fee'**
  String get benefits_5;

  /// No description provided for @bitcoin.
  ///
  /// In en, this message translates to:
  /// **'Bitcoin'**
  String get bitcoin;

  /// No description provided for @bonds.
  ///
  /// In en, this message translates to:
  /// **'Bonds'**
  String get bonds;

  /// No description provided for @breakdown_holdings.
  ///
  /// In en, this message translates to:
  /// **'Here\'s a breakdown of your 1Long holdings.'**
  String get breakdown_holdings;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @by.
  ///
  /// In en, this message translates to:
  /// **'by'**
  String get by;

  /// No description provided for @cableOrSatellite.
  ///
  /// In en, this message translates to:
  /// **'Cable / Satellite'**
  String get cableOrSatellite;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @carInsurance.
  ///
  /// In en, this message translates to:
  /// **'Car / Vehicle Insurance'**
  String get carInsurance;

  /// No description provided for @carPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get carPayments;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @cash_reward.
  ///
  /// In en, this message translates to:
  /// **'Cash Reward'**
  String get cash_reward;

  /// No description provided for @childCare.
  ///
  /// In en, this message translates to:
  /// **'Child Care'**
  String get childCare;

  /// No description provided for @choose_investments.
  ///
  /// In en, this message translates to:
  /// **'Choose my own investments'**
  String get choose_investments;

  /// No description provided for @choose_investments_prompt.
  ///
  /// In en, this message translates to:
  /// **'Select which assets to add to your portfolio from our entire menu.'**
  String get choose_investments_prompt;

  /// No description provided for @cleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get cleaning;

  /// No description provided for @close_account.
  ///
  /// In en, this message translates to:
  /// **'Liquidate funds and close account'**
  String get close_account;

  /// No description provided for @clothing.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get clothing;

  /// No description provided for @coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get coming_soon;

  /// No description provided for @coming_soon_long.
  ///
  /// In en, this message translates to:
  /// **'Coming soon...'**
  String get coming_soon_long;

  /// No description provided for @commentary.
  ///
  /// In en, this message translates to:
  /// **'commentary'**
  String get commentary;

  /// No description provided for @company_values.
  ///
  /// In en, this message translates to:
  /// **'Company Values'**
  String get company_values;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirm_investment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Investment'**
  String get confirm_investment;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirm_title;

  /// No description provided for @contact_info.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contact_info;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @continue_word.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_word;

  /// No description provided for @copy_link.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get copy_link;

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counterAppBarTitle;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @credit_cards.
  ///
  /// In en, this message translates to:
  /// **'Credit Cards'**
  String get credit_cards;

  /// No description provided for @crypto.
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// No description provided for @customer_support.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customer_support;

  /// No description provided for @customer_support_prompt.
  ///
  /// In en, this message translates to:
  /// **'Our team is staffed 9am-5pm EST, from Monday to Friday'**
  String get customer_support_prompt;

  /// No description provided for @customize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get customize;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @dailyLiving.
  ///
  /// In en, this message translates to:
  /// **'Daily Living'**
  String get dailyLiving;

  /// No description provided for @date_added.
  ///
  /// In en, this message translates to:
  /// **'Date added'**
  String get date_added;

  /// No description provided for @date_added_prompt.
  ///
  /// In en, this message translates to:
  /// **'Date holding was added into strategy'**
  String get date_added_prompt;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @days_ago.
  ///
  /// In en, this message translates to:
  /// **'Days ago'**
  String get days_ago;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get debit;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @deposit_allocation.
  ///
  /// In en, this message translates to:
  /// **'Deposit Allocation'**
  String get deposit_allocation;

  /// No description provided for @deposit_allocation_prompt.
  ///
  /// In en, this message translates to:
  /// **'We automatically allocate your deposit amount based on your profile, prioritizing long-term growth while minimizing risk.'**
  String get deposit_allocation_prompt;

  /// No description provided for @deposit_details.
  ///
  /// In en, this message translates to:
  /// **'Deposit Details'**
  String get deposit_details;

  /// No description provided for @deposit_more.
  ///
  /// In en, this message translates to:
  /// **'Deposit More, Earn More'**
  String get deposit_more;

  /// No description provided for @deposit_more_prompt.
  ///
  /// In en, this message translates to:
  /// **'When you put more into Smart Cash, we\'ll find you the highest available rates based on your personal tax situation.'**
  String get deposit_more_prompt;

  /// No description provided for @deposit_prompt.
  ///
  /// In en, this message translates to:
  /// **'Move funds into 1Long cash'**
  String get deposit_prompt;

  /// No description provided for @deposit_schedule.
  ///
  /// In en, this message translates to:
  /// **'Deposit Schedule'**
  String get deposit_schedule;

  /// No description provided for @deposit_success_prompt.
  ///
  /// In en, this message translates to:
  /// **'We got your deposit request. It\'s now processing.'**
  String get deposit_success_prompt;

  /// No description provided for @deposit_summary.
  ///
  /// In en, this message translates to:
  /// **'Deposit Summary'**
  String get deposit_summary;

  /// No description provided for @deposit_summary_prompt.
  ///
  /// In en, this message translates to:
  /// **'Please review all details of this transfer below before confirming.'**
  String get deposit_summary_prompt;

  /// No description provided for @deposits_investments.
  ///
  /// In en, this message translates to:
  /// **'Deposits & Investments'**
  String get deposits_investments;

  /// No description provided for @diningOut.
  ///
  /// In en, this message translates to:
  /// **'Dining Out'**
  String get diningOut;

  /// No description provided for @disclosures.
  ///
  /// In en, this message translates to:
  /// **'Disclosures'**
  String get disclosures;

  /// No description provided for @dividends.
  ///
  /// In en, this message translates to:
  /// **'Dividends'**
  String get dividends;

  /// No description provided for @dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dob;

  /// No description provided for @doctorsOrDentistsVisits.
  ///
  /// In en, this message translates to:
  /// **'Doctors / Dentists Visits'**
  String get doctorsOrDentistsVisits;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @earn_prompt.
  ///
  /// In en, this message translates to:
  /// **'Make sure they sign up and deposit using your link.'**
  String get earn_prompt;

  /// No description provided for @earn_title.
  ///
  /// In en, this message translates to:
  /// **'Earn \$50 for each friend'**
  String get earn_title;

  /// No description provided for @earned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get earned;

  /// No description provided for @earned_all_time.
  ///
  /// In en, this message translates to:
  /// **'Earned (\$ Return)'**
  String get earned_all_time;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @electricity.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get electricity;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @email_registered.
  ///
  /// In en, this message translates to:
  /// **'Email already registered.'**
  String get email_registered;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @enter_valid_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get enter_valid_amount;

  /// No description provided for @enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email.'**
  String get enter_valid_email;

  /// No description provided for @enter_valid_first.
  ///
  /// In en, this message translates to:
  /// **'Invalid first name.'**
  String get enter_valid_first;

  /// No description provided for @enter_valid_last.
  ///
  /// In en, this message translates to:
  /// **'Invalid last name.'**
  String get enter_valid_last;

  /// No description provided for @enter_valid_password.
  ///
  /// In en, this message translates to:
  /// **'Invalid password.'**
  String get enter_valid_password;

  /// No description provided for @enter_valid_password_matching.
  ///
  /// In en, this message translates to:
  /// **'Invalid matching passwords.'**
  String get enter_valid_password_matching;

  /// No description provided for @enter_valid_password_secure.
  ///
  /// In en, this message translates to:
  /// **'Password insecure. Must be 6+ characters, contain a special char, both upper and lower case letters and a number.'**
  String get enter_valid_password_secure;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @error_prompt.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later.'**
  String get error_prompt;

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @every_month.
  ///
  /// In en, this message translates to:
  /// **'Every month'**
  String get every_month;

  /// No description provided for @every_two_weeks.
  ///
  /// In en, this message translates to:
  /// **'Every two weeks'**
  String get every_two_weeks;

  /// No description provided for @every_week.
  ///
  /// In en, this message translates to:
  /// **'Every week'**
  String get every_week;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @explore_our_strategies.
  ///
  /// In en, this message translates to:
  /// **'Explore Our Strategies'**
  String get explore_our_strategies;

  /// No description provided for @explore_prompt.
  ///
  /// In en, this message translates to:
  /// **'For answers to any other frequently asked questions, please visit our Help Center.'**
  String get explore_prompt;

  /// No description provided for @family_investing.
  ///
  /// In en, this message translates to:
  /// **'Family Investing'**
  String get family_investing;

  /// No description provided for @faq_prompt.
  ///
  /// In en, this message translates to:
  /// **'1Long offers a mix of strategies across stocks, bonds, crypto, real estate, credit, venture capital, treasuries and cash.'**
  String get faq_prompt;

  /// No description provided for @faq_support_center_prompt.
  ///
  /// In en, this message translates to:
  /// **'FAQs and Virtual Assistant'**
  String get faq_support_center_prompt;

  /// No description provided for @financial_details.
  ///
  /// In en, this message translates to:
  /// **'Financial Details'**
  String get financial_details;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @flagship.
  ///
  /// In en, this message translates to:
  /// **'Flagship'**
  String get flagship;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// No description provided for @friends_win.
  ///
  /// In en, this message translates to:
  /// **'Your friend wins, too'**
  String get friends_win;

  /// No description provided for @friends_win_prompt.
  ///
  /// In en, this message translates to:
  /// **'When your friend signs up, they\'ll get \$50 in Smart Cash too. It\'s a win-win.'**
  String get friends_win_prompt;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @ftue_safe_body_1.
  ///
  /// In en, this message translates to:
  /// **'Discover 1Safe! Your gateway to earning more from your savings, starting today, and without the fixed-term restrictions you’d find in traditional bank deposits.'**
  String get ftue_safe_body_1;

  /// No description provided for @ftue_safe_body_2.
  ///
  /// In en, this message translates to:
  /// **'Experience the freedom of high returns with no lock-ins. Unlike traditional bank deposits with fixed terms and early withdrawal penalties, 1Safe allows you to access your money whenever you want, offering the flexibility to secure your dream home, invest in your career, or explore new opportunities on your terms.'**
  String get ftue_safe_body_2;

  /// No description provided for @ftue_safe_body_3.
  ///
  /// In en, this message translates to:
  /// **'Embrace effortless financial security with 1Safe. Join us today, and empower your journey toward affluence by taking control of your money and using a tailored growth strategy to maximize your earnings.'**
  String get ftue_safe_body_3;

  /// No description provided for @ftue_safe_title_1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to 1Safe!'**
  String get ftue_safe_title_1;

  /// No description provided for @ftue_safe_title_2.
  ///
  /// In en, this message translates to:
  /// **'Key Benefits Overview'**
  String get ftue_safe_title_2;

  /// No description provided for @ftue_safe_title_3.
  ///
  /// In en, this message translates to:
  /// **'Get Started Today'**
  String get ftue_safe_title_3;

  /// No description provided for @ftue_track_body_1.
  ///
  /// In en, this message translates to:
  /// **'Track your assets, liabilities, and net worth as well as their change over time. Don’t worry, all your data is private, secured, and encrypted on our database.'**
  String get ftue_track_body_1;

  /// No description provided for @ftue_track_body_2.
  ///
  /// In en, this message translates to:
  /// **'We compare your asset allocations, risk profile, and weighted returns to local and global benchmarks. Ensuring that your returns exceed the average.'**
  String get ftue_track_body_2;

  /// No description provided for @ftue_track_body_3.
  ///
  /// In en, this message translates to:
  /// **'Based on your stated financial goals and asset performance, we may introduce services to you that would better help you get there. Your success is our priority.'**
  String get ftue_track_body_3;

  /// No description provided for @ftue_track_title_1.
  ///
  /// In en, this message translates to:
  /// **'Asset Tracking'**
  String get ftue_track_title_1;

  /// No description provided for @ftue_track_title_2.
  ///
  /// In en, this message translates to:
  /// **'Allocation Optimization'**
  String get ftue_track_title_2;

  /// No description provided for @ftue_track_title_3.
  ///
  /// In en, this message translates to:
  /// **'Personalized Recommendations'**
  String get ftue_track_title_3;

  /// No description provided for @ftue_vision.
  ///
  /// In en, this message translates to:
  /// **'We are the premier financial management app that helps you plan and execute your dreams. We believe that managing money should be simple, convenient, and personalized. With the use of technology and data, we help users craft powerful portfolios and flexible savings plans. Plan your future - we’ll handle the rest.'**
  String get ftue_vision;

  /// No description provided for @fuel.
  ///
  /// In en, this message translates to:
  /// **'Fuel'**
  String get fuel;

  /// No description provided for @funds.
  ///
  /// In en, this message translates to:
  /// **'Funds'**
  String get funds;

  /// No description provided for @funds_prompt.
  ///
  /// In en, this message translates to:
  /// **'Yield as of 9/1/23. For Treasury Funds, this is \nthe current 7-Day Yield and subject to change.'**
  String get funds_prompt;

  /// No description provided for @furnishingOrAppliances.
  ///
  /// In en, this message translates to:
  /// **'Furnishings / Appliances'**
  String get furnishingOrAppliances;

  /// No description provided for @gasOrOil.
  ///
  /// In en, this message translates to:
  /// **'Gas / Oil'**
  String get gasOrOil;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @get_recommendation.
  ///
  /// In en, this message translates to:
  /// **'Get a recommended allocation'**
  String get get_recommendation;

  /// No description provided for @get_recommendation_prompt.
  ///
  /// In en, this message translates to:
  /// **'Tell us how much you want to invest and we\'ll allocate your funds to balance your existing portfolio.'**
  String get get_recommendation_prompt;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @global__cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get global__cancel;

  /// No description provided for @global__confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get global__confirm;

  /// No description provided for @global__confirm_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to continue?'**
  String get global__confirm_message;

  /// No description provided for @global__confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get global__confirm_title;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @groceries.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get groceries;

  /// No description provided for @gym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get gym;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @healthInsurance.
  ///
  /// In en, this message translates to:
  /// **'Health Insurance'**
  String get healthInsurance;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @help_center.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get help_center;

  /// No description provided for @high_yield_cash.
  ///
  /// In en, this message translates to:
  /// **'High Yield\n Cash'**
  String get high_yield_cash;

  /// No description provided for @high_yield_prompt.
  ///
  /// In en, this message translates to:
  /// **'Grow your cash safely, all while earning the highest available yield.'**
  String get high_yield_prompt;

  /// No description provided for @high_yield_savings.
  ///
  /// In en, this message translates to:
  /// **'1Safe'**
  String get high_yield_savings;

  /// No description provided for @high_yield_savings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Large Companies • 1Long'**
  String get high_yield_savings_subtitle;

  /// No description provided for @historical_return.
  ///
  /// In en, this message translates to:
  /// **'historical_return'**
  String get historical_return;

  /// No description provided for @hobbies.
  ///
  /// In en, this message translates to:
  /// **'Hobbies'**
  String get hobbies;

  /// No description provided for @holdings.
  ///
  /// In en, this message translates to:
  /// **'Holdings'**
  String get holdings;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeInsurance.
  ///
  /// In en, this message translates to:
  /// **'Home / Rental Insurance'**
  String get homeInsurance;

  /// No description provided for @homeOrRent.
  ///
  /// In en, this message translates to:
  /// **'Home / Rent'**
  String get homeOrRent;

  /// No description provided for @hours_ago.
  ///
  /// In en, this message translates to:
  /// **'Hours ago'**
  String get hours_ago;

  /// No description provided for @how_it_works.
  ///
  /// In en, this message translates to:
  /// **'How It Works'**
  String get how_it_works;

  /// No description provided for @how_it_works_1.
  ///
  /// In en, this message translates to:
  /// **'You set an ideal account balance for a linked bank'**
  String get how_it_works_1;

  /// No description provided for @how_it_works_2.
  ///
  /// In en, this message translates to:
  /// **'Confirm how frequently 1Long should check your balance'**
  String get how_it_works_2;

  /// No description provided for @how_it_works_3.
  ///
  /// In en, this message translates to:
  /// **'1Long will automatically transfer excess cash'**
  String get how_it_works_3;

  /// No description provided for @how_it_works_4.
  ///
  /// In en, this message translates to:
  /// **'You\'ll earn higher yield, up to 5.29% with Smart Cash'**
  String get how_it_works_4;

  /// No description provided for @how_much.
  ///
  /// In en, this message translates to:
  /// **'How much are you looking to deposit?'**
  String get how_much;

  /// No description provided for @how_would.
  ///
  /// In en, this message translates to:
  /// **'How would you like to start?'**
  String get how_would;

  /// No description provided for @hygiene.
  ///
  /// In en, this message translates to:
  /// **'Hygiene'**
  String get hygiene;

  /// No description provided for @ideal_balance.
  ///
  /// In en, this message translates to:
  /// **'Ideal Balance'**
  String get ideal_balance;

  /// No description provided for @ideal_bank_balance.
  ///
  /// In en, this message translates to:
  /// **'Ideal Bank Balance'**
  String get ideal_bank_balance;

  /// No description provided for @if_uncertain.
  ///
  /// In en, this message translates to:
  /// **'If you\'re not certain about your current investments and want to explore what else 1Long has to offer, you can keep it as Cash and invest it again later.'**
  String get if_uncertain;

  /// No description provided for @inception.
  ///
  /// In en, this message translates to:
  /// **'Inception'**
  String get inception;

  /// No description provided for @inception_date.
  ///
  /// In en, this message translates to:
  /// **'Inception Date'**
  String get inception_date;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @individual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get individual;

  /// No description provided for @insurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get insurance;

  /// No description provided for @insured_prompt.
  ///
  /// In en, this message translates to:
  /// **'*Cash Reserves insured up to \$5M with FDIC while held at program banks if opted into Cash Sweep.'**
  String get insured_prompt;

  /// No description provided for @interest.
  ///
  /// In en, this message translates to:
  /// **'Interest'**
  String get interest;

  /// No description provided for @interest_dividends.
  ///
  /// In en, this message translates to:
  /// **'Interest & Dividends'**
  String get interest_dividends;

  /// No description provided for @internet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get internet;

  /// No description provided for @invest.
  ///
  /// In en, this message translates to:
  /// **'Invest'**
  String get invest;

  /// No description provided for @investing.
  ///
  /// In en, this message translates to:
  /// **'Investing'**
  String get investing;

  /// No description provided for @investing_preference.
  ///
  /// In en, this message translates to:
  /// **'Investing Preference'**
  String get investing_preference;

  /// No description provided for @investment_calculator__calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get investment_calculator__calculate;

  /// No description provided for @investment_calculator__future_value.
  ///
  /// In en, this message translates to:
  /// **'Future Value'**
  String get investment_calculator__future_value;

  /// No description provided for @investment_calculator__initial_amount.
  ///
  /// In en, this message translates to:
  /// **'Initial Amount'**
  String get investment_calculator__initial_amount;

  /// No description provided for @investment_calculator__interest_rate.
  ///
  /// In en, this message translates to:
  /// **'Interest Rate'**
  String get investment_calculator__interest_rate;

  /// No description provided for @investment_calculator__invalid_amount_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get investment_calculator__invalid_amount_error;

  /// No description provided for @investment_calculator__monthly_contribution.
  ///
  /// In en, this message translates to:
  /// **'Monthly Contribution'**
  String get investment_calculator__monthly_contribution;

  /// No description provided for @investment_calculator__title.
  ///
  /// In en, this message translates to:
  /// **'Investment Calculator'**
  String get investment_calculator__title;

  /// No description provided for @investment_calculator__total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get investment_calculator__total;

  /// No description provided for @investment_calculator__total_contributions.
  ///
  /// In en, this message translates to:
  /// **'Total Contributions'**
  String get investment_calculator__total_contributions;

  /// No description provided for @investment_calculator__years.
  ///
  /// In en, this message translates to:
  /// **'Years to Invest'**
  String get investment_calculator__years;

  /// No description provided for @investment_team.
  ///
  /// In en, this message translates to:
  /// **'Investment Team'**
  String get investment_team;

  /// No description provided for @investments.
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get investments;

  /// No description provided for @investor_since.
  ///
  /// In en, this message translates to:
  /// **'Investor Since'**
  String get investor_since;

  /// No description provided for @investors.
  ///
  /// In en, this message translates to:
  /// **'Investors'**
  String get investors;

  /// No description provided for @isEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get isEnglish;

  /// No description provided for @isHello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get isHello;

  /// No description provided for @isHola.
  ///
  /// In en, this message translates to:
  /// **'Hola'**
  String get isHola;

  /// No description provided for @isMundo.
  ///
  /// In en, this message translates to:
  /// **'Mundo'**
  String get isMundo;

  /// No description provided for @isSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get isSpanish;

  /// No description provided for @isTheGioi.
  ///
  /// In en, this message translates to:
  /// **'Thế giới'**
  String get isTheGioi;

  /// No description provided for @isVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get isVietnamese;

  /// No description provided for @isWorld.
  ///
  /// In en, this message translates to:
  /// **'World'**
  String get isWorld;

  /// No description provided for @isXinChao.
  ///
  /// In en, this message translates to:
  /// **'Xin chào'**
  String get isXinChao;

  /// No description provided for @key_details.
  ///
  /// In en, this message translates to:
  /// **'Key Details'**
  String get key_details;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @lawnOrGarden.
  ///
  /// In en, this message translates to:
  /// **'Lawn / Garden'**
  String get lawnOrGarden;

  /// No description provided for @learn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learn;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @legal_prompt.
  ///
  /// In en, this message translates to:
  /// **'1Long Terms & Conditions, Legal Agreements'**
  String get legal_prompt;

  /// No description provided for @leveraged_stocks.
  ///
  /// In en, this message translates to:
  /// **'Leveraged Stocks'**
  String get leveraged_stocks;

  /// No description provided for @lifeInsurance.
  ///
  /// In en, this message translates to:
  /// **'Life Insurance'**
  String get lifeInsurance;

  /// No description provided for @linked_bank.
  ///
  /// In en, this message translates to:
  /// **'Linked Bank'**
  String get linked_bank;

  /// No description provided for @liquidity.
  ///
  /// In en, this message translates to:
  /// **'Liquidity'**
  String get liquidity;

  /// No description provided for @loans.
  ///
  /// In en, this message translates to:
  /// **'Loans'**
  String get loans;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @low_risk.
  ///
  /// In en, this message translates to:
  /// **'Low Risk, Peace of Mind'**
  String get low_risk;

  /// No description provided for @low_risk_prompt.
  ///
  /// In en, this message translates to:
  /// **'Although no investment is risk-free, the cash equivalents available via Smart Cash are some of lowest risk investments possible.'**
  String get low_risk_prompt;

  /// No description provided for @maintain_allocation.
  ///
  /// In en, this message translates to:
  /// **'✔️ Maintain an optimal allocation'**
  String get maintain_allocation;

  /// No description provided for @maintenanceOrImprovements.
  ///
  /// In en, this message translates to:
  /// **'Maintenance / Improvements'**
  String get maintenanceOrImprovements;

  /// No description provided for @make_a_deposit.
  ///
  /// In en, this message translates to:
  /// **'Make a Deposit'**
  String get make_a_deposit;

  /// No description provided for @make_a_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Make a Withdrawal'**
  String get make_a_withdrawal;

  /// No description provided for @make_investment.
  ///
  /// In en, this message translates to:
  /// **'Make an Investment'**
  String get make_investment;

  /// No description provided for @make_transfer.
  ///
  /// In en, this message translates to:
  /// **'Make Transfer'**
  String get make_transfer;

  /// No description provided for @managed_portfolios.
  ///
  /// In en, this message translates to:
  /// **'Managed Portfolios'**
  String get managed_portfolios;

  /// No description provided for @managed_portfolios_prompt.
  ///
  /// In en, this message translates to:
  /// **'Get smart, sophisticated investment portfolios, expertly built.'**
  String get managed_portfolios_prompt;

  /// No description provided for @managed_savings.
  ///
  /// In en, this message translates to:
  /// **'Managed Savings'**
  String get managed_savings;

  /// No description provided for @managed_stocks.
  ///
  /// In en, this message translates to:
  /// **'Managed Stocks'**
  String get managed_stocks;

  /// No description provided for @maximize_diversification.
  ///
  /// In en, this message translates to:
  /// **'✔️ Maximize diversification'**
  String get maximize_diversification;

  /// No description provided for @medicineOrPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'Medicines / Prescriptions'**
  String get medicineOrPrescriptions;

  /// No description provided for @minimum_transfer.
  ///
  /// In en, this message translates to:
  /// **'Minimum Transfer'**
  String get minimum_transfer;

  /// No description provided for @minimum_transfer_one_million.
  ///
  /// In en, this message translates to:
  /// **'Minimum transfer is 1 million'**
  String get minimum_transfer_one_million;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @move_funds.
  ///
  /// In en, this message translates to:
  /// **'Move funds into Strategies'**
  String get move_funds;

  /// No description provided for @moviesOrSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Movies / Subscriptions'**
  String get moviesOrSubscriptions;

  /// No description provided for @my_performance.
  ///
  /// In en, this message translates to:
  /// **'My performance'**
  String get my_performance;

  /// No description provided for @my_performance_prompt.
  ///
  /// In en, this message translates to:
  /// **'Your personal total returns'**
  String get my_performance_prompt;

  /// No description provided for @net_worth.
  ///
  /// In en, this message translates to:
  /// **'Net Worth'**
  String get net_worth;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @offshore.
  ///
  /// In en, this message translates to:
  /// **'Offshore'**
  String get offshore;

  /// No description provided for @one_day_performance.
  ///
  /// In en, this message translates to:
  /// **'1 day performance'**
  String get one_day_performance;

  /// No description provided for @one_day_performance_prompt.
  ///
  /// In en, this message translates to:
  /// **'Change in price over the last day'**
  String get one_day_performance_prompt;

  /// No description provided for @one_hedge.
  ///
  /// In en, this message translates to:
  /// **'1Hedge'**
  String get one_hedge;

  /// No description provided for @one_safe.
  ///
  /// In en, this message translates to:
  /// **'1Safe'**
  String get one_safe;

  /// No description provided for @one_safe_body.
  ///
  /// In en, this message translates to:
  /// **'Lợi nhuận vượt trội lên tới 7%/năm bằng việc cấu trúc các sản phẩm công cụ tiền tệ'**
  String get one_safe_body;

  /// No description provided for @one_safe_prompt.
  ///
  /// In en, this message translates to:
  /// **'by 1Long'**
  String get one_safe_prompt;

  /// No description provided for @one_safe_title.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to 1Safe Cash'**
  String get one_safe_title;

  /// No description provided for @one_safe_your_balance.
  ///
  /// In en, this message translates to:
  /// **'Your Balance'**
  String get one_safe_your_balance;

  /// No description provided for @one_time.
  ///
  /// In en, this message translates to:
  /// **'One-Time'**
  String get one_time;

  /// No description provided for @onesafe_one.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get onesafe_one;

  /// No description provided for @onesafe_three.
  ///
  /// In en, this message translates to:
  /// **'Account Cash Balance'**
  String get onesafe_three;

  /// No description provided for @onesafe_two.
  ///
  /// In en, this message translates to:
  /// **'APY'**
  String get onesafe_two;

  /// No description provided for @opportunities.
  ///
  /// In en, this message translates to:
  /// **'Opportunities'**
  String get opportunities;

  /// No description provided for @optimize_taxes.
  ///
  /// In en, this message translates to:
  /// **'Optimize Tax Savings'**
  String get optimize_taxes;

  /// No description provided for @optimize_taxes_prompt.
  ///
  /// In en, this message translates to:
  /// **'When optimizing your yield, we factor in your tax details. Many products just solve for the top-line number, but we solve for your bottom line.'**
  String get optimize_taxes_prompt;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @outdoorRecreation.
  ///
  /// In en, this message translates to:
  /// **'Outdoor Recreation'**
  String get outdoorRecreation;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @parking.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @permanent_address.
  ///
  /// In en, this message translates to:
  /// **'Permanent Address'**
  String get permanent_address;

  /// No description provided for @personal_details.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personal_details;

  /// No description provided for @petBoarding.
  ///
  /// In en, this message translates to:
  /// **'Pet Boarding'**
  String get petBoarding;

  /// No description provided for @petSupplies.
  ///
  /// In en, this message translates to:
  /// **'Pet Supplies'**
  String get petSupplies;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @portfolio_allocation.
  ///
  /// In en, this message translates to:
  /// **'portfolio Allocation'**
  String get portfolio_allocation;

  /// No description provided for @portfolio_fee_summary.
  ///
  /// In en, this message translates to:
  /// **'Portfolio Fee Summary'**
  String get portfolio_fee_summary;

  /// No description provided for @portfolio_fee_summary_prompt.
  ///
  /// In en, this message translates to:
  /// **'Based on the total value of your Individual account portfolio'**
  String get portfolio_fee_summary_prompt;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @promotions_earned.
  ///
  /// In en, this message translates to:
  /// **'Promotions Earned'**
  String get promotions_earned;

  /// No description provided for @property.
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get property;

  /// No description provided for @publicTransportation.
  ///
  /// In en, this message translates to:
  /// **'Public Transportation'**
  String get publicTransportation;

  /// No description provided for @q_0.
  ///
  /// In en, this message translates to:
  /// **'How does 1Long think about diversification?'**
  String get q_0;

  /// No description provided for @q_1.
  ///
  /// In en, this message translates to:
  /// **'How do I diversify my portfolio into other strategies?'**
  String get q_1;

  /// No description provided for @q_2.
  ///
  /// In en, this message translates to:
  /// **'Are my funds insured?'**
  String get q_2;

  /// No description provided for @q_3.
  ///
  /// In en, this message translates to:
  /// **'How do 1Long fees work?'**
  String get q_3;

  /// No description provided for @reason_1.
  ///
  /// In en, this message translates to:
  /// **'Changing Overall Strategy'**
  String get reason_1;

  /// No description provided for @reason_2.
  ///
  /// In en, this message translates to:
  /// **'Unhappy with 1Long Performance'**
  String get reason_2;

  /// No description provided for @reason_3.
  ///
  /// In en, this message translates to:
  /// **'Want to invest using a different product'**
  String get reason_3;

  /// No description provided for @reason_4.
  ///
  /// In en, this message translates to:
  /// **'I need more liquid assets'**
  String get reason_4;

  /// No description provided for @reason_for_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Reason for Withdrawal'**
  String get reason_for_withdrawal;

  /// No description provided for @rebalances.
  ///
  /// In en, this message translates to:
  /// **'Rebalances'**
  String get rebalances;

  /// No description provided for @receiver_name.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get receiver_name;

  /// No description provided for @recent_trades.
  ///
  /// In en, this message translates to:
  /// **'Recent Trades'**
  String get recent_trades;

  /// No description provided for @recent_transactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recent_transactions;

  /// No description provided for @reduce_risk.
  ///
  /// In en, this message translates to:
  /// **'✔️ Reduce overall portfolio risk'**
  String get reduce_risk;

  /// No description provided for @referral.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get referral;

  /// No description provided for @referral_code.
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get referral_code;

  /// No description provided for @registrationOrLicense.
  ///
  /// In en, this message translates to:
  /// **'Registration / Licenses'**
  String get registrationOrLicense;

  /// No description provided for @regular_deposit.
  ///
  /// In en, this message translates to:
  /// **'Regular Deposit'**
  String get regular_deposit;

  /// No description provided for @regular_deposit_prompt.
  ///
  /// In en, this message translates to:
  /// **'Deposits an amount into your account.'**
  String get regular_deposit_prompt;

  /// No description provided for @rentalVehicles.
  ///
  /// In en, this message translates to:
  /// **'Rental Vehicles'**
  String get rentalVehicles;

  /// No description provided for @repairOrMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Repair / Maintenance'**
  String get repairOrMaintenance;

  /// No description provided for @repeats_on.
  ///
  /// In en, this message translates to:
  /// **''**
  String get repeats_on;

  /// No description provided for @research.
  ///
  /// In en, this message translates to:
  /// **'Research'**
  String get research;

  /// No description provided for @retirement_planning.
  ///
  /// In en, this message translates to:
  /// **'Retirement Planning'**
  String get retirement_planning;

  /// No description provided for @retirement_planning_prompt.
  ///
  /// In en, this message translates to:
  /// **'Get a personalized portfolio to fit your retirement goals.'**
  String get retirement_planning_prompt;

  /// No description provided for @return_all_time.
  ///
  /// In en, this message translates to:
  /// **'Return (all-time)'**
  String get return_all_time;

  /// No description provided for @return_home.
  ///
  /// In en, this message translates to:
  /// **'Return Home'**
  String get return_home;

  /// No description provided for @rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewards;

  /// No description provided for @roll_over.
  ///
  /// In en, this message translates to:
  /// **'Roll Over'**
  String get roll_over;

  /// No description provided for @roll_over_prompt.
  ///
  /// In en, this message translates to:
  /// **'Move funds from external retirement accounts'**
  String get roll_over_prompt;

  /// No description provided for @rollovers.
  ///
  /// In en, this message translates to:
  /// **'Roll Overs'**
  String get rollovers;

  /// No description provided for @roth_ira.
  ///
  /// In en, this message translates to:
  /// **'Roth IRA'**
  String get roth_ira;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary / Wages'**
  String get salary;

  /// No description provided for @salonOrBarber.
  ///
  /// In en, this message translates to:
  /// **'Salon / Barber'**
  String get salonOrBarber;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @save_success.
  ///
  /// In en, this message translates to:
  /// **'Save success'**
  String get save_success;

  /// No description provided for @savings_q_1.
  ///
  /// In en, this message translates to:
  /// **'What is 1Long\'s high-yield savings product?'**
  String get savings_q_1;

  /// No description provided for @savings_q_1_answer.
  ///
  /// In en, this message translates to:
  /// **'1Safe is 1Long\'s structured financial product. 1Long allocates customer funds to various currency products with different terms and profits to provide the best possible returns for customers.'**
  String get savings_q_1_answer;

  /// No description provided for @savings_q_2.
  ///
  /// In en, this message translates to:
  /// **'How is the profit for this product calculated?'**
  String get savings_q_2;

  /// No description provided for @savings_q_2_answer.
  ///
  /// In en, this message translates to:
  /// **'The profit customers receive is compound interest over one year. This profit does not include a 5% tax on the profit amount. For example: \n\n\n\nCustomer accumulates 100 million VND.\n\nAfter one day, the total accumulated amount is 100,018,538.33 VND, including 18,538.33 VND in interest.\n\nAfter two days, the total accumulated amount is 100,037,080.11 VND, including 37,080.11 VND in interest.\n\n...\n\n\n\nAfter one year, the total accumulated amount is 107,000,000.00 VND, including 7,000,000.00 VND in interest.\n\n\n\nIf the customer withdraws the interest amount, the actual interest received by the customer is 6,650,000.00 VND after deducting a 5% tax on the 7,000,000.00 VND interest.'**
  String get savings_q_2_answer;

  /// No description provided for @savings_q_3.
  ///
  /// In en, this message translates to:
  /// **'When can I withdraw money?'**
  String get savings_q_3;

  /// No description provided for @savings_q_3_answer.
  ///
  /// In en, this message translates to:
  /// **'Customers can withdraw money from 9 AM to 3 PM on working days. In case a customer withdraws money outside the mentioned time frame, the transfer will be processed at 9 AM on the nearest working day.'**
  String get savings_q_3_answer;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @send_feedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get send_feedback;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @setup_smart_transfer.
  ///
  /// In en, this message translates to:
  /// **'Set Up Smart Transfer'**
  String get setup_smart_transfer;

  /// No description provided for @share_1long.
  ///
  /// In en, this message translates to:
  /// **'Share 1Long, Get Rewarded'**
  String get share_1long;

  /// No description provided for @share_personal_prompt.
  ///
  /// In en, this message translates to:
  /// **'Send your link to a friend who\'s interested in Smart Cash'**
  String get share_personal_prompt;

  /// No description provided for @share_personal_title.
  ///
  /// In en, this message translates to:
  /// **'Share your personal link'**
  String get share_personal_title;

  /// No description provided for @share_prompt.
  ///
  /// In en, this message translates to:
  /// **'Enjoying 1Long? Your friends will too. For every referral, we\'ll give you a \$50 Smart Cash bonus.'**
  String get share_prompt;

  /// No description provided for @shared.
  ///
  /// In en, this message translates to:
  /// **'Shared'**
  String get shared;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get sign_out;

  /// No description provided for @size_as_of.
  ///
  /// In en, this message translates to:
  /// **'Size as of '**
  String get size_as_of;

  /// No description provided for @size_in_strategy.
  ///
  /// In en, this message translates to:
  /// **'Size of holding in strategy'**
  String get size_in_strategy;

  /// No description provided for @smart_cash.
  ///
  /// In en, this message translates to:
  /// **'Smart Cash'**
  String get smart_cash;

  /// No description provided for @smart_cash_prompt.
  ///
  /// In en, this message translates to:
  /// **'Keep more of what you earn. We\'ll automatically move your money to the highest yielding cash holding on 1Long based on your tax situation.'**
  String get smart_cash_prompt;

  /// No description provided for @smart_transfer.
  ///
  /// In en, this message translates to:
  /// **'Smart Transfers'**
  String get smart_transfer;

  /// No description provided for @smart_transfer_prompt.
  ///
  /// In en, this message translates to:
  /// **'This is the amount above which 1Long will begin withdrawing from your connected bank and depositing into Smart Cash'**
  String get smart_transfer_prompt;

  /// No description provided for @smart_transfer_summary.
  ///
  /// In en, this message translates to:
  /// **'Smart Transfer Summary'**
  String get smart_transfer_summary;

  /// No description provided for @smart_transfers_help.
  ///
  /// In en, this message translates to:
  /// **''**
  String get smart_transfers_help;

  /// No description provided for @sort_holdings_by.
  ///
  /// In en, this message translates to:
  /// **'Sort Holdings By'**
  String get sort_holdings_by;

  /// No description provided for @souvenirs.
  ///
  /// In en, this message translates to:
  /// **'Souvenirs'**
  String get souvenirs;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @spending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get spending;

  /// No description provided for @spic_insured.
  ///
  /// In en, this message translates to:
  /// **'SPIC Insured >'**
  String get spic_insured;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @statement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statement;

  /// No description provided for @statements.
  ///
  /// In en, this message translates to:
  /// **'Statements'**
  String get statements;

  /// No description provided for @stock_restrictions.
  ///
  /// In en, this message translates to:
  /// **'Stock Restrictions'**
  String get stock_restrictions;

  /// No description provided for @stock_restrictions_prompt.
  ///
  /// In en, this message translates to:
  /// **'Enter symbols of stocks to restrict from trading'**
  String get stock_restrictions_prompt;

  /// No description provided for @stocks.
  ///
  /// In en, this message translates to:
  /// **'Stocks'**
  String get stocks;

  /// No description provided for @strategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get strategy;

  /// No description provided for @strategy_expenses.
  ///
  /// In en, this message translates to:
  /// **'Strategy Expenses'**
  String get strategy_expenses;

  /// No description provided for @strategy_performance.
  ///
  /// In en, this message translates to:
  /// **'Strategy Performance'**
  String get strategy_performance;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @submit_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Submit Withdrawal'**
  String get submit_withdrawal;

  /// No description provided for @supplements.
  ///
  /// In en, this message translates to:
  /// **'Supplements'**
  String get supplements;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @tax_reporting.
  ///
  /// In en, this message translates to:
  /// **'Tax Reporting'**
  String get tax_reporting;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get taxes;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @text_message.
  ///
  /// In en, this message translates to:
  /// **'Text Message(SMS)'**
  String get text_message;

  /// No description provided for @text_message_prompt.
  ///
  /// In en, this message translates to:
  /// **'Edit your phone number used for SMS verification'**
  String get text_message_prompt;

  /// No description provided for @three_four_days.
  ///
  /// In en, this message translates to:
  /// **'3-4 Days'**
  String get three_four_days;

  /// No description provided for @time_horizon.
  ///
  /// In en, this message translates to:
  /// **'Time Horizon'**
  String get time_horizon;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @to_transfer_prompt.
  ///
  /// In en, this message translates to:
  /// **'To deposit please transfer from your account to one of the following accounts'**
  String get to_transfer_prompt;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @toggle_theme.
  ///
  /// In en, this message translates to:
  /// **'Toggle Theme'**
  String get toggle_theme;

  /// No description provided for @total_deposit.
  ///
  /// In en, this message translates to:
  /// **'Total Deposit'**
  String get total_deposit;

  /// No description provided for @total_invested.
  ///
  /// In en, this message translates to:
  /// **'Total Invested'**
  String get total_invested;

  /// No description provided for @total_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Total Withdrawal'**
  String get total_withdrawal;

  /// No description provided for @trade_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Trade Confirmation'**
  String get trade_confirmation;

  /// No description provided for @trade_confirmations.
  ///
  /// In en, this message translates to:
  /// **'Trade Confirmations'**
  String get trade_confirmations;

  /// No description provided for @traditional_ira.
  ///
  /// In en, this message translates to:
  /// **'Traditional IRA'**
  String get traditional_ira;

  /// No description provided for @transaction_details.
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get transaction_details;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @transfer_advice.
  ///
  /// In en, this message translates to:
  /// **'Please transfer to the account number above including the content/description to ensure the confirmation process is expedited.'**
  String get transfer_advice;

  /// No description provided for @transfer_amount.
  ///
  /// In en, this message translates to:
  /// **'Transfer Amount'**
  String get transfer_amount;

  /// No description provided for @transfer_content.
  ///
  /// In en, this message translates to:
  /// **'Transfer Content'**
  String get transfer_content;

  /// No description provided for @transfer_history_empty.
  ///
  /// In en, this message translates to:
  /// **'Your transfer history will appear here.'**
  String get transfer_history_empty;

  /// No description provided for @transfer_money.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer_money;

  /// No description provided for @transport.
  ///
  /// In en, this message translates to:
  /// **'Transportation'**
  String get transport;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @uploads.
  ///
  /// In en, this message translates to:
  /// **'Uploads'**
  String get uploads;

  /// No description provided for @utilities.
  ///
  /// In en, this message translates to:
  /// **'Utilities'**
  String get utilities;

  /// No description provided for @vacation.
  ///
  /// In en, this message translates to:
  /// **'Vacation'**
  String get vacation;

  /// No description provided for @veterinarian.
  ///
  /// In en, this message translates to:
  /// **'Veterinarian'**
  String get veterinarian;

  /// No description provided for @vietnamese.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get vietnamese;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// No description provided for @view_disclosures.
  ///
  /// In en, this message translates to:
  /// **'View Disclosures'**
  String get view_disclosures;

  /// No description provided for @view_strategies.
  ///
  /// In en, this message translates to:
  /// **'View Strategies'**
  String get view_strategies;

  /// No description provided for @view_terms.
  ///
  /// In en, this message translates to:
  /// **'View Terms'**
  String get view_terms;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @weighting.
  ///
  /// In en, this message translates to:
  /// **'Weighting'**
  String get weighting;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcomes you'**
  String get welcome;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, '**
  String get welcome_back;

  /// No description provided for @which_style_deposit.
  ///
  /// In en, this message translates to:
  /// **'Which style of deposit are you looking for?'**
  String get which_style_deposit;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @withdraw_prompt.
  ///
  /// In en, this message translates to:
  /// **'Move funds out of Strategies'**
  String get withdraw_prompt;

  /// No description provided for @withdrawal__received_account_desc.
  ///
  /// In en, this message translates to:
  /// **'Please select the account you would like to receive your withdrawal'**
  String get withdrawal__received_account_desc;

  /// No description provided for @withdrawal__received_account_label.
  ///
  /// In en, this message translates to:
  /// **'Received Account'**
  String get withdrawal__received_account_label;

  /// No description provided for @withdrawal__request_success.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal request submitted successfully.'**
  String get withdrawal__request_success;

  /// No description provided for @withdrawal_amount.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Amount'**
  String get withdrawal_amount;

  /// No description provided for @withdrawal_code.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Code'**
  String get withdrawal_code;

  /// No description provided for @withdrawal_destination.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Destination'**
  String get withdrawal_destination;

  /// No description provided for @withdrawal_success.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Success'**
  String get withdrawal_success;

  /// No description provided for @withdrawal_to.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal To'**
  String get withdrawal_to;

  /// No description provided for @withdrawals.
  ///
  /// In en, this message translates to:
  /// **'Withdrawals'**
  String get withdrawals;

  /// No description provided for @world.
  ///
  /// In en, this message translates to:
  /// **'world'**
  String get world;

  /// No description provided for @year_to_date.
  ///
  /// In en, this message translates to:
  /// **'Year-to-date'**
  String get year_to_date;

  /// No description provided for @years_experience.
  ///
  /// In en, this message translates to:
  /// **'Years of Experience'**
  String get years_experience;

  /// No description provided for @you_dont_have.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any documents shared with you at this moment.'**
  String get you_dont_have;

  /// No description provided for @your_assets.
  ///
  /// In en, this message translates to:
  /// **'Your Assets'**
  String get your_assets;

  /// No description provided for @your_balance.
  ///
  /// In en, this message translates to:
  /// **'Your Balance'**
  String get your_balance;

  /// No description provided for @your_capital.
  ///
  /// In en, this message translates to:
  /// **'Your Capital'**
  String get your_capital;

  /// No description provided for @ytd.
  ///
  /// In en, this message translates to:
  /// **'Year To Date'**
  String get ytd;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
