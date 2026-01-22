// import 'package:flutter/material.dart';
// import 'package:version_manager_flutter/screens/main_screen.dart';
// import '../services/api_service.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _loginController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;
//   bool _obscurePassword = true;

//   @override
//   void dispose() {
//     _loginController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _handleLogin() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final login = _loginController.text;
//       final password = _passwordController.text;

//       final success = await ApiService.login(login, password);

//       if (mounted) {
//         if (success) {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Неверный логин или пароль'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Ошибка: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 400),
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(32.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Icon(
//                           Icons.lock_outline,
//                           size: 64,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         const SizedBox(height: 24),
//                         Text(
//                           'Version Manager',
//                           style: Theme.of(context).textTheme.headlineSmall
//                               ?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Вход в систему',
//                           style: Theme.of(context).textTheme.bodyMedium
//                               ?.copyWith(
//                                 color: Colors.grey[600],
//                               ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 32),
//                         TextFormField(
//                           controller: _loginController,
//                           decoration: const InputDecoration(
//                             labelText: 'Логин',
//                             prefixIcon: Icon(Icons.person_outline),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Введите логин';
//                             }
//                             return null;
//                           },
//                           enabled: !_isLoading,
//                         ),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: _passwordController,
//                           decoration: InputDecoration(
//                             labelText: 'Пароль',
//                             prefixIcon: const Icon(Icons.lock_outline),
//                             border: const OutlineInputBorder(),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscurePassword
//                                     ? Icons.visibility_outlined
//                                     : Icons.visibility_off_outlined,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscurePassword = !_obscurePassword;
//                                 });
//                               },
//                             ),
//                           ),
//                           obscureText: _obscurePassword,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Введите пароль';
//                             }
//                             return null;
//                           },
//                           enabled: !_isLoading,
//                           onFieldSubmitted: (_) => _handleLogin(),
//                         ),
//                         const SizedBox(height: 24),
//                         ElevatedButton(
//                           onPressed: _isLoading ? null : _handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: _isLoading
//                               ? const SizedBox(
//                                   height: 20,
//                                   width: 20,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                               : const Text(
//                                   'Войти',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
