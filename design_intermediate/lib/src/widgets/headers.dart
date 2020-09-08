import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        color: Color(0xff615AAB));
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        decoration: BoxDecoration(
            color: Color(0xff615AAB),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70))));
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    // Debería llamarse paint
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    // moveTo mueve el lápiz sin dibujar
    // lineTo mueve el lápiz dibujando el recorrido
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // Esta línea no es necesaria para el relleno
    // path.lineTo(0, size.height * 0.35);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ));
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    // Debería llamarse paint
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    path.lineTo(size.width, size.height);
    // Pinta parte superior
    path.lineTo(size.width, 0);
    // Pinta parte inferior
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        ));
  }
}

class _HeaderPicoPainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    // Debería llamarse paint
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        ));
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    // Debería llamarse paint
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    // Las dos primeras coordenadas indica el punto de inflexión
    // y las dos últimas indica el punto donde acaba la línea
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ));
  }
}

class _HeaderWavePainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    // Debería llamarse paint
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Hacer footer waves
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.8,
    //     size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.7, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        child: CustomPaint(
          painter: _HeaderWaveGradientPainter(),
        ));
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  // El size es el tamaño indicado en el Container
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 55), radius: 180);

    final Gradient gradiente = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA)
        ],
        // Posición donde estarán los colores indicados en colors manteniendo
        // las posiciones anteriores Tienen que tener la misma longitud los
        // dos arrays
        stops: [
          0.2,
          0.5,
          1
        ]);

    // Debería llamarse paint
    final lapiz = new Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // Usa el color del gradiente por lo que no afecta este
    // lapiz.color = Color(0xff615AAB);
    // Stroke - pinta bordes
    // Fill - pinta relleno
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  // Le ponemos true ya que no es costoso redibujar este diseño
  // Para diseños más complejos habría que controlar cuando se redibuja
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
