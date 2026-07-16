// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StatusEntriesTable extends StatusEntries
    with TableInfo<$StatusEntriesTable, StatusEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatusEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _docUrlMeta = const VerificationMeta('docUrl');
  @override
  late final GeneratedColumn<String> docUrl = GeneratedColumn<String>(
    'doc_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    code,
    title,
    category,
    description,
    imageUrl,
    docUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'status_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatusEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('doc_url')) {
      context.handle(
        _docUrlMeta,
        docUrl.isAcceptableOrUnknown(data['doc_url']!, _docUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  StatusEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatusEntryRow(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      docUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doc_url'],
      ),
    );
  }

  @override
  $StatusEntriesTable createAlias(String alias) {
    return $StatusEntriesTable(attachedDatabase, alias);
  }
}

class StatusEntryRow extends DataClass implements Insertable<StatusEntryRow> {
  final int code;
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final String? docUrl;
  const StatusEntryRow({
    required this.code,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.docUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<int>(code);
    map['title'] = Variable<String>(title);
    map['category'] = Variable<String>(category);
    map['description'] = Variable<String>(description);
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || docUrl != null) {
      map['doc_url'] = Variable<String>(docUrl);
    }
    return map;
  }

  StatusEntriesCompanion toCompanion(bool nullToAbsent) {
    return StatusEntriesCompanion(
      code: Value(code),
      title: Value(title),
      category: Value(category),
      description: Value(description),
      imageUrl: Value(imageUrl),
      docUrl: docUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(docUrl),
    );
  }

  factory StatusEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatusEntryRow(
      code: serializer.fromJson<int>(json['code']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      description: serializer.fromJson<String>(json['description']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      docUrl: serializer.fromJson<String?>(json['docUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<int>(code),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'description': serializer.toJson<String>(description),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'docUrl': serializer.toJson<String?>(docUrl),
    };
  }

  StatusEntryRow copyWith({
    int? code,
    String? title,
    String? category,
    String? description,
    String? imageUrl,
    Value<String?> docUrl = const Value.absent(),
  }) => StatusEntryRow(
    code: code ?? this.code,
    title: title ?? this.title,
    category: category ?? this.category,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    docUrl: docUrl.present ? docUrl.value : this.docUrl,
  );
  StatusEntryRow copyWithCompanion(StatusEntriesCompanion data) {
    return StatusEntryRow(
      code: data.code.present ? data.code.value : this.code,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      docUrl: data.docUrl.present ? data.docUrl.value : this.docUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatusEntryRow(')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('docUrl: $docUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, title, category, description, imageUrl, docUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusEntryRow &&
          other.code == this.code &&
          other.title == this.title &&
          other.category == this.category &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.docUrl == this.docUrl);
}

class StatusEntriesCompanion extends UpdateCompanion<StatusEntryRow> {
  final Value<int> code;
  final Value<String> title;
  final Value<String> category;
  final Value<String> description;
  final Value<String> imageUrl;
  final Value<String?> docUrl;
  const StatusEntriesCompanion({
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.docUrl = const Value.absent(),
  });
  StatusEntriesCompanion.insert({
    this.code = const Value.absent(),
    required String title,
    required String category,
    required String description,
    required String imageUrl,
    this.docUrl = const Value.absent(),
  }) : title = Value(title),
       category = Value(category),
       description = Value(description),
       imageUrl = Value(imageUrl);
  static Insertable<StatusEntryRow> custom({
    Expression<int>? code,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<String>? docUrl,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (docUrl != null) 'doc_url': docUrl,
    });
  }

  StatusEntriesCompanion copyWith({
    Value<int>? code,
    Value<String>? title,
    Value<String>? category,
    Value<String>? description,
    Value<String>? imageUrl,
    Value<String?>? docUrl,
  }) {
    return StatusEntriesCompanion(
      code: code ?? this.code,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      docUrl: docUrl ?? this.docUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (docUrl.present) {
      map['doc_url'] = Variable<String>(docUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusEntriesCompanion(')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('docUrl: $docUrl')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _statusCodeMeta = const VerificationMeta(
    'statusCode',
  );
  @override
  late final GeneratedColumn<int> statusCode = GeneratedColumn<int>(
    'status_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [statusCode, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('status_code')) {
      context.handle(
        _statusCodeMeta,
        statusCode.isAcceptableOrUnknown(data['status_code']!, _statusCodeMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {statusCode};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      statusCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_code'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int statusCode;
  final DateTime addedAt;
  const Favorite({required this.statusCode, required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['status_code'] = Variable<int>(statusCode);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      statusCode: Value(statusCode),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      statusCode: serializer.fromJson<int>(json['statusCode']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'statusCode': serializer.toJson<int>(statusCode),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith({int? statusCode, DateTime? addedAt}) => Favorite(
    statusCode: statusCode ?? this.statusCode,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      statusCode: data.statusCode.present
          ? data.statusCode.value
          : this.statusCode,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('statusCode: $statusCode, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(statusCode, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.statusCode == this.statusCode &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> statusCode;
  final Value<DateTime> addedAt;
  const FavoritesCompanion({
    this.statusCode = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.statusCode = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  static Insertable<Favorite> custom({
    Expression<int>? statusCode,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (statusCode != null) 'status_code': statusCode,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? statusCode,
    Value<DateTime>? addedAt,
  }) {
    return FavoritesCompanion(
      statusCode: statusCode ?? this.statusCode,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (statusCode.present) {
      map['status_code'] = Variable<int>(statusCode.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('statusCode: $statusCode, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StatusEntriesTable statusEntries = $StatusEntriesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final StatusDao statusDao = StatusDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    statusEntries,
    favorites,
  ];
}

typedef $$StatusEntriesTableCreateCompanionBuilder =
    StatusEntriesCompanion Function({
      Value<int> code,
      required String title,
      required String category,
      required String description,
      required String imageUrl,
      Value<String?> docUrl,
    });
typedef $$StatusEntriesTableUpdateCompanionBuilder =
    StatusEntriesCompanion Function({
      Value<int> code,
      Value<String> title,
      Value<String> category,
      Value<String> description,
      Value<String> imageUrl,
      Value<String?> docUrl,
    });

class $$StatusEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $StatusEntriesTable> {
  $$StatusEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get docUrl => $composableBuilder(
    column: $table.docUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StatusEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $StatusEntriesTable> {
  $$StatusEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get docUrl => $composableBuilder(
    column: $table.docUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatusEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatusEntriesTable> {
  $$StatusEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get docUrl =>
      $composableBuilder(column: $table.docUrl, builder: (column) => column);
}

class $$StatusEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatusEntriesTable,
          StatusEntryRow,
          $$StatusEntriesTableFilterComposer,
          $$StatusEntriesTableOrderingComposer,
          $$StatusEntriesTableAnnotationComposer,
          $$StatusEntriesTableCreateCompanionBuilder,
          $$StatusEntriesTableUpdateCompanionBuilder,
          (
            StatusEntryRow,
            BaseReferences<_$AppDatabase, $StatusEntriesTable, StatusEntryRow>,
          ),
          StatusEntryRow,
          PrefetchHooks Function()
        > {
  $$StatusEntriesTableTableManager(_$AppDatabase db, $StatusEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatusEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatusEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatusEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> code = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String?> docUrl = const Value.absent(),
              }) => StatusEntriesCompanion(
                code: code,
                title: title,
                category: category,
                description: description,
                imageUrl: imageUrl,
                docUrl: docUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> code = const Value.absent(),
                required String title,
                required String category,
                required String description,
                required String imageUrl,
                Value<String?> docUrl = const Value.absent(),
              }) => StatusEntriesCompanion.insert(
                code: code,
                title: title,
                category: category,
                description: description,
                imageUrl: imageUrl,
                docUrl: docUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StatusEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatusEntriesTable,
      StatusEntryRow,
      $$StatusEntriesTableFilterComposer,
      $$StatusEntriesTableOrderingComposer,
      $$StatusEntriesTableAnnotationComposer,
      $$StatusEntriesTableCreateCompanionBuilder,
      $$StatusEntriesTableUpdateCompanionBuilder,
      (
        StatusEntryRow,
        BaseReferences<_$AppDatabase, $StatusEntriesTable, StatusEntryRow>,
      ),
      StatusEntryRow,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> statusCode,
      Value<DateTime> addedAt,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> statusCode,
      Value<DateTime> addedAt,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> statusCode = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) =>
                  FavoritesCompanion(statusCode: statusCode, addedAt: addedAt),
          createCompanionCallback:
              ({
                Value<int> statusCode = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion.insert(
                statusCode: statusCode,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StatusEntriesTableTableManager get statusEntries =>
      $$StatusEntriesTableTableManager(_db, _db.statusEntries);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
