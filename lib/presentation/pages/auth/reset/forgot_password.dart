import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/di/injector.dart';
import 'package:movies_app/presentation/pages/auth/auth_bloc.dart';
import 'package:movies_app/presentation/pages/auth/auth_event.dart';
import 'package:movies_app/presentation/pages/auth/auth_selector.dart';
import 'package:movies_app/presentation/pages/auth/auth_state.dart';
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
  final AuthBloc _bloc = provider.get<AuthBloc>();

  TextEditingController? _emailController;

  @override
  void initState() {
    _emailController = TextEditingController(text: null);
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: MultiBlocListener(
        listeners: [
          AuthStatusListener(
            statuses: const [
              AuthStatus.loading,
              AuthStatus.resetPasswordSuccess
            ],
            listener: (BuildContext context, AuthState state) {
              var status = state.status;
              if (status == AuthStatus.loading) {
              } else if (status == AuthStatus.resetPasswordSuccess) {
                context.router.pop();
              } else {}
            },
          )
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            appBarTitle: 'Forgot password',
            titleAlign: TextAlign.start,
            onBackPress: () {
              context.router.pop();
            },
          ),
          body: _buildBody(context),
        ),
      ),
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
      controller: _emailController,
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
        onPressed: () {
          if (_emailController != null) {
            _bloc.add(ResetPasswordStarted(_emailController!.text.toString()));
          }
        },
        width: double.infinity,
      ),
    );
  }
}
