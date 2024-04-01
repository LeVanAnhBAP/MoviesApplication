import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/presentation/widgets/custom_button.dart';
import 'package:movies_app/presentation/widgets/custom_text_field.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage();

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Forgot password',
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
        _buildTitle(),
        const SizedBox(
          height: 8,
        ),
        _buildEmail(),
        const SizedBox(
          height: 16,
        ),
        _buildButtonResetPassword(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        'Enter the email address associated with your account',
        textAlign: TextAlign.left,
        style: context.typographies.title3Bold.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _buildEmail() {
    return TextFieldInputText(
      fillColor: const Color(0xFFF7F8FA),
      placeHolder: 'Your email',
      obscureText: false,
      onChanged: (value) {},
    );
  }

  Widget _buildButtonResetPassword() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Continue',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {},
        width: double.infinity,
      ),
    );
  }
}
