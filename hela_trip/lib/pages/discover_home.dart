import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/hela_data.dart';
import '../providers/auth_providers.dart';
import '../providers/user_providers.dart';
import '../theme/hela_theme.dart';
import '../widgets/hela_widgets.dart';

class DiscoverHome extends ConsumerStatefulWidget {
  const DiscoverHome({super.key});

  @override
  ConsumerState<DiscoverHome> createState() => _DiscoverHomeState();
}

class _DiscoverHomeState extends ConsumerState<DiscoverHome> {
  String regionFilter = 'all';
  String currency = 'USD';
  final Set<String> saved = {'ella', 'arugam'};

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider).valueOrNull;
    final editorPicks = helaDestinations
        .where((d) => ['sigiriya', 'ella', 'mirissa', 'galle'].contains(d.id))
        .toList();
    final trending = helaDestinations
        .where((d) => ['arugam', 'yala', 'kandy'].contains(d.id))
        .toList();

    return Scaffold(
      backgroundColor: HelaColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 110),
          children: [
            // Brand row + actions
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: HelaColors.jungle,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'h',
                      style: GoogleFonts.instrumentSerif(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        height: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      style: HelaText.label.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HelaColors.text,
                      ),
                      children: const [
                        TextSpan(text: 'hela'),
                        TextSpan(
                          text: 'trip',
                          style: TextStyle(color: HelaColors.jungle),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: HelaColors.text2,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.download_outlined,
                      color: HelaColors.text2,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: HelaColors.text2),
                    onPressed: () => ref.read(firebaseAuthProvider).signOut(),
                  ),
                ],
              ),
            ),

            // Greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HEyebrow(
                    user?.name.split(' ').first.isNotEmpty == true
                        ? 'Welcome back, ${user!.name.split(' ').first}'
                        : 'Welcome back',
                  ),
                  const SizedBox(height: 6),
                  Text.rich(
                    TextSpan(
                      style: HelaText.hero(context),
                      children: const [
                        TextSpan(text: 'Where in '),
                        TextSpan(
                          text: 'Sri Lanka',
                          style: TextStyle(color: HelaColors.jungle),
                        ),
                        TextSpan(text: ' next?'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Search bar (placeholder, tap is a no-op for now)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: HelaColors.surf,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: HelaColors.hair, width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 18,
                        color: HelaColors.text2,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Try "Ella" or "tea factory tour"',
                          style: HelaText.body.copyWith(
                            color: HelaColors.text2,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.mic_none,
                        size: 18,
                        color: HelaColors.text2,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // Region chips
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  HChip(
                    label: 'All Sri Lanka',
                    active: regionFilter == 'all',
                    onTap: () => setState(() => regionFilter = 'all'),
                  ),
                  ...helaRegions.map(
                    (r) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: HChip(
                        label: r.label,
                        active: regionFilter == r.id,
                        onTap: () => setState(() => regionFilter = r.id),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Editor's picks
            HSection(
              eyebrow: "Editor's picks",
              title: 'The greats',
              action: Text(
                'See all →',
                style: HelaText.label.copyWith(
                  color: HelaColors.jungle,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: SizedBox(
                height: 360,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: editorPicks.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 14),
                  itemBuilder: (context, i) {
                    final d = editorPicks[i];
                    return HDestinationHeroCard(
                      dest: d,
                      currency: currency,
                      saved: saved.contains(d.id),
                      onTap: () {},
                      onToggleSave: () => setState(() {
                        saved.contains(d.id)
                            ? saved.remove(d.id)
                            : saved.add(d.id);
                      }),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Categories
            HSection(
              eyebrow: 'Browse by',
              title: 'What kind of trip?',
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: helaCategories.map((c) {
                  return Container(
                    decoration: BoxDecoration(
                      color: HelaColors.surf,
                      borderRadius: BorderRadius.circular(HelaRadii.card),
                      border: Border.all(color: HelaColors.hair, width: 0.5),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(c.icon, size: 22, color: HelaColors.jungle),
                        Text(
                          c.label,
                          style: HelaText.h2Sized(
                            15,
                          ).copyWith(color: HelaColors.text),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 28),

            // Trending list
            HSection(
              eyebrow: 'Trending now',
              title: 'Where people are going',
              child: Column(
                children: [
                  for (var i = 0; i < trending.length; i++) ...[
                    HDestinationListCard(
                      dest: trending[i],
                      currency: currency,
                      saved: saved.contains(trending[i].id),
                      onTap: () {},
                      onToggleSave: () => setState(() {
                        final id = trending[i].id;
                        saved.contains(id) ? saved.remove(id) : saved.add(id);
                      }),
                    ),
                    if (i < trending.length - 1) ...[
                      const SizedBox(height: 12),
                      Container(height: 0.5, color: HelaColors.hair),
                      const SizedBox(height: 12),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
