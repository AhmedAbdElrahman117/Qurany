class CategoryStates {}

class CategoryInitial extends CategoryStates {}

class CategoryLoading extends CategoryStates {}

class CategoryFailed extends CategoryStates {
  final String errorMessage;

  CategoryFailed({required this.errorMessage});
}

class CategorySuccess extends CategoryStates {
  final List<String> categories;

  CategorySuccess({required this.categories});
}
