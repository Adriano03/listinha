import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: EdgeInsets.only(
                top: height * 0.092,
                left: width * 0.08,
                right: width * 0.08,
                bottom: height * 0.12,
              ),
              itemCount: 20,
              itemBuilder: (_, index) {
                final board = TaskBoard(
                  Uuid.v4(),
                  'Nova lista de tarefa 1',
                  tasks: [
                    Task(Uuid.v4(), '', completed: true),
                    Task(Uuid.v4(), '', completed: true),
                    Task(Uuid.v4(), '', completed: true),
                    Task(Uuid.v4(), '', completed: true),
                  ],
                );
                return TaskCard(board: board, height: 140,);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(
                        value: 0,
                        label: Text('Todos'),
                      ),
                      ButtonSegment(
                        value: 1,
                        label: Text('Pendentes'),
                      ),
                      ButtonSegment(
                        value: 2,
                        label: Text('Concluídas'),
                      ),
                      ButtonSegment(
                        value: 3,
                        label: Text('Desativadas'),
                      ),
                    ],
                    selected: const {1},
                    onSelectionChanged: (values) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
    );
  }
}
