import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:init_flutter/shared/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;

  void _login() async {
    final username = email.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    try {
      await ref.read(authProvider.notifier).login(username, password);

      if (!mounted) return;

      final user = ref.read(authProvider).value;

      if (user != null) {
        context.go('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login fallido: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authProvider);
    final isLoading = loginState is AsyncLoading;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text('Hey there,', style: TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            const Text('Welcome Back',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 22)),
            const SizedBox(height: 20),
            _buildInputField(
              iconPath: 'assets/icons/message.svg',
              hintText: 'Username or email',
              controller: email,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              iconPath: 'assets/icons/lock.svg',
              hintText: 'Password',
              controller: passwordController,
              obscureText: !_showPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xffADA4A5),
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            const Text('Forgot your password?',
                style: TextStyle(
                    color: Color(0xffADA4A5),
                    decoration: TextDecoration.underline)),
            const SizedBox(height: 200),
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff98BAFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/login.svg'),
                          const SizedBox(width: 10),
                          const Text("Login",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
            SvgPicture.asset('assets/icons/or.svg'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton('assets/icons/google.svg'),
                const SizedBox(width: 30),
                _buildSocialButton('assets/icons/facebook.svg'),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet? "),
                GestureDetector(
                  onTap: () => context.go('/createAccount'),
                  child: const Text("Register",
                      style: TextStyle(color: Color(0xffC58BF2))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String iconPath,
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter:
                const ColorFilter.mode(Color(0xff7B6F72), BlendMode.srcIn),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xffADA4A5)),
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return SizedBox(
      height: 55,
      width: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}
