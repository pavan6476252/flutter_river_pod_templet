import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/location_access/location_access_page.dart';
import 'package:flutter_riverpod_base/src/commons/views/onboarding/on_boarding_page.dart';
import 'package:flutter_riverpod_base/src/commons/views/splash.dart';
import 'package:flutter_riverpod_base/src/feature/auth/login_page.dart';
import 'package:flutter_riverpod_base/src/feature/auth/sign_up_page.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/feature/profile/views/edit_profile_info.dart'; 
import 'package:flutter_riverpod_base/src/res/data.dart';
import 'package:go_router/go_router.dart';

import '../feature/home/near_by_studios_view.dart';
import '../feature/home/recomended_studios_view.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashView.routePath,
  routes: [
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
