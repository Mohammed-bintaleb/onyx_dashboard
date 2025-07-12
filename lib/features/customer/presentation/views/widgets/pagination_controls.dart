import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart'; // استيراد الترجمة
import 'pagination_button.dart';

class PaginationControls extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPrevious,
    this.onNext,
  });

  @override
  State<PaginationControls> createState() => _PaginationControlsState();
}

class _PaginationControlsState extends State<PaginationControls> {
  bool _isPreviousPressed = false;
  bool _isNextPressed = false;

  void _handlePress(bool isPrevious) {
    if (isPrevious ? widget.onPrevious == null : widget.onNext == null) return;

    setState(
      () => isPrevious ? _isPreviousPressed = true : _isNextPressed = true,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(
          () =>
              isPrevious ? _isPreviousPressed = false : _isNextPressed = false,
        );
      }
    });

    isPrevious ? widget.onPrevious!() : widget.onNext!();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.translate(
            "page_of",
            args: [
              (widget.currentPage + 1).toString(),
              widget.totalPages.toString(),
            ],
          ),
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        Row(
          children: [
            PaginationButton(
              icon: Icons.chevron_left,
              label: t.translate("previous"),
              isPressed: _isPreviousPressed,
              isEnabled: widget.onPrevious != null,
              onPressed: () => _handlePress(true),
            ),
            const SizedBox(width: 8),
            PaginationButton(
              icon: Icons.chevron_right,
              label: t.translate("next"),
              isPressed: _isNextPressed,
              isEnabled: widget.onNext != null,
              onPressed: () => _handlePress(false),
            ),
          ],
        ),
      ],
    );
  }
}
