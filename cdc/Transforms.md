## Kafka connect transforms
[官方文件](https://docs.confluent.io/platform/current/connect/transforms/overview.html)  
未說明的為Confluent connector的 transforms
- **Cast**：將欄位或整個鍵值轉換為特定類型（例如，將整數欄位轉換為更小的寬度）。
```json
"transforms": "Cast",
"transforms.Cast.type": "org.apache.kafka.connect.transforms.Cast$Value",
"transforms.Cast.spec": "ID:string,score:float64"
```
- **Drop**：刪除記錄中的鍵或值，並將其設為空值（null）。
- **DropHeaders**：目前不適用於受管連接器。刪除每個記錄中的一個或多個標頭。
```json
"transforms": "dropAppIdHeader",
"transforms.dropAppIdHeader.type": "org.apache.kafka.connect.transforms.DropHeaders",
"transforms.dropAppIdHeader.headers": "app.id,txn.id"
```
- **EventRouter**：僅適用於受管的 Debezium 連接器。使用正則表達式配置選項路由 Debezium 外部事件。
- **ExtractField**：從結構化的資料（Struct，具有模式）或無模式資料的映射（Map）中提取指定欄位。任何空值會直接傳遞。
```json
"transforms": "ExtractField",
"transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
"transforms.ExtractField.field": "id"
```
- **ExtractTopic**：使用記錄鍵或值導出的新主題替換記錄主題。
- **Filter Apache Kafka)**：丟棄所有記錄，通常與條件 (Predicate) 一起使用。
```json
"transforms": "Filter",
"transforms.Filter.type": "org.apache.kafka.connect.transforms.Filter",
"transforms.Filter.predicate": "IsFoo",
"transforms.Filter.negate": "true",

"predicates": "IsFoo",
"predicates.IsFoo.type": "org.apache.kafka.connect.transforms.predicates.TopicNameMatches",
"predicates.IsFoo.pattern": "foo"
```
- **Filter Confluent)**：包括或丟棄符合可配置條件 (filter.condition) 的記錄。
- **Flatten**：將嵌套的數據結構扁平化。會生成由各層級欄位名稱按設定的分隔字元連接而成的新名稱。
```json
"transforms": "flatten",
"transforms.flatten.type": "org.apache.kafka.connect.transforms.Flatten$Value",
"transforms.flatten.delimiter": "."
``` 
- **GzipDecompress**：目前不適用於受管連接器。對整個 byteArray 鍵或值進行 Gzip 解壓縮。
- **HeaderFrom**：目前不適用於受管連接器。將記錄鍵或值中的欄位移動或複製到記錄標頭中。
```json
"transforms": "moveFieldsToHeader",
"transforms.moveFieldsToHeader.type": "org.apache.kafka.connect.transforms.HeaderFrom$Value",
"transforms.moveFieldsToHeader.fields": "id,ts",
"transforms.moveFieldsToHeader.headers": "record_id,event_timestamp",
"transforms.moveFieldsToHeader.operation": "move"
```
- **HoistField**：使用指定欄位名稱將資料包裝為結構化數據（Struct，具模式）或映射（Map，無模式）。
```json 
"transforms": "HoistField",
"transforms.HoistField.type": "org.apache.kafka.connect.transforms.HoistField$Value",
"transforms.HoistField.field": "line"
```
- **InsertField**：使用記錄的元數據屬性或設定的靜態值插入欄位。
```json
"transforms": "InsertField",
"transforms.InsertField.type": "org.apache.kafka.connect.transforms.InsertField$Value",
"transforms.InsertField.static.field": "MessageSource",
"transforms.InsertField.static.value": "Kafka Connect framework"
```
- **InsertHeader**：目前不適用於受管連接器。將字面值插入為記錄標頭。
```json
"transforms": "insertAppIdHeader",
"transforms.insertAppIdHeader.type": "org.apache.kafka.connect.transforms.InsertHeader",
"transforms.insertAppIdHeader.header": "app.id",
"transforms.insertAppIdHeader.value.literal": "best-app-ever"
```
- **MaskField**：用與欄位類型匹配的有效空值遮罩指定欄位。
```json
"transforms": "MaskField",
"transforms.MaskField.type": "org.apache.kafka.connect.transforms.MaskField$Value",
"transforms.MaskField.fields": "string_field"

"transforms.PhoneMask.type": "org.apache.kafka.connect.transforms.MaskField$Value",
"transforms.PhoneMask.fields": "office,mobile",
"transforms.PhoneMask.replacement": "+0-000-000-0000"
```
- **MessageTimeStampRouter**：根據原始主題值及記錄的時間戳欄位更新記錄的主題欄位。
- **RegexRouter**：目前不適用於受管連接器。使用配置的正則表達式和替換字串更新記錄主題。
```json
"transforms": "dropPrefix",
"transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
"transforms.dropPrefix.regex": "soe-(.*)",
"transforms.dropPrefix.replacement": "$1" 
```
- **ReplaceField Apache Kafka)**：過濾或重新命名欄位。
```json
"transforms": "ReplaceField",
"transforms.ReplaceField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
"transforms.ReplaceField.exclude": "c2" 
```
- **ReplaceField Confluent)**：過濾或重新命名嵌套欄位。
- **SetSchemaMetadata**：設置記錄鍵或值模式的名稱、版本或兩者。
```json
"transforms": "SetSchemaMetadata",
"transforms.SetSchemaMetadata.type": "org.apache.kafka.connect.transforms.SetSchemaMetadata$Value",
"transforms.SetSchemaMetadata.schema.name": "order-value"
"transforms.SetSchemaMetadata.schema.version": "2"
```
- **TimestampConverter**：在 Unix 紀元、字串、Connect 日期和時間戳類型之間轉換時間戳。
```json
"transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
"transforms.TimestampConverter.field": "event_date_long",
"transforms.TimestampConverter.unix.precision": "microseconds",
"transforms.TimestampConverter.target.type": "Timestamp"
```
- **TimestampRouter**：根據原始主題值及記錄的時間戳更新記錄的主題欄位。
```json
"transforms": "TimestampRouter",
"transforms.TimestampRouter.type": "org.apache.kafka.connect.transforms.TimestampRouter",
"transforms.TimestampRouter.topic.format": "foo-${topic}-${timestamp}",
"transforms.TimestampRouter.timestamp.format": "YYYYMM"
```
- **TombstoneHandler**：處理墓碑記錄（定義為整個值欄位為 null 的記錄，無論是否有值模式）。
- **TopicRegexRouter**：僅適用於受管來源連接器。使用配置的正則表達式和替換字串更新記錄主題。
- **ValueToKey**：使用記錄值中的某些欄位替換記錄鍵，形成新的鍵。
```json
"transforms": "ValueToKey",
"transforms.ValueToKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
"transforms.ValueToKey.fields": "userId,city,state"
```