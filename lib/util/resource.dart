class Resource<T> {
  T? data;
  String? error;

  Resource.success({required this.data});

  Resource.failure({required this.error});

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
  
}
