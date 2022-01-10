import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  late String text;
  late Color color;
  late double size;

  modified_text({required this.text, required this.color, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}
