import 'package:flutter/material.dart';

class Signature extends StatefulWidget {
  Signature({Key key}) : super(key: key);

  @override
  _SignatureState createState() => _SignatureState();
}



class _SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Signature"),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black12,
        child: new GestureDetector(
          //behavior: HitTestBehavior.opaque, 
          onTap: () {
            
          },
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
              
              _points = new List.from(_points)..add(Offset(localPosition.dx, localPosition.dy - 85));
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(painter: new SignaturePainter(_points)),
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _points = <Offset>[];
          });
        }, 
        child: Icon(Icons.clear),
      ),
       
    );
  }
}

class SignaturePainter extends CustomPainter {



  SignaturePainter(this.points) {
    //print("SignaturePainter contructor");
    
  }

  final List<Offset> points;



  @override
  void paint(Canvas canvas, Size size) {

    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }

  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}