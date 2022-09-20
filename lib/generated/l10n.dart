// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Outlet`
  String get appName {
    return Intl.message(
      'Outlet',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Be on alert`
  String get beOnAlert {
    return Intl.message(
      'Be on alert',
      name: 'beOnAlert',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive code `
  String get didNtReceiveCode {
    return Intl.message(
      'Didn’t receive code ',
      name: 'didNtReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Please Provide Your Full Name`
  String get provideFullName {
    return Intl.message(
      'Please Provide Your Full Name',
      name: 'provideFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get conTinue {
    return Intl.message(
      'Continue',
      name: 'conTinue',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the `
  String get iAgreeToThe {
    return Intl.message(
      'I agree to the ',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get termsOfService {
    return Intl.message(
      'Terms of service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `and how data `
  String get andHowData {
    return Intl.message(
      'and how data ',
      name: 'andHowData',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Get Support`
  String get getSupport {
    return Intl.message(
      'Get Support',
      name: 'getSupport',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Select gender`
  String get selectGender {
    return Intl.message(
      'Select gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `required`
  String get required {
    return Intl.message(
      'required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Report Bug`
  String get reportBug {
    return Intl.message(
      'Report Bug',
      name: 'reportBug',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `text`
  String get text {
    return Intl.message(
      'text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `image`
  String get image {
    return Intl.message(
      'image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `video`
  String get video {
    return Intl.message(
      'video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `audio`
  String get audio {
    return Intl.message(
      'audio',
      name: 'audio',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get loading {
    return Intl.message(
      'Loading ...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred please try again!`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred please try again!',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the Terms and conditions`
  String get pleaseAcceptTnC {
    return Intl.message(
      'Please accept the Terms and conditions',
      name: 'pleaseAcceptTnC',
      desc: '',
      args: [],
    );
  }

  /// `Please select gender`
  String get pleaseSelectGender {
    return Intl.message(
      'Please select gender',
      name: 'pleaseSelectGender',
      desc: '',
      args: [],
    );
  }

  /// `You have not made any post`
  String get youHaveNotPosted {
    return Intl.message(
      'You have not made any post',
      name: 'youHaveNotPosted',
      desc: '',
      args: [],
    );
  }

  /// `My Posts`
  String get myPosts {
    return Intl.message(
      'My Posts',
      name: 'myPosts',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get lastLogin {
    return Intl.message(
      'Last Login',
      name: 'lastLogin',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get resume {
    return Intl.message(
      'Resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `In progress cases`
  String get inProgressCases {
    return Intl.message(
      'In progress cases',
      name: 'inProgressCases',
      desc: '',
      args: [],
    );
  }

  /// `Resolved cases`
  String get resolvedCases {
    return Intl.message(
      'Resolved cases',
      name: 'resolvedCases',
      desc: '',
      args: [],
    );
  }

  /// `Please grant access to microphone to record an audio`
  String get pleaseGrantMicAccess {
    return Intl.message(
      'Please grant access to microphone to record an audio',
      name: 'pleaseGrantMicAccess',
      desc: '',
      args: [],
    );
  }

  /// `Uploading audio ...`
  String get uploadingAudio {
    return Intl.message(
      'Uploading audio ...',
      name: 'uploadingAudio',
      desc: '',
      args: [],
    );
  }

  /// `Finishing up ...`
  String get finishingUp {
    return Intl.message(
      'Finishing up ...',
      name: 'finishingUp',
      desc: '',
      args: [],
    );
  }

  /// `Image loading failed`
  String get imageLoadingFailed {
    return Intl.message(
      'Image loading failed',
      name: 'imageLoadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `show more`
  String get showMore {
    return Intl.message(
      'show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `show less`
  String get showLess {
    return Intl.message(
      'show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet`
  String get pleaseCheckYourInternet {
    return Intl.message(
      'Please check your internet',
      name: 'pleaseCheckYourInternet',
      desc: '',
      args: [],
    );
  }

  /// `Add Audio`
  String get addAudio {
    return Intl.message(
      'Add Audio',
      name: 'addAudio',
      desc: '',
      args: [],
    );
  }

  /// `okay`
  String get okay {
    return Intl.message(
      'okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Use this`
  String get useThis {
    return Intl.message(
      'Use this',
      name: 'useThis',
      desc: '',
      args: [],
    );
  }

  /// `Video recording paused!`
  String get recordingPaused {
    return Intl.message(
      'Video recording paused!',
      name: 'recordingPaused',
      desc: '',
      args: [],
    );
  }

  /// `Video recording resumed`
  String get recordingResumed {
    return Intl.message(
      'Video recording resumed',
      name: 'recordingResumed',
      desc: '',
      args: [],
    );
  }

  /// `Video recording ended`
  String get recordingEnd {
    return Intl.message(
      'Video recording ended',
      name: 'recordingEnd',
      desc: '',
      args: [],
    );
  }

  /// `Video recording in progress`
  String get recordingInProgress {
    return Intl.message(
      'Video recording in progress',
      name: 'recordingInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Tap to record`
  String get tapToRecord {
    return Intl.message(
      'Tap to record',
      name: 'tapToRecord',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Allow Permission`
  String get allowPermission {
    return Intl.message(
      'Allow Permission',
      name: 'allowPermission',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
