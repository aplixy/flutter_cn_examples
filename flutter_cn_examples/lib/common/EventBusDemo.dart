typedef void EventCallback(arg);

var bus = new EventBus();

class EventBus {
  EventBus._aaa();

  static EventBus _singleton = new EventBus._aaa();

  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;

    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(callback);
  }

  void off(eventName, [EventCallback callback]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;

    if (callback == null) {
      _emap[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;


    for (var i = list.length - 1; i > -1; --i) {
      list[i](arg);      
    }
  }


}