import 'package:flutter/material.dart';

class ReactionOverlay {
  static OverlayEntry? _overlayEntry;
  static OverlayEntry? _backgroundEntry;

  static void showReactions(
    BuildContext context,
    Offset offset,
    Function(String) onReactionSelected,
  ) {
    if (_overlayEntry != null) return;

    _backgroundEntry = OverlayEntry(
      builder:
          (context) => Positioned.fill(
            child: GestureDetector(
              onTap: hideReactions,
              child: Container(color: Colors.transparent),
            ),
          ),
    );

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: offset.dy - 80,
            left: 20,
            child: Material(
              color: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _reactionIcon(
                      context,
                      'like',
                      'assets/images/like.png',
                      onReactionSelected,
                    ),
                    _reactionIcon(
                      context,
                      'love',
                      'assets/images/love.png',
                      onReactionSelected,
                    ),
                    _reactionIcon(
                      context,
                      'haha',
                      'assets/images/haha.png',
                      onReactionSelected,
                    ),
                    _reactionIcon(
                      context,
                      'wow',
                      'assets/images/wow.png',
                      onReactionSelected,
                    ),
                    _reactionIcon(
                      context,
                      'sad',
                      'assets/images/sad.png',
                      onReactionSelected,
                    ),
                    _reactionIcon(
                      context,
                      'angry',
                      'assets/images/angry.png',
                      onReactionSelected,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(_backgroundEntry!);
    Overlay.of(context).insert(_overlayEntry!);
  }

  static Widget _reactionIcon(
    BuildContext context,
    String type,
    String asset,
    Function(String) onReactionSelected,
  ) {
    return GestureDetector(
      onTap: () {
        onReactionSelected(type);
        hideReactions();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(asset, width: 35, height: 35, fit: BoxFit.cover),
      ),
    );
  }

  static void hideReactions() {
    _overlayEntry?.remove();
    _backgroundEntry?.remove();
    _overlayEntry = null;
    _backgroundEntry = null;
  }
}
