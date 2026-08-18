@EndUserText.label: 'Quality Observation - projection'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_QualityObs
  provider contract transactional_query
  as projection on ZI_QualityObs
{
  key ObservationUUID,

      @EndUserText.label: 'Observation ID'
      @Search.defaultSearchElement: true
      ObservationID,

      @EndUserText.label: 'Material'
      @Search.defaultSearchElement: true
      Material,

      @EndUserText.label: 'Heat Number'
      HeatNumber,

      @EndUserText.label: 'Defect Type'
      DefectType,

      @EndUserText.label: 'Severity'
      Severity,

      @EndUserText.label: 'Comment'
      CommentText,

      @EndUserText.label: 'Status'
      Status,

      @EndUserText.label: 'Reported By'
      CreatedBy,

      @EndUserText.label: 'Reported At'
      CreatedAt,

      LastChangedAt,
      LocalLastChangedAt
}
