
import 'dart:async';

enum CounterEvent
{
  Increment,
  Decrement,
  Login
}
class CounterBloc
{
  final _eventcontroller = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventstream => _eventcontroller.stream;
  Sink<CounterEvent> get eventsink => _eventcontroller.sink;

  final _countercontroller = StreamController<int>();
  Stream<int> get counterstream => _countercontroller.stream;
  Sink<int> get countersink => _countercontroller.sink;

  int counter=0;

  CounterBloc() {
    eventstream.listen((CounterEvent event) {
      /// This call back will be called when new event will be added from sink

      if(event == CounterEvent.Increment){
        /// if event is CounterEvent.Increment then increment the counter and
        /// send the updated counter using counter stream
        ++counter;
        countersink.add(counter);
      }
      if(event == CounterEvent.Decrement){
        /// if event is CounterEvent.Increment then increment the counter and
        /// send the updated counter using counter stream
        --counter;
        countersink.add(counter);
      }

    });
  }

  void dispose()
  {
    _eventcontroller.close();
    _countercontroller.close();
  }
}
