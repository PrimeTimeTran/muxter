import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';
import 'package:turboship/data/models/entity_data.dart';

@injectable
class EntityMapper extends BaseDataMapper<EntityData, Entity>
    with DataMapperMixin {
  @override
  EntityData mapToData(Entity entity) {
    return EntityData(
      id: entity.id,
      firstName: entity.firstName,
      email: entity.email,
      lastName: entity.lastName,
      gender: entity.gender,
      city: entity.city,
      country: entity.country,
      jobTitle: entity.jobTitle,
      industry: entity.industry,
      house: entity.house,
      patronus: entity.patronus,
      dob: entity.dob,
      avatarUrl: entity.avatarUrl,
    );
  }

  List<Entity> mapToEntities(List<EntityData> dataList) {
    return dataList.map((data) {
      return Entity(
        id: data.id,
        firstName: data.firstName,
        email: data.email,
        lastName: data.lastName,
        gender: data.gender,
        city: data.city,
        country: data.country,
        jobTitle: data.jobTitle,
        industry: data.industry,
        house: data.house,
        patronus: data.patronus,
        dob: data.dob,
        avatarUrl: data.avatarUrl,
        // fanScore: data.fanScore ?? '',
        // languages: data.languages ?? '',
        // bookAppearances: data.bookAppearances ?? '',
        // topSpells: data.topSpells ?? '',
        // potions: data.potions ?? '',
        // charms: data.charms ?? '',
        // apparition: data.apparition ?? '',
      );
    }).toList();
  }

  @override
  Entity mapToEntity(EntityData data) {
    return Entity(
      id: data.id ?? '',
      email: data.email ?? '',
      firstName: data.firstName ?? '',
    );
  }
}
