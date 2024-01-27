// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_result.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherHash() => r'3b8e489af8596d44cec3ad24fea0e41cc525a0f2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [weather].
@ProviderFor(weather)
const weatherProvider = WeatherFamily();

/// See also [weather].
class WeatherFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [weather].
  const WeatherFamily();

  /// See also [weather].
  WeatherProvider call(
    String city,
  ) {
    return WeatherProvider(
      city,
    );
  }

  @override
  WeatherProvider getProviderOverride(
    covariant WeatherProvider provider,
  ) {
    return call(
      provider.city,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherProvider';
}

/// See also [weather].
class WeatherProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [weather].
  WeatherProvider(
    String city,
  ) : this._internal(
          (ref) => weather(
            ref as WeatherRef,
            city,
          ),
          from: weatherProvider,
          name: r'weatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherHash,
          dependencies: WeatherFamily._dependencies,
          allTransitiveDependencies: WeatherFamily._allTransitiveDependencies,
          city: city,
        );

  WeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.city,
  }) : super.internal();

  final String city;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(WeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeatherProvider._internal(
        (ref) => create(ref as WeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        city: city,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _WeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherProvider && other.city == city;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WeatherRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `city` of this provider.
  String get city;
}

class _WeatherProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with WeatherRef {
  _WeatherProviderElement(super.provider);

  @override
  String get city => (origin as WeatherProvider).city;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
