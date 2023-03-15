import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class OnboardAttributesSelectionView extends StatefulWidget {
  const OnboardAttributesSelectionView({
    required this.hero,
    super.key,
  });

  final Hero hero;

  @override
  State<OnboardAttributesSelectionView> createState() =>
      _OnboardAttributesSelectionViewState();
}

class _OnboardAttributesSelectionViewState
    extends State<OnboardAttributesSelectionView> {
  int pointsToSpent = 6;

  int strength = 0;
  int dexterity = 0;
  int intelligence = 0;
  int stamina = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GameScaffold(
      body: Column(
        children: [
          ScrollContainer(
            child: Text(l10n.onboardingFormStep2),
          ),
          const SizedBox(height: 48),
          Text(l10n.pointsToSpent(pointsToSpent)),
          const SizedBox(height: 32),
          SizedBox(
            width: 250,
            child: Column(
              children: [
                _Attr(
                  label: l10n.attrStrength,
                  value: strength,
                  onAdd: pointsToSpent > 0
                      ? () {
                          setState(() {
                            strength = strength + 1;
                            pointsToSpent = pointsToSpent - 1;
                          });
                        }
                      : null,
                  onDecrease: strength > 0
                      ? () {
                          setState(() {
                            strength = strength - 1;
                            pointsToSpent = pointsToSpent + 1;
                          });
                        }
                      : null,
                ),
                _Attr(
                  label: l10n.attrDexterity,
                  value: dexterity,
                  onAdd: pointsToSpent > 0
                      ? () {
                          setState(() {
                            dexterity = dexterity + 1;
                            pointsToSpent = pointsToSpent - 1;
                          });
                        }
                      : null,
                  onDecrease: dexterity > 0
                      ? () {
                          setState(() {
                            dexterity = dexterity - 1;
                            pointsToSpent = pointsToSpent + 1;
                          });
                        }
                      : null,
                ),
                _Attr(
                  label: l10n.attrIntelligence,
                  value: intelligence,
                  onAdd: pointsToSpent > 0
                      ? () {
                          setState(() {
                            intelligence = intelligence + 1;
                            pointsToSpent = pointsToSpent - 1;
                          });
                        }
                      : null,
                  onDecrease: intelligence > 0
                      ? () {
                          setState(() {
                            intelligence = intelligence - 1;
                            pointsToSpent = pointsToSpent + 1;
                          });
                        }
                      : null,
                ),
                _Attr(
                  label: l10n.attrStamina,
                  value: stamina,
                  onAdd: pointsToSpent > 0
                      ? () {
                          setState(() {
                            stamina = stamina + 1;
                            pointsToSpent = pointsToSpent - 1;
                          });
                        }
                      : null,
                  onDecrease: stamina > 0
                      ? () {
                          setState(() {
                            stamina = stamina - 1;
                            pointsToSpent = pointsToSpent + 1;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          if (pointsToSpent == 0)
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {
                //
              },
              child: Text(l10n.confirm),
            ),
        ],
      ),
    );
  }
}

class _Attr extends StatelessWidget {
  const _Attr({
    required this.label,
    required this.value,
    this.onAdd,
    this.onDecrease,
  });

  final String label;
  final int value;

  final VoidCallback? onAdd;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 32),
          SizedBox(
            width: 32,
            height: 32,
            child: onDecrease != null
                ? NesIconButton(
                    onPress: onDecrease!,
                    icon: NesIcons.instance.remove,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 64,
            child: Center(child: Text(value.toString())),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 32,
            height: 32,
            child: onAdd != null
                ? NesIconButton(
                    onPress: onAdd!,
                    icon: NesIcons.instance.add,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
