import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:weather/ui/cities/cities_bloc.dart';
import 'package:weather/business/model/city.dart';
import 'package:weather/assembly/master_assembly.dart';
import 'package:flutter/services.dart';

class CitiesScreen extends StatefulWidget {
  final CitiesBloc citiesBloc;

  CitiesScreen(this.citiesBloc);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  CitiesBloc get _citiesBloc => this.widget.citiesBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.email,
            ),
            onPressed: () {
              _showEmailSupport();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return _buildRow(context, _citiesBloc.cities[i]);
        },
        itemCount: _citiesBloc.cities.length,
      ),
    );
  }

  Widget _buildRow(BuildContext context, City city) {
    return ListTile(
      title: Text(city.name),
      onTap: () {
        Navigator.of(context)
            .push(ScaleRoute(widget: MasterAssembly.sharedInstance.screensAssembly.weatherDetailsScreen(city)));
      },
    );
  }

  void _showEmailSupport() async {
    try {
      final Email email = Email(
        body: 'Email body',
        subject: 'Email subject',
        recipients: ['example@example.com'],
        cc: ['cc@example.com'],
        bcc: ['bcc@example.com'],
        attachmentPath: '/path/to/attachment.zip',
      );

      await FlutterEmailSender.send(email);
    } catch (e) {
      if (e is PlatformException && e.code == "not_available") {
        showErrorMessage("Email not configured");
      } else {
        showErrorMessage("Somethins wrong happened");
      }
    }
  }

  void showErrorMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text(errorMessage));
      },
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder:
            (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.50,
                    1.00,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}
