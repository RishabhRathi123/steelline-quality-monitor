@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Severity Value Help'
@ObjectModel.resultSet.sizeCategory: #XS
@Search.searchable: true
define view entity ZI_QM_Severity_VH
  as select from zqm_severity
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'Description' ]
  key severity    as Severity,

      @Semantics.text: true
      description as Description
}
