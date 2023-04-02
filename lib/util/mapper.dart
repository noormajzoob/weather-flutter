abstract class Mapper<Entity, Dto>{
  Dto toDto(Entity entity);
  Entity toEntity(Dto dto);
}