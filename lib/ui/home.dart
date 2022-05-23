import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../domain/states/home_state.dart';
import '../internal/dependencies/home_module.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lonController = TextEditingController();

  late HomeState _homeState;

  @override
  void initState() {
    _homeState = HomeModule.homeState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getDay,
              child: const Text('Получить'),
            ),
            const SizedBox(height: 20),
            _getDayInfo(),
          ],
        ),
      ),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Широта'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lonController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo() {
    return Observer(
      builder: (_) {
        if (_homeState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (_homeState.day == null) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Восход: ${_homeState.day!.sunrise.toLocal()}'),
            Text('Заход: ${_homeState.day!.sunset.toLocal()}'),
            Text('Полдень: ${_homeState.day!.solarNoon.toLocal()}'),
            Text(
                'Продолжительность: ${Duration(seconds: _homeState.day!.dayLength)}'),
          ],
        );
      },
    );
  }

  void _getDay() {
    // здесь получаем данные
    final lat = double.tryParse(_latController.text);
    final lon = double.tryParse(_lonController.text);
    _homeState.getDay(latitude: lat!, longitude: lon!);
  }
}
