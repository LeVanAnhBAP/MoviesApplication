import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/presentation/widgets/custom_button.dart';
import 'package:movies_app/presentation/widgets/custom_text_field.dart';
import 'package:movies_app/presentation/widgets/divider_line.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage();

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Sign up',
        titleAlign: TextAlign.start,
        onBackPress: () {
          context.router.pop();
        },
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      children: [
        _buildFirstAndLastName(),
        const SizedBox(
          height: 16,
        ),
        _buildEmail(),
        const SizedBox(
          height: 16,
        ),
        _buildPassword(),
        const SizedBox(
          height: 8,
        ),
        _buildButtonCreateAccount(),
        const SizedBox(
          height: 8,
        ),
        const DividerLine(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildButtonBackSignIn(),
      ],
    );
  }

  Widget _buildFirstAndLastName() {
    return TextFieldInputText(
      fillColor: const Color(0xFFF7F8FA),
      placeHolder: 'First and last name',
      obscureText: false,
      onChanged: (value) {},
    );
  }

  Widget _buildEmail() {
    return TextFieldInputText(
      fillColor: const Color(0xFFF7F8FA),
      placeHolder: 'Email',
      obscureText: false,
      onChanged: (value) {},
    );
  }

  Widget _buildPassword() {
    return TextFieldInputText(
      fillColor: const Color(0xFFF7F8FA),
      placeHolder: 'Password',
      obscureText: true,
      onChanged: (value) {},
    );
  }

  Widget _buildButtonCreateAccount() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Create your account',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {},
        width: double.infinity,
      ),
    );
  }

  Widget _buildButtonBackSignIn() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Sign-In now',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {
          context.router.pop();
        },
        background: Colors.black38,
        width: double.infinity,
      ),
    );
  }
}
