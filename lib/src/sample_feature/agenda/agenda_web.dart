import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class AgendaWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contr = EventController();

    contr.add(CalendarEventData(
        title: 'vacinação do rex', date: DateTime(2024, 11, 11)));
    contr.add(CalendarEventData(
        title: 'vacinação da lily', date: DateTime(2024, 11, 15)));
    // Inicializa o provedor de eventos
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: MonthView(
        // Controlador de eventos
        controller: contr,
        // showLiveTimeLineInAllDays: true,
        headerStyle: const HeaderStyle(
          // backgroundColor: Colors.blue,
          headerTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        cellAspectRatio: 2,
        cellBuilder: (date, events, boundry, start, end) {
          return events.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blueAccent,
                  child: Text(
                    date.day.toString() + ' ' + events.first.title,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Container(
                  child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.black),
                ));
        },
        onEventTap: (events, date) {
          // Lógica ao tocar em um evento
          if (events != null) {
            final event = events;
            print('Evento selecionado: ${event.title}');
          }
        },
        onCellTap: (_, date) {
          // Lógica ao tocar em uma data sem eventos
          print('Data selecionada: $date');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar novo evento
          // final controller = EventControllerProvider.of(context).controller;
          // controller.add(
          //   CalendarEventData(
          //     title: 'Novo Evento',
          //     description: 'Descrição do evento',
          //     date: DateTime.now(),
          //     event: "MeuEvento",
          //   ),
          // );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
