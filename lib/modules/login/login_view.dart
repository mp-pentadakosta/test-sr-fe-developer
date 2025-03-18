import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/container_scaffold.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/button_widget/button_widget.dart';
import '../../widgets/image_widget.dart';
import '../../widgets/text_field_widget/text_field_widget.dart';
import 'login_cubit.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  static const routeName = 'login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: _LoginContent(),
    );
  }
}

class _LoginContent extends StatelessWidget {
  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isLoginSuccess) {
          // context.replace('/${HomeView.routeName}');
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return ContainerScaffold(
            loading: state.isLoading,
            child: SingleChildScrollView(
              child: SizedBox(
                width: context.mQWidth(1),
                height: context.mQHeight(1),
                child: Stack(
                  children: [
                    SizedBox(
                      width: context.mQWidth(1),
                      height: context.mQHeight(1),
                      child: Column(
                        children: [
                          ImageWidget(
                            image: 'assets/img/login.png',
                            width: context.mQWidth(1),
                            height: context.mQHeight(0.4),
                          ),
                          Container(
                            width: context.mQWidth(1),
                            height: context.mQHeight(0.6),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: context.mQHeight(0.67),
                        width: context.mQWidth(1),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.padding3,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: context.mQWidth(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(40),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(context.padding2),
                              child: Column(
                                children: [
                                  Text('Selamat Datang',
                                      style: context.headlineMedium),
                                  SizedBox(height: context.padding2),
                                  Text(
                                    'Terimakasih telah menggunakan layanan mobile CU Sinar Mulia Sejahtera',
                                    style: context.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.padding4),
                            ITextField.primary(
                              label: 'User ID',
                              controller: _usernameController,
                            ),
                            SizedBox(height: context.padding2),
                            ITextField.password(
                              label: 'Password',
                              controller: _passwordController,
                              obscureText: !state.isShowPassword,
                              suffixIcon: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  context.read<LoginCubit>().showPassword();
                                },
                                child: !state.isShowPassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                            SizedBox(height: context.padding0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: context.padding0),
                                    Text(
                                      'Simpan nomor anggota',
                                      style: context.bodyMedium?.copyWith(
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Forgot Password?',
                                  style: context.bodyMedium?.copyWith(
                                    color: AppColors.secondary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.padding6),
                            IButton.elevated(
                              label: 'Login',
                              onPressed: () {
                                context.read<LoginCubit>().login(
                                    // LoginParam(
                                    //   username: _usernameController.text,
                                    //   password: _passwordController.text,
                                    // ),
                                    );
                              },
                            ),
                            SizedBox(height: context.padding6),
                            RichText(
                                text: TextSpan(
                              text: 'Belum punya akun? ',
                              style: context.bodyMedium,
                              children: [
                                TextSpan(
                                  text: 'Daftar di sini',
                                  style: context.bodyMedium?.copyWith(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         SizedBox(height: context.iPadding.top),
                    //         const ImageWidget(
                    //           height: 100,
                    //           width: 100,
                    //           image: 'assets/img/logo.png',
                    //         ),
                    //         SizedBox(height: context.iPadding.top),
                    //         Text(
                    //           'Welcome back to your favorite app! Keep reading your favorite comics.',
                    //           style: context.headlineMedium?.copyWith(
                    //             color: AppColors.secondary,
                    //           ),
                    //         ),
                    // SizedBox(height: context.iPadding.top),
                    // ITextField.primary(
                    //   label: 'Username',
                    //   controller: _usernameController,
                    // ),
                    // ITextField.password(
                    //   label: 'Password',
                    //   controller: _passwordController,
                    //   obscureText: !state.isShowPassword,
                    //   suffixIcon: InkWell(
                    //     borderRadius: BorderRadius.circular(16),
                    //     onTap: () {
                    //       context.read<LoginCubit>().showPassword();
                    //     },
                    //     child: !state.isShowPassword
                    //         ? const Icon(Icons.visibility)
                    //         : const Icon(Icons.visibility_off),
                    //   ),
                    // ),
                    //   ],
                    // ),
                    // ),
                    // ),
                    // ButtonWidget.primary(
                    //   text: "Login",
                    //   onPressed: () {
                    //     context.read<LoginCubit>().login(
                    //         // LoginParam(
                    //         //   username: _usernameController.text,
                    //         //   password: _passwordController.text,
                    //         // ),
                    //         );
                    //   },
                    // ),
                    // SizedBox(
                    //   height: context.iPadding.bottom != 0
                    //       ? context.iPadding.bottom
                    //       : context.iPadding.top,
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
