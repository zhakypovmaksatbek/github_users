import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/app/router/app_router.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_state.dart';
import 'package:github_users/features/users/presentation/widgets/pagination_footer.dart';
import 'package:github_users/features/users/presentation/widgets/user_list_tile.dart';

class UsersListBody extends StatefulWidget {
  const UsersListBody({super.key});

  @override
  State<UsersListBody> createState() => _UsersListBodyState();
}

class _UsersListBodyState extends State<UsersListBody> {
  static const _loadMoreThreshold = 300.0;

  var _retriedStaleOfflineError = false;

  void _retryStaleOfflineError() {
    final bloc = context.read<UsersBloc>();
    final state = bloc.state;
    if (_retriedStaleOfflineError || state.isLoadingMore) return;
    if (state.failure is! NoInternetFailure) return;
    if (!context.read<ConnectivityCubit>().state) return;

    _retriedStaleOfflineError = true;
    bloc.add(const UsersNextPageRequested(isRetry: true));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UsersBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<ConnectivityCubit, bool>(
          listenWhen: (prev, curr) => !prev && curr,
          listener: (context, _) {
            _retriedStaleOfflineError = false;
            _retryStaleOfflineError();
          },
        ),
        BlocListener<UsersBloc, UsersState>(
          listenWhen: (prev, curr) => prev.isLoadingMore && curr.hasPageError,
          listener: (context, _) => _retryStaleOfflineError(),
        ),
        BlocListener<UsersBloc, UsersState>(
          listenWhen: (prev, curr) =>
              prev.isLoadingMore && !curr.isLoadingMore && curr.failure == null,
          listener: (context, _) => _retriedStaleOfflineError = false,
        ),
      ],
      child: RefreshIndicator.adaptive(
        onRefresh: () {
          final completer = Completer<void>();
          bloc.add(UsersRefreshed(completer));
          return completer.future;
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.extentAfter >= _loadMoreThreshold) {
              return false;
            }

            final state = bloc.state;
            if (state.isLoadingMore || state.hasReachedMax) return false;

            if (state.failure is NoInternetFailure) {
              final online = context.read<ConnectivityCubit>().state;
              if (online && notification is ScrollEndNotification) {
                _retriedStaleOfflineError = false;
                _retryStaleOfflineError();
              }
              return false;
            }

            if (state.failure != null) return false;
            bloc.add(const UsersNextPageRequested());
            return false;
          },
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: state.users.length + 1, // +1: footer
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, indent: 80),
                itemBuilder: (context, index) {
                  if (index == state.users.length) {
                    return PaginationFooter(
                      isLoading: state.isLoadingMore,
                      failure: state.hasPageError ? state.failure : null,
                      onRetry: () =>
                          bloc.add(const UsersNextPageRequested(isRetry: true)),
                    );
                  }
                  final user = state.users[index];
                  return UserListTile(
                    user: user,
                    onTap: () =>
                        context.router.push(UserDetailRoute(user: user)),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
