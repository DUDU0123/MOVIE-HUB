import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';

BlocBuilder<AuthBloc, AuthState> proffessionSelectWidget() {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 50,
          width: screenWidth(context: context)/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<UserProffession>(
            elevation: 0,
            value: state.selectedProffession,
            hint: Text(
              state.selectedProffession != null
                  ? state.selectedProffession!.name
                  : "Select Profession",
            ),
            isExpanded: true,
            items: UserProffession.values.map((UserProffession profession) {
              return DropdownMenuItem<UserProffession>(
                value: profession,
                child: Text(
                  profession.name,
                ),
              );
            }).toList(),
            onChanged: (UserProffession? newValue) {
              context
                  .read<AuthBloc>()
                  .add(SelectProffessionEvent(selectedProffession: newValue));
            },
          ),
        ),
      );
    },
  );
}
