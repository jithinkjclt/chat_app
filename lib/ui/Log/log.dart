import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../combonents/My_button.dart';
import '../../combonents/textFromFiled.dart';
import 'log_cubit.dart';

class log extends StatelessWidget {
  log({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LogCubit(context),
          child: BlocBuilder<LogCubit, LogState>(
            builder: (context, state) {
              final cubit = context.read<LogCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/Screenshot 2024-04-24 131346.png")),
                      ),
                      height: 100,
                      width: 100),
                  const SizedBox(
                    height: 50,
                  ),
                  cubit.flag
                      ? const SizedBox(
                          height: 5,
                        )
                      : textFrom(
                          hint: 'Name',
                          controller: cubit.namectr,
                          time: cubit.flag ? 500 : 900,
                          pad: cubit.flag ? 28 : 50,
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  textFrom(
                    hint: 'email',
                    controller: cubit.userctr,
                    time: cubit.flag ? 500 : 900,
                    pad: cubit.flag ? 28 : 50,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  textFrom(
                    hint: 'Password',
                    controller: cubit.passctr,
                    time: cubit.flag ? 500 : 900,
                    pad: cubit.flag ? 28 : 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  cubit.flag == true
                      ? InkWell(
                          onTap: () {
                            cubit.login();
                          },
                          child: button(
                            radi: cubit.flag ? 5 : 50,
                            text: 'Login',
                            color: cubit.flag
                                ? const Color(0xFFeb009b)
                                : const Color(0xFFa0039e),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            cubit.registor();
                          },
                          child: button(
                            text: 'Registor',
                            color: cubit.flag
                                ? const Color(0xFFeb009b)
                                : const Color(0xFFa0039e),
                            radi: cubit.flag ? 5 : 50,
                          ),
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
                                style: TextStyle(color: Color(0xFFeb009b)),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                cubit.regi();
                              },
                              child: const Text(
                                "Login ",
                                style: TextStyle(color: Color(0xFFeb009b)),
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
