# Решение

## Функциональные зависимости

```
StudentId -> StudentName, GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
CourseId, GroupId -> LecturerId
CourseId, StudentId -> Mark
GroupName -> GroupId
```

## Ключи

1. Определим тривиальный надключ `(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark)`.
2. Зная, что `{CourseId, StudentId -> Mark}`, убираем `Mark`. Надключ принимает вид `(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName)`.
3. Зная, что `{LecturerId -> LecturerName}`, убираем `LecturerName`. Надключ принимает вид `(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId)`.
4. Зная, что `{CourseId -> CourseName}`, убираем `CourseName`. Надключ принимает вид `(StudentId, StudentName, GroupId, GroupName, CourseId, LecturerId)`.
5. Зная, что `{GroupId -> GroupName}`, убираем `GroupName`. Надключ принимает вид `(StudentId, StudentName, GroupId, CourseId, LecturerId)`.
6. Зная, что `{CourseId, GroupId -> LecturerId}`, убираем `LecturerId`. Надключ принимает вид `(StudentId, StudentName, GroupId, CourseId)`.
7. Зная, что `{StudentId -> StudentName, GroupId}`, убираем `StudentName` и `GroupId`. Надключ принимает вид `(StudentId, CourseId)`.
8. Оставшиеся атрибуты `StudentId` и `CourseId` не содержатся в правой части ни одной функциональной зависимости. Отсюда можно сделать вывод о том, что данные атрибуты независимы друг от друга, а следовательно наш надключ `(StudentId, CourseId)` является ключом.

Результат:

```
(StudentId, CourseId)
```

## Замыкания

### GroupId, CourseId

```
{GroupId, CourseId}
{GroupId, CourseId, GroupName}
{GroupId, CourseId, GroupName, CourseName}
{GroupId, CourseId, GroupName, CourseName, LecturerId}
{GroupId, CourseId, GroupName, CourseName, LecturerId, LecturerName}
```

### StudentId, CourseId

```
{StudentId, CourseId}
{StudentId, CourseId, StudentName, GroupId}
{StudentId, CourseId, StudentName, GroupId, GroupName}
{StudentId, CourseId, StudentName, GroupId, GroupName, CourseName}
{StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, LecturerId}
{StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, LecturerId, LecturerName}
{StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, LecturerId, LecturerName, Mark}
```

### StudentId, LecturerId

```
{StudentId, LecturerId}
{StudentId, LecturerId, StudentName, GroupId}
{StudentId, LecturerId, StudentName, GroupId, GroupName}
{StudentId, LecturerId, StudentName, GroupId, GroupName, LecturerName}
```

## Неприводимое множество

### Расщепление правых частей

На этапе расщепления нас будет интересовать лишь зависимость `{StudentId -> StudentName, GroupId}`, поскольку это единственная зависимость, содержащая в правой части более одного атрибута. Результат:

```
StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
CourseId, GroupId -> LecturerId
CourseId, StudentId -> Mark
GroupName -> GroupId
```

### Удаление атрибута A ∪ {x} -> B

1. Рассмотрим `{CourseId, GroupId -> LecturerId}`. Поскольку это единственная зависимость, содержащая в правой части `LecturerId`, то ни один атрибут удалить из левой части нельзя.
2. `{CourseId, StudentId -> Mark}`. Поскольку это единственная зависимость, содержащая в правой части `Mark`, то ни один атрибут удалить из левой части нельзя.
3. Все остальные зависимости содержат только один атрибут в левой части.

Результат:

```
StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
CourseId, GroupId -> LecturerId
CourseId, StudentId -> Mark
GroupName -> GroupId
```

### Удаление правила A -> B

В нашем случае достаточно заметить, что все выражения в правых частях зависимостей встречаются единожды, однако у нас присутствует циклическая зависимость `{GroupId -> GroupName, GroupName -> GroupId}`. Поскольку `GroupName` больше не присутствует ни в какой другой функциональной зависимости, достаточно удалить `GroupName -> GroupId`. Результат:

```
StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
CourseId, GroupId -> LecturerId
CourseId, StudentId -> Mark
```

