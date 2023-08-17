
import 'dart:async' as _i5;

import 'package:todo_app/core/errors/failure.dart' as _i6;
import 'package:todo_app/features/domain/repositories/todo_repository.dart'
    as _i2;

import 'package:todo_app/features/domain/usecases/delete_task_usecase.dart'
    as _i4; 
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

class _FakeTodoRepository_0 extends _i1.SmartFake
    implements _i2.TaskRepository {
  _FakeTodoRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DeleteTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTask extends _i1.Mock implements _i4.DeleteTask {
  MockDeleteTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TaskRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTodoRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TaskRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> call(String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [taskId],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [taskId],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}