## Выделение функциональных зависимостей

Будем основываться на функциональных зависимостях, полученных в прошлом домашнем задании.

```
StudentId -> StudentName, GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
CourseId, GroupId -> LecturerId
CourseId, StudentId -> Mark
GroupName -> GroupId
```

Также в прошлом же задании было выяснено, что ключом является `{StudentId, CourseId}`.

## Первая нормальная форма (1НФ)

Поскольку все атрибуты являются атомарными и неповторяющимися, а в прошлом домашнем задании мы выяснили, что у отношения существует ключ `{StudentId, CourseId}`, то данное отношение уже находится в 1НФ.

В итоге, нормализация принимает вид:

```
(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark) => (StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark)
```

А отношения принимают вид:

```
(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark)
```

## Вторая нормальная форма (2НФ)

Попробуем выяснить, от каких атрибутов, содержащихся в ключе, зависят остальные атрибуты. В скобках содержатся порядковые номера функциональных зависимостей, к которым идёт отсылка.

* `StudentName` и `GroupId` зависят от `StudentId` (#1)
* `GroupName` зависит от `StudentId`, поскольку `GroupName` зависит от `GroupId` (#2), а `GroupId` зависит от `StudentId`
* `LecturerId` зависит от обоих атрибутов ключа, поскольку `LecturerId` зависит от `CourseId` и `GroupId` (#5)
* `LecturerName` зависит от обоих атрибутов ключа, поскольку он зависит от `LecturerId` (#4)
* `CourseName` зависит от `CourseId` (#4)
* `Mark` зависит от `CourseId` и `StudentId` (#6)

Теперь представим эту же информацию в несколько более формальном виде. Символ `=>` обозначает зависимость.

```
StudentId => StudentName
StudentId => GroupId
StudentId => GroupId => GroupName
CourseId, StudentId => CourseId, GroupId => LecturerId
CourseId, StudentId => CourseId, GroupId => LecturerId => LecturerName
CourseId => CourseName
CourseId, StudentId => Mark
```

Теоретически мы могли бы декомпозировать данное отношение всего лишь на три новых с ключами `StudentId`, `CourseId` и `{StudentId, CourseId}`. Однако на практике часто полезно выделять менее отношения с меньшей глубиной зависимости. Поэтому мы выделим ещё одно отношение с ключом `{CourseId, GroupId}`.

Итоговые нормализация принимает вид:

```
(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark) => (StudentId, StudentName, GroupId, GroupName) ; (CourseId, CourseName) ; (CourseId, StudentId, Mark) ; (CourseId, GroupId, LecturerId, LecturerName)
```

А отношения принимают вид:

```
(StudentId, StudentName, GroupId, GroupName)
(CourseId, CourseName)
(CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId, LecturerName)
```

## Третья нормальная форма (3НФ)

Пользуясь промежуточными вычислениями во время приведения к 2НФ, заметим, что существуют два отношения, которые не находятся в 3НФ. Во-первых, это `(CourseId, GroupId, LecturerId, LecturerName)`, так как `LecturerName` транзитивно зависит от ключа. Во-вторых, это `(StudentId, StudentName, GroupId, GroupName)`, поскольку `GroupName` зависит от ключа. В таком случае, декомпозируем их по функциональным зависимостям `LecturerId -> LecturerName` и `GroupId -> GroupName` соответственно.

Нормализация будет происходить по следующей схеме:

```
(StudentId, StudentName, GroupId, GroupName) => (StudentId, StudentName, GroupId) ; (GroupId, GroupName)
(CourseId, CourseName) => (CourseId, CourseName)
(CourseId, StudentId, Mark) => (CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId, LecturerName) => (CourseId, GroupId, LecturerId) ; (LecturerId, LecturerName)
```

Итоговые отношения принимают вид:

```
(StudentId, StudentName, GroupId)
(GroupId, GroupName)
(CourseId, CourseName)
(CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId)
(LecturerId, LecturerName)
```

## Нормальная форма Бойса-Кодта (НФБК)

Перечислим все функциональные зависимости для каждого отношения.

```
{StudentId -> StudentName, GroupId}
{GroupId -> GroupName, GroupName -> GroupId}
{CourseId -> CourseName}
{CourseId, StudentsId -> Mark}
{CourseId, GroupId -> LecturerId}
{LecturerId -> LecturerName}
```

Как мы видим, во всех отношения, кроме второго, присутствует лишь одна функциональная зависимость. Следовательно, все эти отношения находятся в НФБК, поскольку ключ каждого из них и является левой частью единственной функциональной зависимости. Второе же отношение также находится в НФБК, поскольку и `GroupId`, и `GroupName` являются ключами в этом отношении.

В конечном итоге, все отношения уже находятся в НФБК. Нормализация примет следующий вид:

```
(StudentId, StudentName, GroupId) => (StudentId, StudentName, GroupId)
(GroupId, GroupName) => (GroupId, GroupName)
(CourseId, CourseName) => (CourseId, CourseName)
(CourseId, StudentId, Mark) => (CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId) => (CourseId, GroupId, LecturerId)
(LecturerId, LecturerName) => (LecturerId, LecturerName)
```

Итоговые отношения принимают вид:

```
(StudentId, StudentName, GroupId)
(GroupId, GroupName)
(CourseId, CourseName)
(CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId)
(LecturerId, LecturerName)
```

## Четвёртая нормальная форма (4НФ)

Поскольку во всех отношениях все многозначные зависимости являются функциональными, то отношения уже находятся в 4НФ. Поэтому нормализация будет иметь вид:

```
(StudentId, StudentName, GroupId) => (StudentId, StudentName, GroupId)
(GroupId, GroupName) => (GroupId, GroupName)
(CourseId, CourseName) => (CourseId, CourseName)
(CourseId, StudentId, Mark) => (CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId) => (CourseId, GroupId, LecturerId)
(LecturerId, LecturerName) => (LecturerId, LecturerName)
```

Итоговые отношения принимают вид:

```
(StudentId, StudentName, GroupId)
(GroupId, GroupName)
(CourseId, CourseName)
(CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId)
(LecturerId, LecturerName)
```

## Пятая нормальная форма (5НФ)

### Лемма 1

#### Утверждение

Если отношение `(A, B, C)` с единственной функциональной зависимостью `A, B -> C` находится в 4НФ, то оно находится и в 5НФ.

#### Доказательство

Попытаемся найти нетривиальные зависимости соединений в данном отношении. Так как отношение содержит всего лишь 3 атрибута, то единственные отношения, содержащие более одного атрибута, которые могли бы получиться в результате декомпозиций, выглядят как `(A, B), (A, C), (B, C)`. Если бы в результате декомпозиции мы бы получили отношение с одним атрибутом, мы бы гарантированно получили бы потерю связанности данных. Рассмотрим только вариант декомпозиции, когда мы получаем все эти отношения, поскольку в ином случае ситуация будет не лучше.

Попробуем построить пример отношения `(A, B, C)`. Добавим элементы [1, 1, 1], [1, 2, 2] и [2, 1, 2]. Изобразим в виде таблицы то, какие данные должны хранить отношения, полученные после декомпозиции.

| (A, B, C)                       | (A, B)                 | (A, C)                 | (B, C)                 | (A, B) + (A, C) + (B, C)                   |
| ------------------------------- | ---------------------- | ---------------------- | ---------------------- | ------------------------------------------ |
| [1, 1, 1], [1, 2, 2], [2, 1, 2] | [1, 1], [1, 2], [2, 1] | [1, 1], [1, 2], [2, 2] | [1, 1], [1, 2], [2, 2] | [1, 1, 1], [1, 1, 2], [1, 2, 2], [2, 1, 2] |

Как видно, `(A, B, C)` не эквивалентно `(A, B) + (A, C) + (B, C)`, поскольку последнее отношение содержит значения `[1, 1, 1]` и `[1, 1, 2]`, которые запрещены в отношении `(A, B, C)` в силу функциональной зависимости `A, B -> C`. Следовательно, такая декомпозиция несёт потери, а поскольку больше вариантов декомпозиции нет, то отношение `(A, B, C)` находится в 5НФ.

### Нормализация

Пользуясь первой теоремой Дейта-Фейгина, получаем, что отношения `(StudentId, StudentName, GroupId)`, `(GroupId, GroupName)`, `(CourseId, CourseName)` и `(LecturerId, LecturerName)` уже находятся в 5НФ, так как все ключи являются простыми (`StudentId`, `GroupId`, `CourseId` и `LecturerId` соответственно).

По лемме 1 отношения `(CourseId, StudentId, Mark)` и `(CourseId, GroupId, LecturerId)` так же находятся в 5НФ. Следовательно, все отношения уже находятся в 5НФ. Значит, нормализация будет иметь вид:

```
(StudentId, StudentName, GroupId) => (StudentId, StudentName, GroupId)
(GroupId, GroupName) => (GroupId, GroupName)
(CourseId, CourseName) => (CourseId, CourseName)
(CourseId, StudentId, Mark) => (CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId) => (CourseId, GroupId, LecturerId)
(LecturerId, LecturerName) => (LecturerId, LecturerName)
```

Итоговые отношения принимают вид:

```
(StudentId, StudentName, GroupId)
(GroupId, GroupName)
(CourseId, CourseName)
(CourseId, StudentId, Mark)
(CourseId, GroupId, LecturerId)
(LecturerId, LecturerName)
```
