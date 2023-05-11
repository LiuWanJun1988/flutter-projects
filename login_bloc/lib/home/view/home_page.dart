import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/authentication/bloc/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                        (AuthenticationBloc bloc) =>bloc.state.user.id
                );
                return Text('UserId: $userId');
              },
            ),
            ElevatedButton(child: const Text('Logout'),
              onPressed: () {
                context.
                read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },)
          ],
        ),
      ),
    );
  }
}
