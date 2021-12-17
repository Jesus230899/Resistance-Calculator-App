part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  const _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de resistencia'),
        // backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(child: const Text('Hola mundo')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: viewModel.increment,
        // backgroundColor: Colors.black,
      ),
    );
  }
}
