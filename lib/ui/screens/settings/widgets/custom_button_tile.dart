import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/services.dart';

/// Button Tile to display Text and Icons
class CustomButtonTile extends StatefulHookWidget {
  const CustomButtonTile({
    required this.label,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function() onPressed;

  @override
  _CustomButtonTileState createState() => _CustomButtonTileState();
}

class _CustomButtonTileState extends State<CustomButtonTile> {
  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        color: _theme.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(widget.icon, color: _theme.colors.accent),
          title: Text(
            widget.label,
            style: TextStyle(color: _theme.colors.accent),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: widget.onPressed,
        ),
      ),
    );
  }
}
