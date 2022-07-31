class MoviesAppException implements Exception{
  final String message;
  final dynamic innerException;
  MoviesAppException(this.message, {this.innerException});
}
