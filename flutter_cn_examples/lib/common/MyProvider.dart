import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({Key key, @required this.create, Widget child}) : super(key: key, child: child);


  final T create;

  @override
  bool updateShouldNotify( InheritedProvider oldWidget) {
    return true;
  }
}


Type _typeOf<T>() {
    return T;
  }

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.create, this.child}) : super(key: key);

  //final T Function(BuildContext context) create;
  final T create;
  final Widget child;

  

  static T of<T>(BuildContext context, {bool listen = true}) {
    final Type type = _typeOf<InheritedProvider<T>>();
    final InheritedProvider provider = listen ? 
      context.inheritFromWidgetOfExactType(type) as InheritedProvider<T> : 
      context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider<T>;
    return provider.create;

  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {

  void update() {
    setState(() {
      
    });
  }

  @override
  void initState() {
    widget.create.addListener(update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      create: widget.create,
      child: widget.child,
    );
  }

  

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.create != oldWidget.create) {
      oldWidget.create.removeListener(update);
      widget.create.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.create.removeListener(update);
    super.dispose();
  }
}

class Consumer<T> extends StatelessWidget {
  const Consumer({
    Key key, 
    @required this.builder, 
  }) : assert(builder != null), super(key: key);

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context, 
      ChangeNotifierProvider.of<T>(context),
    );
  }
}