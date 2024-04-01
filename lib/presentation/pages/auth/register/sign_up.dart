import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';
import 'package:movies_app/di/injector.dart';
import 'package:movies_app/presentation/pages/auth/auth_bloc.dart';
import 'package:movies_app/presentation/pages/auth/auth_event.dart';
import 'package:movies_app/presentation/pages/auth/auth_selector.dart';
import 'package:movies_app/presentation/pages/auth/auth_state.dart';
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
  final AuthBloc _bloc = provider.get<AuthBloc>();

  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController(text: null);
    _passwordController = TextEditingController(text: null);
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: MultiBlocListener(
        listeners: [
          AuthStatusListener(
            statuses: const [AuthStatus.loading, AuthStatus.signupSuccess],
            listener: (BuildContext context, AuthState state) {
              var status = state.status;
              if (status == AuthStatus.loading) {
              } else if (status == AuthStatus.signupSuccess) {
                context.router.pop();
              } else {}
            },
          )
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            appBarTitle: 'Sign up',
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

  Widget _buildEmail() {
    return TextFieldInputText(
      controller: _emailController,
      fillColor: const Color(0xFFF7F8FA),
      placeHolder: 'Email',
      obscureText: false,
      onChanged: (value) {},
    );
  }

  Widget _buildPassword() {
    return TextFieldInputText(
      controller: _passwordController,
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
        onPressed: () {
          final params = UserRequestParams(
              email: _emailController!.text.toString(),
              password: _passwordController!.text.toString());
          _bloc.add(SignupStarted(params));
        },
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
