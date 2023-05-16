abstract class Addnotestates {}

class AddNoteInitial extends Addnotestates {}

class AddedSuccsess extends Addnotestates {}

class Inprogress extends Addnotestates {}

class AddedFailure extends Addnotestates {
  final String errormsg;
  AddedFailure(this.errormsg);
}
