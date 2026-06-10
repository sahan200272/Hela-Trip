import 'package:flutter/material.dart';
import '../theme/hela_theme.dart';
import '../data/hela_data.dart';

class HEyebrow extends StatelessWidget {
  final String text;
  final Color? color;
  const HEyebrow(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: HelaText.eyebrow.copyWith(color: color ?? HelaColors.text2),
    );
  }
}

class HChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback? onTap;
  const HChip({
    super.key,
    required this.label,
    this.active = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active ? HelaColors.jungle : Colors.transparent,
          borderRadius: BorderRadius.circular(HelaRadii.chip),
          border: Border.all(
            color: active ? HelaColors.jungle : HelaColors.hair,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: HelaText.label.copyWith(
            color: active ? Colors.white : HelaColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class HStars extends StatelessWidget {
  final double value;
  final int? count;
  final double size;
  const HStars({
    super.key,
    required this.value,
    this.count,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    final stars = <Widget>[];
    for (var i = 0; i < 5; i++) {
      final filled = value >= i + 1;
      final half = !filled && value > i;
      stars.add(
        Icon(
          filled
              ? Icons.star
              : half
              ? Icons.star_half
              : Icons.star_border,
          color: filled || half ? HelaColors.jungle : HelaColors.text3,
          size: size,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        const SizedBox(width: 6),
        Text(
          value.toStringAsFixed(1),
          style: HelaText.label.copyWith(
            color: HelaColors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (count != null) ...[
          Text(
            ' · ${_thousands(count!)}',
            style: HelaText.label.copyWith(color: HelaColors.text3),
          ),
        ],
      ],
    );
  }

  static String _thousands(int v) {
    final s = v.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

class HPhotoSlot extends StatelessWidget {
  final double height;
  final double? width;
  final double radius;
  final Color tintFrom;
  const HPhotoSlot({
    super.key,
    required this.height,
    this.width,
    this.radius = HelaRadii.image,
    required this.tintFrom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tintFrom.withValues(alpha: 0.8),
            const Color(0xFF2A2A1F),
          ],
        ),
      ),
    );
  }
}

class HSection extends StatelessWidget {
  final String? eyebrow;
  final String? title;
  final Widget? action;
  final Widget child;
  final EdgeInsets padding;
  const HSection({
    super.key,
    this.eyebrow,
    this.title,
    this.action,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eyebrow != null || title != null || action != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (eyebrow != null) HEyebrow(eyebrow!),
                        if (title != null) ...[
                          const SizedBox(height: 4),
                          Text(title!, style: HelaText.h2(context)),
                        ],
                      ],
                    ),
                  ),
                  if (action != null) action!,
                ],
              ),
            ),
          child,
        ],
      ),
    );
  }
}

class HDestinationHeroCard extends StatelessWidget {
  final Destination dest;
  final String currency;
  final bool saved;
  final VoidCallback? onTap;
  final VoidCallback? onToggleSave;
  const HDestinationHeroCard({
    super.key,
    required this.dest,
    required this.currency,
    required this.saved,
    this.onTap,
    this.onToggleSave,
  });

  @override
  Widget build(BuildContext context) {
    final region = regionById(dest.regionId);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 280,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(HelaRadii.hero),
          child: Stack(
            children: [
              HPhotoSlot(
                height: 360,
                width: 280,
                radius: HelaRadii.hero,
                tintFrom: region.tint,
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onToggleSave,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      saved ? Icons.bookmark : Icons.bookmark_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HEyebrow(
                        region.label,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dest.name,
                        style: HelaText.title(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      HStars(
                        value: dest.rating,
                        count: dest.reviews,
                        size: 11,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'from ${formatPrice(dest.baseCost, currency)} /day',
                        style: HelaText.mono.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
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

class HDestinationListCard extends StatelessWidget {
  final Destination dest;
  final String currency;
  final bool saved;
  final VoidCallback? onTap;
  final VoidCallback? onToggleSave;
  const HDestinationListCard({
    super.key,
    required this.dest,
    required this.currency,
    required this.saved,
    this.onTap,
    this.onToggleSave,
  });

  @override
  Widget build(BuildContext context) {
    final region = regionById(dest.regionId);
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          HPhotoSlot(
            height: 92,
            width: 92,
            radius: HelaRadii.image,
            tintFrom: region.tint,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HEyebrow(region.label),
                const SizedBox(height: 2),
                Text(dest.name, style: HelaText.h2Sized(19)),
                const SizedBox(height: 4),
                HStars(value: dest.rating, count: dest.reviews, size: 10.5),
                const SizedBox(height: 4),
                Text(
                  'from ${formatPrice(dest.baseCost, currency)} /day',
                  style: HelaText.mono,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleSave,
            icon: Icon(
              saved ? Icons.bookmark : Icons.bookmark_outline,
              size: 18,
              color: HelaColors.text2,
            ),
          ),
        ],
      ),
    );
  }
}
