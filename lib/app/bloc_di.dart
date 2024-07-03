import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/feature/poke_detail/presentation/bloc/poke_detail_cubit.dart';
import 'package:app/feature/poke_detail/presentation/bloc/poke_heart_cubit.dart';
import 'package:app/feature/poke_detail/presentation/bloc/switch_detail_cubit.dart';
import 'package:app/feature/poke_list/presentation/bloc/poke_list_cubit.dart';
import 'package:app/app/di.dart' as di;

class BlocDI extends StatelessWidget {
  const BlocDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokeListCubit>(create: (_) => di.sl<PokeListCubit>()),
        BlocProvider<PokeDetailCubit>(create: (_) => di.sl<PokeDetailCubit>()),
        BlocProvider<SwitchDetailCubit>(create: (_) => SwitchDetailCubit()),
        BlocProvider<PokeHeartCubit>(create: (_) => PokeHeartCubit()),
      ],
      child: child,
    );
  }
}
