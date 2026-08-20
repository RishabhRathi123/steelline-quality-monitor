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

      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_QM_DefectType_VH', element: 'DefectType' },
                                           qualifier: 'DEFTYPE',
                                           useForValidation: true }]
      DefectType,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_QM_Severity_VH', element: 'Severity' },
                                           qualifier: 'SEVERITY',
                                           useForValidation: true }]
      Severity,

      CommentText,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      LocalLastChangedAt
}
