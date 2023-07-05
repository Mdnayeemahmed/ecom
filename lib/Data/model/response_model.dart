class responsemodel {
  final int responsecode;
  final bool isSuccess;
  final dynamic responsebody;

  responsemodel(
      {required this.responsecode,
      required this.isSuccess,
      required this.responsebody});
}
