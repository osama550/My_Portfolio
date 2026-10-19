import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class ContactLinkTile extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const ContactLinkTile({super.key, required this.label, required this.onTap});

  @override
  State<ContactLinkTile> createState() => _ContactLinkTileState();
}

class _ContactLinkTileState extends State<ContactLinkTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.surfaceRaised,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _hovered ? colors.accent : colors.borderStrong,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colors.heading,
                    ),
                  ),
                ),
                Icon(Icons.north_east_rounded, size: 16, color: colors.accent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
