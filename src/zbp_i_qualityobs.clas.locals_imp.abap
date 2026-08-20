CLASS lhc_Observation DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF obs_status,
        open         TYPE c LENGTH 1 VALUE 'O',
        acknowledged TYPE c LENGTH 1 VALUE 'A',
        closed       TYPE c LENGTH 1 VALUE 'C',
      END OF obs_status.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Observation RESULT result.
    METHODS setDefaults FOR DETERMINE ON MODIFY
      keys FOR Observation~setDefaults.
    METHODS get_instance_features FOR INSTANCE FEATURES
      Importing keys REQUEST requested_features FOR Observation RESULT result.
    METHODS validateseverity FOR VALIDATE ON SAVE
      keys FOR observation~validateseverity.

ENDCLASS.

CLASS lhc_Observation IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setDefaults.

    READ ENTITIES OF ZI_QualityObs IN LOCAL MODE
      ENTITY Observation
        FIELDS ( ObservationID Status ) WITH CORRESPONDING #( keys )
      RESULT DATA(observations).

    " idempotency guard - determinations fire more than once under draft
    DELETE observations WHERE Status IS NOT INITIAL.
    CHECK observations IS NOT INITIAL.

    SELECT SINGLE FROM zquality_obs   FIELDS MAX( obs_id )        INTO @DATA(max_active).
    SELECT SINGLE FROM zquality_obs_d FIELDS MAX( observationid ) INTO @DATA(max_draft).

    DATA(max_id) = max_active.
    IF max_draft > max_id.
      max_id = max_draft.
    ENDIF.

    MODIFY ENTITIES OF ZI_QualityObs IN LOCAL MODE
      ENTITY Observation
        UPDATE FIELDS ( ObservationID Status )
        WITH VALUE #( FOR obs IN observations INDEX INTO i
                      ( %tky          = obs-%tky
                        ObservationID = max_id + i
                        Status        = obs_status-open ) )
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ZI_QualityObs IN LOCAL MODE
      ENTITY Observation
        FIELDS ( Severity ) WITH CORRESPONDING #( keys )
      RESULT DATA(observations).

    result = VALUE #( FOR obs IN observations
                      ( %tky               = obs-%tky
                        %field-CommentText = COND #( WHEN obs-Severity = '1'
                                                     THEN if_abap_behv=>fc-f-mandatory
                                                     ELSE if_abap_behv=>fc-f-unrestricted ) ) ).

  ENDMETHOD.

  METHOD validateSeverity.

    READ ENTITIES OF ZI_QualityObs IN LOCAL MODE
      ENTITY Observation
        FIELDS ( Severity CommentText ) WITH CORRESPONDING #( keys )
      RESULT DATA(observations).

    LOOP AT observations INTO DATA(obs).

      " clear any previous message for this state area, unconditionally
      APPEND VALUE #( %tky        = obs-%tky
                      %state_area = 'VALIDATE_SEVERITY' ) TO reported-observation.

      IF obs-Severity = '1' AND obs-CommentText IS INITIAL.

        APPEND VALUE #( %tky = obs-%tky ) TO failed-observation.

        APPEND VALUE #( %tky                 = obs-%tky
                        %state_area          = 'VALIDATE_SEVERITY'
                        %msg                 = new_message_with_text(
                                                 severity = if_abap_behv_message=>severity-error
                                                 text     = |A critical observation must have a comment| )
                        %element-CommentText = if_abap_behv=>mk-on ) TO reported-observation.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
