import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zypher/Repository/category.dart';
import 'package:zypher/Repository/category_repo.dart';

class CategoryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchCategory extends CategoryEvent {
  final toLoad;
  FetchCategory(this.toLoad);
  @override
  // TODO: implement props
  List<Object> get props => [toLoad];
}

class CategoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryIsLoading extends CategoryState {}

class CategoryIsLoaded extends CategoryState {
  final List<Category> categoryList;
  CategoryIsLoaded(this.categoryList);
  List<Category> get getCategoryList => categoryList;
  @override
  // TODO: implement props
  List<Object> get props => [categoryList];
}

class CategoryIsNotLoading extends CategoryState {}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepo categoryRepo;
  CategoryBloc(this.categoryRepo);
  @override
  CategoryState get initialState => CategoryIsLoading();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    try {
      List<Category> categories = await categoryRepo.getCategories();
      yield CategoryIsLoaded(categories);
    } catch (_) {
      yield CategoryIsNotLoading();
    }
  }
}
