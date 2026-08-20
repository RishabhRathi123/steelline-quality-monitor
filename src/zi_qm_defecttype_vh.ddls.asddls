@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Defect Type Value Help'
@ObjectModel.resultSet.sizeCategory: #XS
@Search.searchable: true
define view entity ZI_QM_DefectType_VH
  as select from zqm_deftype
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'Description' ]
  key defect_type as DefectType,

      @Semantics.text: true
      description   as Description
}
