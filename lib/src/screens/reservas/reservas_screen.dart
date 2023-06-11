import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu Hora'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: const Center(
        child: Text('Reserva screen'),
      ),
    );
  }
}
