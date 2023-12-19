import 'package:turboship/all.dart';

typedef Decoder<T> = T Function(Object? data);

abstract class BaseSuccessResponseMapper<I, O> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    switch (type) {
      case SuccessResponseMapperType.jsonObject:
        return JsonObjectSuccessResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonArray:
        return JsonArraySuccessResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.pagedListJsonArray:
        return RecordsJsonArraySuccessResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.dataJsonObject:
        return DataJsonObjectResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.dataJsonArray:
        return DataJsonArrayResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.plain:
        return PlainResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
    }
  }

  O mapToDataModel(dynamic response, Decoder<I>? decoder);
}

enum SuccessResponseMapperType {
  jsonObject,
  jsonArray,
  pagedListJsonArray,
  dataJsonObject,
  dataJsonArray,
  plain,
}
