part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  MainProvider _mainProvider;

  @override
  Widget build(BuildContext context) {
    _mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).name ?? 'not found'),
        // backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(child: const Text('Hola mundo')),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _mainProvider.changeLocale = 'en';
            // _mainProvider.changeLocale('en');
            print(_mainProvider.locale);
          }
          // backgroundColor: Colors.black,
          ),
    );
  }
}
