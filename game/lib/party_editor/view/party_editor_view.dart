import 'dart:ui' as ui;

import 'package:cross_file/cross_file.dart';
import 'package:flame/components.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/party_editor/party_editor.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class PartyEditorView extends StatelessWidget {
  const PartyEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameScaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: _CharacterView(),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 4,
            child: _SelectionView(),
          ),
        ],
      ),
    );
  }
}

class _CharacterView extends StatefulWidget {
  const _CharacterView();

  @override
  State<_CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<_CharacterView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer<PartyCubit, PartyState>(
      listenWhen: (previous, current) => previous.selected != current.selected,
      listener: (_, state) {
        final selectedHero =
            state.selected != null ? state.heroes[state.selected!] : null;
        controller.text = selectedHero?.name ?? '';
      },
      builder: (context, state) {
        final cubit = context.read<PartyCubit>();
        final selectedHero =
            state.selected != null ? state.heroes[state.selected!] : null;

        final child = selectedHero == null
            ? Center(child: Text(l10n.noHeroSelected))
            : Column(
                children: [
                  _HeroView(selectedHero: selectedHero),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 48),
                        NesIterableOptions<Body>(
                          values: Body.values,
                          value: selectedHero.body,
                          optionBuilder: (_, body) => Text(body.name),
                          onChange: cubit.updateSelectedHeroBody,
                        ),
                        const SizedBox(height: 16),
                        NesIterableOptions<Outfit>(
                          values: Outfit.values,
                          value: selectedHero.outfit,
                          optionBuilder: (_, outfit) => Text(outfit.name),
                          onChange: cubit.updateSelectedHeroOutfit,
                        ),
                        const SizedBox(height: 16),
                        NesIterableOptions<Weapon?>(
                          values: const [
                            null,
                            ...Weapon.values,
                          ],
                          value: selectedHero.weapon,
                          optionBuilder: (_, value) =>
                              Text(value?.name ?? ' - '),
                          onChange: cubit.updateSelectedHeroWeapon,
                        ),
                        const SizedBox(height: 16),
                        NesIterableOptions<Shield?>(
                          values: const [
                            null,
                            ...Shield.values,
                          ],
                          value: selectedHero.shield,
                          optionBuilder: (_, value) =>
                              Text(value?.name ?? ' - '),
                          onChange: cubit.updateSelectedHeroShield,
                        ),
                      ],
                    ),
                  ),
                ],
              );

        return NesContainer(
          height: double.infinity,
          label: l10n.preview,
          child: child,
        );
      },
    );
  }
}

class _HeroView extends StatelessWidget {
  const _HeroView({
    required this.selectedHero,
    this.alignment = Alignment.bottomLeft,
    this.zoom = 8,
  });

  final Hero selectedHero;
  final int zoom;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final assets = context.read<Assets>();

    final size = 16.0 * zoom;

    return Container(
      alignment: alignment,
      height: 16 * (zoom + 1),
      child: SizedBox(
        width: 16 * (zoom + 2),
        height: size,
        child: Stack(
          children: [
            Positioned.fill(
              child: SpriteWidget(
                sprite: assets.getBody(selectedHero.body.index),
              ),
            ),
            Positioned.fill(
              child: SpriteWidget(
                sprite: assets.getOutfit(selectedHero.outfit.index),
              ),
            ),
            if (selectedHero.weapon != null)
              Positioned(
                left: size * .4,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SpriteWidget(
                    sprite: assets.getWeapon(
                      selectedHero.weapon!.index,
                    ),
                  ),
                ),
              ),
            if (selectedHero.shield != null)
              Positioned(
                left: -(size * .25),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SpriteWidget(
                    sprite: assets.getShield(
                      selectedHero.shield!.index,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NesConfirmDialog extends StatelessWidget {
  const NesConfirmDialog({
    required this.confirmLabel,
    required this.cancelLabel,
    required this.message,
    super.key,
  });

  final String confirmLabel;
  final String cancelLabel;
  final String message;

  static Future<bool?> show({
    required BuildContext context,
    String confirmLabel = 'Yes',
    String cancelLabel = 'No',
    String message = 'Are you sure?',
  }) {
    return showGeneralDialog<bool>(
      context: context,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scaleY: animation.value,
          child: child,
        );
      },
      pageBuilder: (_, __, ___) => NesConfirmDialog(
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        child: IntrinsicWidth(
          stepHeight: 0.56,
          child: NesContainer(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NesButton(
                          type: NesButtonType.warning,
                          child: Text(cancelLabel),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        const SizedBox(width: 16),
                        NesButton(
                          type: NesButtonType.primary,
                          child: Text(confirmLabel),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectionView extends StatelessWidget {
  const _SelectionView();
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PartyCubit>();
    final state = cubit.state;
    final l10n = context.l10n;
    return NesContainer(
      height: double.infinity,
      label: 'Party',
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state.heroes.isEmpty) Text(l10n.noHero),
                  for (final hero in state.heroes)
                    Stack(
                      children: [
                        Column(
                          children: [
                            Text(hero.name),
                            NesPressable(
                              onPress: () {
                                context.read<PartyCubit>().selectHero(hero);
                              },
                              child: _HeroView(
                                selectedHero: hero,
                                alignment: Alignment.bottomCenter,
                                zoom: 4,
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: NesIconButton(
                            icon: NesIcons.instance.delete,
                            onPress: () async {
                              final cubit = context.read<PartyCubit>();
                              final confirmation = await NesConfirmDialog.show(
                                context: context,
                              );

                              if (confirmation ?? false) {
                                cubit.removeHero(hero);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              NesPressable(
                onPress: () {
                  context.read<PartyCubit>().newHero();
                },
                child: NesIcon(iconData: NesIcons.instance.add),
              ),
              const SizedBox(width: 16),
              if (state.heroes.isNotEmpty)
                NesPressable(
                  onPress: () async {
                    final image = await drawHeroesSpritesheet(
                      state.heroes,
                      context.read<Assets>(),
                    );
                    final byteData = await image.toByteData(
                      format: ui.ImageByteFormat.png,
                    );
                    final file = XFile.fromData(
                      byteData!.buffer.asUint8List(),
                      mimeType: 'image/png',
                      name: 'little_heroes.png',
                    );
                    await file.saveTo('little_heroes.png');
                  },
                  child: NesIcon(iconData: NesIcons.instance.download),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<ui.Image> drawHeroesSpritesheet(List<Hero> heros, Assets assets) async {
  const size = 16.0;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  for (var i = 0; i < heros.length; i++) {
    final hero = heros[i];
    final image = await drawHeroSprite(hero, assets);
    canvas.drawImage(image, Offset(size * i, 0), Paint());
  }
  final picture = recorder.endRecording();
  final image = await picture.toImage(
    (size * heros.length).toInt(),
    size.toInt(),
  );

  return image;
}

Future<ui.Image> drawHeroSprite(Hero hero, Assets assets) async {
  const size = 16;
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  final body = assets.getBody(hero.body.index);
  final outfit = assets.getOutfit(hero.outfit.index);

  body.render(canvas);
  outfit.render(canvas);

  if (hero.weapon != null) {
    assets
        .getWeapon(hero.weapon!.index)
        .render(canvas, position: Vector2(size * .4, 0));
  }

  if (hero.shield != null) {
    assets
        .getShield(hero.shield!.index)
        .render(canvas, position: Vector2(-(size * .25), 0));
  }

  final picture = recorder.endRecording();
  final image = await picture.toImage(size, size);
  return image;
}
