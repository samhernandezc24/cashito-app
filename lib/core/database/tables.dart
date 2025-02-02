import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'tables.g.dart';

// Character Limits
const int NAME_LIMIT = 250;
const int NOTE_LIMIT = 500;
const int COLOUR_LIMIT = 50;
const int CURRENCY_LIMIT = 3;

// Query Constants
const int DEFAULT_LIMIT = 50;
const int DEFAULT_OFFSET = 0;

enum BudgetReoccurrence { daily, weekly, monthly, yearly }
enum Theme { dark, light }

class IntListInColumnConverter extends TypeConverter<List<int>?, String?> {
  const IntListInColumnConverter();

  @override
  List<int>? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    return fromDb.split(',').map(int.parse).toList();
  }

  @override
  String? toSql(List<int>? value) {
    if (value == null || value.isEmpty) return null;
    return value.map((fk) => fk.toString()).join(',');
  }
}

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get transactionPk => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: NAME_LIMIT)();
  RealColumn get amount => real()();
  TextColumn get note => text().withLength(max: NOTE_LIMIT)();
  IntColumn get budgetFk => integer()();
  IntColumn get categoryFk => integer()();
  TextColumn get labelFks => text().map(const IntListInColumnConverter()).nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('TransactionCategory')
class Categories extends Table {
  IntColumn get categoryPk => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: NAME_LIMIT)();
  TextColumn get colour => text().withLength(max: COLOUR_LIMIT).nullable()();
  TextColumn get iconName => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('TransactionLabel')
class Labels extends Table {
  IntColumn get labelPk => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: NAME_LIMIT)();
  IntColumn get categoryFk => integer()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('Budget')
class Budgets extends Table {
  IntColumn get budgetPk => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: NAME_LIMIT)();
  RealColumn get amount => real()();
  TextColumn get colour => text().withLength(max: COLOUR_LIMIT)();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  IntColumn get reoccurrence => intEnum<BudgetReoccurrence>().nullable()();
  RealColumn get optimalDailySpending => real().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('UserSettings')
class Settings extends Table {
  IntColumn get userPk => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: NAME_LIMIT)();
  IntColumn get theme => intEnum<Theme>()();
  TextColumn get currency => text().withLength(max: CURRENCY_LIMIT)();
}

LazyDatabase _openConnection() {
  // la utilidad LazyDatabase nos permite encontrar la ubicación correcta para el archivo
  // de forma asíncrona.
  return LazyDatabase(() async {
    // pon el archivo de base de datos, llamado db.sqlite aquí, en la carpeta documents
    // de tu aplicación.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Transactions, Categories, Labels, Budgets, Settings])
class FinanceDatabase extends _$FinanceDatabase {
  FinanceDatabase(): super(_openConnection());

  // modificar este número cada vez que cambie o se agregue una definición de tabla
  @override
  int get schemaVersion => 1;
}
