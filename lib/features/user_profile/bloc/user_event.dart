import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUserProfile extends UserEvent {
  final String handle;

  FetchUserProfile(this.handle);

  @override
  List<Object> get props => [handle];
}
