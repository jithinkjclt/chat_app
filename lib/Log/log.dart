import 'package:chat_app/Log/log_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../combonents/My_button.dart';
import '../combonents/textFromFiled.dart';

class log extends StatelessWidget {
  log({super.key});

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LogCubit(),
          child: BlocBuilder<LogCubit, LogState>(
            builder: (context, state) {
              final cubit = context.read<LogCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.message,
                    color: Colors.black12,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  textFrom(
                    hint: 'email',
                    pri: cubit.change,
                    controller: emailCtr,
                    onTap: () {
                      cubit.chanager();
                    },
                    time: cubit.flag ? 500 : 900,
                    pad: cubit.flag ? 28 : 50,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  textFrom(
                    hint: 'Password',
                    pri: cubit.flag,
                    controller: passCtr,
                    onTap: () {
                      cubit.chanager();
                    },
                    time: cubit.flag ? 500 : 900,
                    pad: cubit.flag ? 28 : 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  cubit.flag == true
                      ? button(
                          radi: cubit.flag ? 5 : 50,
                          text: 'Login',
                          color: cubit.flag
                              ? Colors.blueAccent
                              : Colors.greenAccent,
                        )
                      : button(
                          text: 'Registor',
                          color: cubit.flag
                              ? Colors.blueAccent
                              : Colors.greenAccent,
                          radi: cubit.flag ? 5 : 50,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cubit.flag == true
                          ? const Text("Not a member? ")
                          : const Text("Already have a account"),
                      cubit.flag == true
                          ? InkWell(
                              onTap: () {
                                cubit.log();
                              },
                              child: const Text(
                                "Registor ",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                cubit.regi();
                              },
                              child: const Text(
                                "Login ",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
