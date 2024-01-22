import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/sign_up/domain/sign_up_provider.dart';
import 'package:testing_model/sign_up/interface/sign_up_page.dart';

class SignUpInjection {
  SignUpInjection._();

  static Widget injection() {
    return ListenableProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
      child: SignUpPage(),
    );
  }
}
