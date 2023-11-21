import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/filters/filter_view.dart';
import 'package:flutter_riverpod_base/src/commons/views/help-center/help_center_view.dart';
import 'package:flutter_riverpod_base/src/commons/views/location_access/location_access_page.dart';
import 'package:flutter_riverpod_base/src/commons/views/notification/notification_view.dart';
import 'package:flutter_riverpod_base/src/commons/views/onboarding/on_boarding_page.dart';
import 'package:flutter_riverpod_base/src/commons/views/privacy-policy/privacy_policicy.dart';
import 'package:flutter_riverpod_base/src/commons/views/splash.dart';
import 'package:flutter_riverpod_base/src/feature/auth/login_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/sign_up_page.dart';
import 'package:flutter_riverpod_base/src/feature/booking/booking_view.dart';
import 'package:flutter_riverpod_base/src/feature/chat/chat_view.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/complete_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart';
import 'package:flutter_riverpod_base/src/feature/search_view/search_view.dart';
import 'package:flutter_riverpod_base/src/feature/settings/view/settings_view.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:go_router/go_router.dart';

import '../feature/booking/views/book_tour_view.dart';
import '../feature/booking/views/tour_request_view.dart';
import '../feature/home/near_by_studios_view.dart';
import '../feature/home/recomended_studios_view.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashView.routePath,
  routes: [
    GoRoute(
      path: NotificationView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return  NotificationView();
      },
    ),
    GoRoute(
      path: FilterView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const FilterView();
      },
    ),
    GoRoute(
      path: TourRequestView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const TourRequestView();
      },
    ),
    GoRoute(
      path: BookingTourView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const BookingTourView();
      },
    ),
    GoRoute(
      path: BookingView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const BookingView();
      },
    ),
    GoRoute(
      path: ChatView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return   ChatView(uid: "",);
      },
    ),
    GoRoute(
      path: PrivacyPolicyView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const PrivacyPolicyView();
      },
    ),
    GoRoute(
      path: SearchView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),
    GoRoute(
      path: HelpCenterView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const HelpCenterView();
      },
    ),
    GoRoute(
      path: SplashView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: OnBoardingPage.routePath,
      builder: (context, state) {
        return const OnBoardingPage();
      },
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: SignUpPage.routePath,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
    GoRoute(
      path: CompleteYourProfileInfoView.routePath,
      builder: (context, state) {
        return const CompleteYourProfileInfoView();
      },
    ),
    GoRoute(
      path: EditProfileInfoView.routePath,
      builder: (context, state) {
        return const EditProfileInfoView();
      },
    ),
    GoRoute(
      path: LocationAccessPage.routePath,
      builder: (context, state) {
        return const LocationAccessPage();
      },
    ),
    GoRoute(
      path: HomeView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: SettingsView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsView();
      },
    ),
    GoRoute(
      path: NearbyStudiosView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return NearbyStudiosView(studios: state.extra as List<StudioModel>);
      },
    ),
    GoRoute(
      path: RecommendedStudiosView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return RecommendedStudiosView(
            studios: state.extra as List<StudioModel>);
      },
    ),
  ],
);
