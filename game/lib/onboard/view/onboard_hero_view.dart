import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/widgets/hero_view.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class OnboardHeroView extends StatefulWidget {
  const OnboardHeroView({super.key});

  @override
  State<OnboardHeroView> createState() => _OnboardHeroViewState();
}

class _OnboardHeroViewState extends State<OnboardHeroView> {
  Body body = Body.human1;
  final nameController = TextEditingController();
  final List<String> errors = [];

  void _submit() {
    setState(errors.clear);
    if (nameController.text.isEmpty) {
      final error = context.l10n.nameIsRequired;

      setState(() {
        errors.add(error);
      });
    } else {
      final hero = Hero(
        id: null,
        body: body,
        name: nameController.text,
        attributes: const Attributes.empty(),
        outfit: Outfit.villager,
        shield: null,
        weapon: null,
        captain: true,
      );

      Navigator.of(context).push(
        OnboardAttributesSelectionPage.route(hero),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GameScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScrollContainer(
              child: Text(l10n.onboardingFormStep1),
            ),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  HeroView(
                    alignment: Alignment.bottomCenter,
                    selectedHero: Hero(
                      id: null,
                      body: body,
                      name: nameController.text,
                      attributes: const Attributes.empty(),
                      outfit: Outfit.villager,
                      shield: null,
                      weapon: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(l10n.name),
                      errorText: errors.isEmpty ? null : errors.join(','),
                    ),
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  NesIterableOptions<Body>(
                    values: Body.values,
                    value: body,
                    optionBuilder: (_, body) => Text(
                      body.name.replaceAll(RegExp('[^a-z]'), ''),
                    ),
                    onChange: (value) {
                      setState(() => body = value);
                    },
                  ),
                ],
              ),
            ),
            NesButton(
              type: NesButtonType.primary,
              onPressed: _submit,
              child: Text(l10n.continueLabel),
            ),
          ],
        ),
      ),
    );
  }
}
