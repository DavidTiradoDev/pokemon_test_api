import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:testing_model/home/home_injection.dart';
import 'package:testing_model/login/domain/login_provider.dart';
import 'package:testing_model/sign_up/sign_up_injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<LoginProvider>(context);
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.35,
              width: double.infinity,
              child: const FadeInImage(
                placeholder: NetworkImage(
                    'https://i.pinimg.com/736x/90/3c/e8/903ce82d065d12a760eeafe2aec9935a.jpg'),
                image: NetworkImage(
                    'https://i.pinimg.com/736x/90/3c/e8/903ce82d065d12a760eeafe2aec9935a.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'LOGIN',
                style: GoogleFonts.nunito(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: GoogleFonts.nunito(),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text(
                  'Contraseña',
                  style: GoogleFonts.nunito(),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                authProvider.signIn(email, password).then(
                  (success) {
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeInjection.injection(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al iniciar sesión'),
                        ),
                      );
                    }
                  },
                );
              },
              child: Text(
                'Entrar',
                style: GoogleFonts.nunito(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpInjection.injection(),
                  ),
                );
              },
              child: Text(
                'Registrar',
                style: GoogleFonts.nunito(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
