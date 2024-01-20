import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/login/domain/login_provider.dart';
import 'package:testing_model/login/interface/login_page.dart';

class LoginInjection {
  LoginInjection._();

  static Widget injection() {
    return ListenableProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: const LoginPage(),
    );
  }
}
