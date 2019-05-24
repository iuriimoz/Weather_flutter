import 'package:weather/assembly/screens_assembly.dart';
import 'package:weather/assembly/services_assembly.dart';

class MasterAssembly {

  static final MasterAssembly _sharedInstance = MasterAssembly._privateConstructor();

  static MasterAssembly get sharedInstance { return _sharedInstance; }

  ServicesAssembly _servicesAssembly;
  ScreensAssembly _screensAssembly;

  MasterAssembly._privateConstructor() {
    _servicesAssembly = ServicesAssembly();
    _screensAssembly = ScreensAssembly(_servicesAssembly);
  }

  // Interface

  ServicesAssembly get servicesAssembly => _servicesAssembly;

  ScreensAssembly get screensAssembly => _screensAssembly;
}
