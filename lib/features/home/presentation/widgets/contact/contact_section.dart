import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';

import 'contact_item_tile.dart';
import 'social_contact_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Header
        const Align(
          alignment: Alignment.center,
          child: HeaderTitleSections(
            title1: 'Get In ',
            title2: 'Touch',
            subtitle:
                "I'm always open to discussing new projects, creative ideas, or opportunities.",
          ),
        ),
        const SizedBox(height: 48),

        // Contact Info Container
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 550),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12.0 : 32.0,
              vertical: 32.0,
            ),
            decoration: BoxDecoration(
              color: ColorsPalette.card,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: ColorsPalette.border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: ColorsPalette.shadow.withValues(alpha: 0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gmail Tile (Interactive)
                ContactItemTile(
                  icon: Icons.mail_outline_rounded,
                  value: 'osamakamel758@gmail.com',
                  onTap: () async {
                    await launchEmail('osamakamel758@gmail.com');
                  },
                ),
                const SizedBox(height: 16),

                // Phone Tile (Interactive)
                ContactItemTile(
                  icon: Icons.phone_outlined,
                  value: '+201090580579',
                  onTap: () async {
                    await launchPhone('+201090580579');
                  },
                ),
                const SizedBox(height: 16),

                // Location Tile (Static Text only, no onTap)
                const ContactItemTile(
                  icon: Icons.location_on_outlined,
                  value: 'Cairo, Egypt',
                ),
                const SizedBox(height: 36),

                // Divider line between items and socials
                Container(
                  height: 1.5,
                  color: ColorsPalette.divider,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                ),
                const SizedBox(height: 32),

                // Social Links Row (GitHub, LinkedIn, WhatsApp)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialContactButton(
                      svgAsset: 'assets/icons/github.svg',
                      onTap: () async {
                        await launchExternalUrl('https://github.com/osama550');
                      },
                    ),
                    const SizedBox(width: 20),
                    SocialContactButton(
                      svgAsset: 'assets/icons/linkedin.svg',
                      onTap: () async {
                        await launchExternalUrl(
                          'https://www.linkedin.com/in/osama-kamel-elsalamony',
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    SocialContactButton(
                      svgAsset: 'assets/icons/whatsapp.svg',
                      onTap: () async {
                        await launchExternalUrl('https://wa.me/201090580579');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
