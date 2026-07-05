import 'dart:async';
import 'package:flutter/material.dart';
import 'design_system.dart';

class EntryGuardScreen extends StatefulWidget {
  const EntryGuardScreen({super.key});

  @override
  State<EntryGuardScreen> createState() => _EntryGuardScreenState();
}

class _EntryGuardScreenState extends State<EntryGuardScreen> {
  int _currentTab = 0; // 0 = Monitor, 1 = Alerts, 2 = Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header / Title Bar
            const HeaderBar(),

            // Main Contents (Scrollable)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                  vertical: AppSpacing.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status row (LIVE & Face Detected)
                    const StatusRow(),
                    const SizedBox(height: AppSpacing.md),

                    // Camera Stream Player
                    const CameraFeedStream(),
                    const SizedBox(height: AppSpacing.md),

                    // Alert Card ("Unrecognized Subject")
                    const UnrecognizedSubjectCard(),
                    const SizedBox(height: AppSpacing.lg),

                    // Timeline Header
                    const TimelineHeader(),
                    const SizedBox(height: AppSpacing.sm),

                    // Timeline Logs
                    const TimelineLogList(),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            CustomBottomNavBar(
              currentIndex: _currentTab,
              onTabSelected: (index) {
                setState(() {
                  _currentTab = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SUB-WIDGETS & COMPONENTS
// -----------------------------------------------------------------------------

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.marginMobile,
        vertical: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Entry Guard',
            style: AppTypography.headlineLgMobile,
          ),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.outlineVariant,
                  width: 1.0,
                ),
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusRow extends StatelessWidget {
  const StatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Blinking LIVE Indicator
        const LiveIndicatorChip(),
        const SizedBox(width: AppSpacing.sm),

        // Face Detected Chip
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppRadius.standard),
            border: Border.all(
              color: AppColors.primaryContainer.withOpacity(0.3),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.face_retouching_natural_rounded,
                color: AppColors.primary,
                size: 14,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Face Detected',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LiveIndicatorChip extends StatefulWidget {
  const LiveIndicatorChip({super.key});

  @override
  State<LiveIndicatorChip> createState() => _LiveIndicatorChipState();
}

class _LiveIndicatorChipState extends State<LiveIndicatorChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.errorContainer.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppRadius.standard),
        border: Border.all(
          color: AppColors.errorContainer.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _pulseAnimation,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs + 2),
          Text(
            'LIVE',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CameraFeedStream extends StatefulWidget {
  const CameraFeedStream({super.key});

  @override
  State<CameraFeedStream> createState() => _CameraFeedStreamState();
}

class _CameraFeedStreamState extends State<CameraFeedStream>
    with SingleTickerProviderStateMixin {
  late AnimationController _scanController;
  late Animation<double> _scanAnimation;

  Timer? _timer;
  String _timestamp = '13:54:23:31';

  @override
  void initState() {
    super.initState();
    // Scan Line Loop Animation
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _scanAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );

    // Dynamic Clock ticking every 10 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final now = DateTime.now();
      final hh = now.hour.toString().padLeft(2, '0');
      final mm = now.minute.toString().padLeft(2, '0');
      final ss = now.second.toString().padLeft(2, '0');
      final ms = (now.millisecond ~/ 10).toString().padLeft(2, '0');
      
      if (mounted) {
        setState(() {
          _timestamp = '$hh:$mm:$ss:$ms';
        });
      }
    });
  }

  @override
  void dispose() {
    _scanController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Stack(
          children: [
            // Center Image Placeholder Graphic
            Center(
              child: Icon(
                Icons.image_outlined,
                color: AppColors.onSurfaceVariant.withOpacity(0.25),
                size: 48,
              ),
            ),

            // Scan Line Animation Overlay
            AnimatedBuilder(
              animation: _scanAnimation,
              builder: (context, child) {
                return Positioned(
                  top: _scanAnimation.value * 220,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryContainer.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Subtle scan lines grid overlay effect
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.transparent,
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),

            // Info Bar overlay (Bottom Align)
            Positioned(
              left: AppSpacing.sm,
              right: AppSpacing.sm,
              bottom: AppSpacing.sm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Camera ID Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      'CAM_01_ENTRY // HIGH_RES_STREAM',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onSurface,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Real-time Clock Monospace
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      _timestamp,
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnrecognizedSubjectCard extends StatelessWidget {
  const UnrecognizedSubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row inside the card
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gate/Door Graphic Box
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                  border: Border.all(
                    color: AppColors.errorContainer.withOpacity(0.5),
                    width: 1.0,
                  ),
                  color: AppColors.errorContainer.withOpacity(0.08),
                ),
                child: const Icon(
                  Icons.door_sliding_outlined,
                  color: AppColors.errorContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),

              // Title and Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unrecognized Subject',
                      style: AppTypography.headlineSm.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          'MAIN ENTRANCE',
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant.withOpacity(0.6),
                            fontSize: 9,
                          ),
                        ),
                        Text(
                          '  •  2M AGO',
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant.withOpacity(0.6),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Badge: Priority High
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.errorContainer.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(
                    color: AppColors.errorContainer.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  'Priority\nHigh',
                  textAlign: TextAlign.center,
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.error,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // Metadata Boxes Side-by-Side
          Row(
            children: [
              // Confidence Box
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(AppRadius.standard),
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CONFIDENCE',
                        style: AppTypography.labelSm.copyWith(
                          fontSize: 8,
                          color: AppColors.onSurfaceVariant.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '12% Match',
                        style: AppTypography.headlineSm.copyWith(
                          color: AppColors.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),

              // Gate Status Box
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(AppRadius.standard),
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GATE STATUS',
                        style: AppTypography.labelSm.copyWith(
                          fontSize: 8,
                          color: AppColors.onSurfaceVariant.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'LOCKED',
                        style: AppTypography.headlineSm.copyWith(
                          color: AppColors.error,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // Action Buttons
          Row(
            children: [
              // Viewed Button
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(AppRadius.standard),
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.5),
                      width: 0.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(AppRadius.standard),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.onSecondaryContainer,
                            size: 16,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Viewed',
                            style: AppTypography.headlineSm.copyWith(
                              fontSize: 13,
                              color: AppColors.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),

              // Deny Button
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: BorderRadius.circular(AppRadius.standard),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(AppRadius.standard),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.block_flipped,
                            color: AppColors.onErrorContainer,
                            size: 16,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Deny',
                            style: AppTypography.headlineSm.copyWith(
                              fontSize: 13,
                              color: AppColors.onErrorContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Timeline',
          style: AppTypography.headlineSm.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'View All',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineLogList extends StatelessWidget {
  const TimelineLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          // Log Item 1: Staff Entry
          const LogItem(
            time: '14:38',
            title: 'Staff Entry',
            subtitle: 'Manager (ID: 02441) • Rear Gate',
            icon: Icons.shield_outlined,
            iconColor: AppColors.primary,
          ),
          
          // Divider
          Divider(color: AppColors.outlineVariant.withOpacity(0.3), height: 1),

          // Log Item 2: Delivery Exit
          const LogItem(
            time: '14:12',
            title: 'Delivery Exit',
            subtitle: 'Logistics B • Loading Dock',
            icon: Icons.chevron_right_rounded,
            iconColor: AppColors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

class LogItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  const LogItem({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          // Time Monospaced
          SizedBox(
            width: 44,
            child: Text(
              time,
              style: AppTypography.labelMd.copyWith(
                color: AppColors.onSurfaceVariant.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),

          // Details Col
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headlineSm.copyWith(
                    fontSize: 14,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

          // Action Icon
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(
            color: AppColors.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Tab 0: Monitor (Active by default)
          NavBarItem(
            icon: Icons.visibility_rounded,
            label: 'Monitor',
            isActive: currentIndex == 0,
            onTap: () => onTabSelected(0),
          ),

          // Tab 1: Alerts
          NavBarItem(
            icon: Icons.notifications_none_rounded,
            label: 'Alerts',
            isActive: currentIndex == 1,
            onTap: () => onTabSelected(1),
          ),

          // Tab 2: Profile
          NavBarItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            isActive: currentIndex == 2,
            onTap: () => onTabSelected(2),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Badge or Container
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primaryContainer.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppRadius.xl),
              ),
              child: Icon(
                icon,
                color: isActive
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant.withOpacity(0.8),
                size: 22,
              ),
            ),
            const SizedBox(height: 4),

            // Tab label text
            Text(
              label,
              style: AppTypography.labelSm.copyWith(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
