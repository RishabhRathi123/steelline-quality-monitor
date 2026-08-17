@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Quality Observation - interface view'
define root view entity ZI_QualityObs
  as select from zquality_obs as Observation
{
  key obs_uuid              as ObservationUUID,
      obs_id                as ObservationID,
      material              as Material,
      heat_number           as HeatNumber,
      defect_type           as DefectType,
      severity              as Severity,
      comment_text          as CommentText,
      status                as Status,

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
