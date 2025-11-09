import 'package:base_code_clean_arch_riverpod/core/extensions/error_extensions.dart';
import 'package:base_code_clean_arch_riverpod/core/widgets/custom_snackbar.dart';
import 'package:base_code_clean_arch_riverpod/core/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/register_provider.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final registerState = ref.watch(registerProvider);

    // Listen error
    ref.listen(registerProvider, (previous, next) {
      next.when(
        data: (_) {
          LoadingOverlay.hide(context);
          CustomSnackbar.success(
            context,
            'Register berhasil!',
            position: SnackbarPosition.top,
          );
        },
        loading: () {
          LoadingOverlay.show(context);
        },
        error: (error, _) {
          LoadingOverlay.hide(context);
          CustomSnackbar.error(
            context,
            error.toString(),
            position: SnackbarPosition.top,
            title: error.errorTitle,
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: registerState.isLoading
                    ? null
                    : () {
                        ref
                            .read(registerProvider.notifier)
                            .register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
