import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MaterialColorPicker extends StatefulWidget {
  const MaterialColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
  });

  final Color pickerColor;
  final void Function(Color color) onColorChanged;

  @override
  State<MaterialColorPicker> createState() => _MaterialColorPickerState();
}

class _MaterialColorPickerState extends State<MaterialColorPicker> {
  final bool _portraitOnly = true;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.all(0),
                          contentPadding: const EdgeInsets.all(0),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                MaterialPicker(
                                  pickerColor: widget.pickerColor,
                                  onColorChanged: widget.onColorChanged,
                                  portraitOnly: _portraitOnly,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.pickerColor,
                shadowColor: widget.pickerColor.withOpacity(1),
                elevation: 10,
              ),
              child: Text(
                'Kiss Me with Your Finger to change theme <3',
                style: TextStyle(
                  color: useWhiteForeground(widget.pickerColor)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
