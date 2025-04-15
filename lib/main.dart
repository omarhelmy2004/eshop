import 'package:eshop/core/presentation/widgets/main_view.dart';
import 'package:eshop/features/account/presentation/pages/profile_page.dart';
import 'package:eshop/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:eshop/features/auth/presentation/cubits/register_cubit/register_cubit_cubit.dart';
import 'package:eshop/features/auth/presentation/pages/login_page.dart';
import 'package:eshop/features/auth/presentation/pages/signup_page.dart';
import 'package:eshop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Eshop());
}

class Eshop extends StatelessWidget {
  const Eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
       
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubitCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          SignupPage.id: (context) => const SignupPage(),
          MainView.id: (context) => const MainView(),
          ProfilePage.id: (context) => const ProfilePage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
