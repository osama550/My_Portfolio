import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class ResponsiveDrawer extends StatelessWidget {
  final List<String> navItems;
  final Function(int) onNavItemTap;

  const ResponsiveDrawer({
    super.key,
    required this.navItems,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final itemIcons = {
      'About': Icons.person_outline_rounded,
      'Skills': Icons.code_rounded,
      'Experience': Icons.work_outline_rounded,
      'Projects': Icons.business_center_outlined,
      'Contact': Icons.mail_outline_rounded,
    };

    return Drawer(
      backgroundColor: ColorsPalette.surface,
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: context.typography.h5Bold.copyWith(
                        fontFamily: 'Poppins',
                      ),
                      children: const [
                        TextSpan(
                          text: '<',
                          style: TextStyle(color: ColorsPalette.primary),
                        ),
                        TextSpan(
                          text: 'Dev',
                          style: TextStyle(color: ColorsPalette.primary),
                        ),
                        TextSpan(
                          text: ' />',
                          style: TextStyle(color: ColorsPalette.primary),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: ColorsPalette.textSecondary,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Divider(color: ColorsPalette.border),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: navItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final title = navItems[index];
                    final icon =
                        itemIcons[title] ?? Icons.arrow_forward_ios_rounded;
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        onNavItemTap(index);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorsPalette.border.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(icon, color: ColorsPalette.primary, size: 22),
                            const SizedBox(width: 16),
                            Text(
                              title,
                              style: context.typography.bodyLargeSemiBold
                                  .copyWith(color: ColorsPalette.textPrimary),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorsPalette.textHint,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  '© ${DateTime.now().year} Osama. All rights reserved.',
                  style: context.typography.bodyXSmallMedium.copyWith(
                    color: ColorsPalette.textHint,
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
