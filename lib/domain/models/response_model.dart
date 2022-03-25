class ResponseModel{
  ResponseModel({
    this.data,
    this.hasError,
    this.errorCode
});
  final String? data;
  final bool? hasError;
  final int? errorCode;
}