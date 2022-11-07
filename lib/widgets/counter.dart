import 'package:flutter/material.dart';
class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  final int number;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(.26)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(width: 2, color: color)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$number",
          style: TextStyle(fontSize: 40, color: color),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Color(0xFF959595)),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
