import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Кнопка копирования с анимацией: иконка «copy» → «check» (зелёная)
/// на 2 секунды, затем обратно. SnackBar не показывается.
class AnimatedCopyIconButton extends StatefulWidget {
  final String textToCopy;
  final double size;
  final Color? color;
  final String tooltip;

  const AnimatedCopyIconButton({
    super.key,
    required this.textToCopy,
    this.size = 14,
    this.color,
    this.tooltip = 'Скопировать',
  });

  @override
  State<AnimatedCopyIconButton> createState() => _AnimatedCopyIconButtonState();
}

class _AnimatedCopyIconButtonState extends State<AnimatedCopyIconButton> {
  bool _copied = false;

  Future<void> _onCopy() async {
    await Clipboard.setData(ClipboardData(text: widget.textToCopy));
    if (!mounted) return;
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: IconButton(
        onPressed: _onCopy,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            _copied ? Icons.check : Icons.copy,
            key: ValueKey(_copied),
            size: widget.size,
            color: _copied ? Colors.green : widget.color,
          ),
        ),
        tooltip: widget.tooltip,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
