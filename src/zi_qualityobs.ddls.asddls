@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Quality Observation - interface view'
define root view entity ZI_QualityObs
  as select from zquality_obs as Observation
{
      @EndUserText.label: 'Observation UUID'
  key obs_uuid              as ObservationUUID,

      @EndUserText.label: 'Observation ID'
      obs_id                as ObservationID,

      @EndUserText.label: 'Material'
      material              as Material,

      @EndUserText.label: 'Heat Number'
      heat_number           as HeatNumber,

      @EndUserText.label: 'Defect Type'
      defect_type           as DefectType,

      @EndUserText.label: 'Severity'
      severity              as Severity,

      @EndUserText.label: 'Comment'
      comment_text          as CommentText,

      @EndUserText.label: 'Status'
      status                as Status,

      @EndUserText.label: 'Reported By'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,

      @EndUserText.label: 'Reported At'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,

      @EndUserText.label: 'Changed By'
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,

      @EndUserText.label: 'Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
