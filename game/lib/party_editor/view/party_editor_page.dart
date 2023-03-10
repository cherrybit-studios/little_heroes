import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_heroes/party_editor/party_editor.dart';

class PartyEditorPage extends StatelessWidget {
  const PartyEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartyCubit(),
      child: const PartyEditorView(),
    );
  }
}
