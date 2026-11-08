import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/theme/app_colors.dart';
import 'package:github_users/core/theme/theme_option.dart';
import 'package:github_users/features/settings/presentation/bloc/theme_cubit.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeCubit>().state;

    return Row(
      children: [
        for (final option in ThemeOption.values) ...[
          if (option.index > 0) const SizedBox(width: 12),
          Expanded(
            child: _ThemeOptionCard(
              option: option,
              selected: mode == option.mode,
              onTap: () => context.read<ThemeCubit>().setThemeMode(option.mode),
            ),
          ),
        ],
      ],
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final ThemeOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final label = option.labelKey.tr();

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: ExcludeSemantics(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: selected
                    ? scheme.primary.withValues(alpha: 0.08)
                    : scheme.surfaceContainerHighest.withValues(alpha: 0.45),
                border: Border.all(
                  color: selected
                      ? scheme.primary
                      : scheme.outlineVariant.withValues(alpha: 0.7),
                  width: selected ? 1.6 : 1,
                ),
              ),
              child: Column(
                children: [
                  _ThemePreview(option: option, selected: selected),
                  const SizedBox(height: 10),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected ? scheme.primary : scheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemePreview extends StatelessWidget {
  const _ThemePreview({required this.option, required this.selected});

  static const _light = _PreviewPalette(
    background: AppColors.previewLightBackground,
    line: AppColors.previewLightLine,
    accent: AppColors.seed,
  );
  static const _dark = _PreviewPalette(
    background: AppColors.previewDarkBackground,
    line: AppColors.previewDarkLine,
    accent: AppColors.previewDarkAccent,
  );

  final ThemeOption option;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final preview = switch (option) {
      ThemeOption.light => const _PreviewPane(palette: _light),
      ThemeOption.dark => const _PreviewPane(palette: _dark),
      ThemeOption.system => const Row(
        children: [
          Expanded(child: _PreviewPane(palette: _light)),
          Expanded(child: _PreviewPane(palette: _dark)),
        ],
      ),
    };

    return SizedBox(
      height: 76,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0x1A000000)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            fit: StackFit.expand,
            children: [
              preview,
              if (selected)
                Positioned(
                  top: 6,
                  right: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(
                      width: 16,
                      height: 16,
                      child: Icon(
                        Icons.check_rounded,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewPane extends StatelessWidget {
  const _PreviewPane({required this.palette});

  final _PreviewPalette palette;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: palette.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7,
              width: 22,
              decoration: BoxDecoration(
                color: palette.accent,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const Spacer(),
            _Line(color: palette.line),
            const SizedBox(height: 5),
            _Line(color: palette.line, widthFactor: 0.62),
          ],
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.color, this.widthFactor = 1});

  final Color color;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(99),
        ),
        child: const SizedBox(height: 5),
      ),
    );
  }
}

final class _PreviewPalette {
  const _PreviewPalette({
    required this.background,
    required this.line,
    required this.accent,
  });

  final Color background;
  final Color line;
  final Color accent;
}
