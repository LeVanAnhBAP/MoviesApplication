import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/presentation/navigation/navigation.dart';
import 'package:movies_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/presentation/widgets/custom_button.dart';
import 'package:movies_app/presentation/widgets/custom_text_field.dart';
import 'package:movies_app/presentation/widgets/divider_line.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Sign in',
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
      children: [
        _buildEmail(),
        const SizedBox(
          height: 16,
        ),
        _buildPassword(),
        const SizedBox(
          height: 8,
        ),
        _buildForgotPassword(context),
        const SizedBox(
          height: 32,
        ),
        _buildButtonLogin(),
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
        _buildButtonSignUp(),
      ],
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

  Widget _buildForgotPassword(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const ForgotPasswordRoute());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Text(
          'Forgot Password',
          textAlign: TextAlign.right,
          style: context.typographies.caption1.copyWith(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Sign in',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {},
        width: double.infinity,
      ),
    );
  }

  Widget _buildButtonSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Create an account',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {
          context.router.push(const SignupRoute());
        },
        background: Colors.black38,
        width: double.infinity,
      ),
    );
  }
}
