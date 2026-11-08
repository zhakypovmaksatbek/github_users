import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/di/injection.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_state.dart';
import 'package:github_users/features/users/presentation/widgets/user_detail_view.dart';

@RoutePage(name: "UserDetailRoute")
class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<UserDetailBloc>()..add(UserDetailRequested(user.login)),
      child: BlocListener<ConnectivityCubit, bool>(
        listenWhen: (prev, curr) => !prev && curr,
        listener: (context, _) {
          final bloc = context.read<UserDetailBloc>();
          if (bloc.state is UserDetailError) {
            bloc.add(UserDetailRequested(user.login));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(user.login)),
          body: UserDetailView(user: user),
        ),
      ),
    );
  }
}
