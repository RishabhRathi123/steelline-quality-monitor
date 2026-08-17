@EndUserText.label: 'Quality Observation - projection'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_QualityObs
  provider contract transactional_query
  as projection on ZI_QualityObs
{
  key ObservationUUID,
      @Search.defaultSearchElement: true
      ObservationID,
      @Search.defaultSearchElement: true
      Material,
      HeatNumber,
      DefectType,
      Severity,
      CommentText,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      LocalLastChangedAt
}
