CLASS zcl_qm_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_qm_gen_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " ---- value help content ----
    DELETE FROM zqm_deftype.
    INSERT zqm_deftype FROM TABLE @( VALUE #(
      ( defect_type = 'CRCK' description = 'Crack' )
      ( defect_type = 'PORO' description = 'Porosity' )
      ( defect_type = 'SCRA' description = 'Scratch' )
      ( defect_type = 'INCL' description = 'Inclusion' )
      ( defect_type = 'DENT' description = 'Dent' )
    ) ).

    DELETE FROM zqm_severity.
    INSERT zqm_severity FROM TABLE @( VALUE #(
      ( severity = '1' description = 'Critical' )
      ( severity = '2' description = 'Major' )
      ( severity = '3' description = 'Minor' )
    ) ).

    DELETE FROM zquality_obs.

    GET TIME STAMP FIELD DATA(now).
    DATA(user) = cl_abap_context_info=>get_user_technical_name( ).

    INSERT zquality_obs FROM TABLE @( VALUE #(
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000001' material = 'MAT-304L-COIL' heat_number = 'H-2026-0412'
        defect_type = 'CRCK' severity = '1' status = 'O'
        comment_text = 'Hairline crack at coil edge, 40mm from head' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000002' material = 'MAT-316-PLATE' heat_number = 'H-2026-0413'
        defect_type = 'PORO' severity = '2' status = 'O'
        comment_text = 'Porosity cluster, mid-plate' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000003' material = 'MAT-430-STRIP' heat_number = 'H-2026-0414'
        defect_type = 'SCRA' severity = '3' status = 'A'
        comment_text = 'Light surface scratch, cosmetic only' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000004' material = 'MAT-321-SHEET' heat_number = 'H-2026-0415'
        defect_type = 'INCL' severity = '1' status = 'O'
        comment_text = 'Slag inclusion visible after pickling, reject band' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000005' material = 'MAT-409-COIL' heat_number = 'H-2026-0416'
        defect_type = 'DENT' severity = '3' status = 'C'
        comment_text = 'Handling dent near outer wrap, trimmed' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000006' material = 'MAT-2205-PLATE' heat_number = 'H-2026-0417'
        defect_type = 'CRCK' severity = '1' status = 'A'
        comment_text = 'Transverse crack 120mm, full plate quarantined' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000007' material = 'MAT-304L-STRIP' heat_number = 'H-2026-0418'
        defect_type = 'SCRA' severity = '3' status = 'O'
        comment_text = 'Roll mark repeating every 900mm' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000008' material = 'MAT-316L-BAR' heat_number = 'H-2026-0419'
        defect_type = 'PORO' severity = '2' status = 'O'
        comment_text = 'Sub-surface porosity found on UT scan' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000009' material = 'MAT-441-COIL' heat_number = 'H-2026-0420'
        defect_type = 'INCL' severity = '2' status = 'C'
        comment_text = 'Minor inclusions within tolerance, released' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000010' material = 'MAT-430-SHEET' heat_number = 'H-2026-0421'
        defect_type = 'DENT' severity = '3' status = 'O'
        comment_text = 'Corner dent from stacking' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000011' material = 'MAT-304L-PLATE' heat_number = 'H-2026-0422'
        defect_type = 'CRCK' severity = '1' status = 'O'
        comment_text = 'Edge crack propagating, stop the line' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000012' material = 'MAT-316-COIL' heat_number = 'H-2026-0423'
        defect_type = 'SCRA' severity = '2' status = 'A'
        comment_text = 'Deep scratch beyond finish spec' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000013' material = 'MAT-321-STRIP' heat_number = 'H-2026-0424'
        defect_type = 'PORO' severity = '3' status = 'O'
        comment_text = 'Isolated pinhole, monitoring' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000014' material = 'MAT-2205-COIL' heat_number = 'H-2026-0425'
        defect_type = 'INCL' severity = '1' status = 'O'
        comment_text = 'Heavy inclusion streak, customer-facing surface' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000015' material = 'MAT-409-PLATE' heat_number = 'H-2026-0426'
        defect_type = 'DENT' severity = '2' status = 'C'
        comment_text = 'Forklift contact damage, re-cut' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000016' material = 'MAT-316L-SHEET' heat_number = 'H-2026-0427'
        defect_type = 'CRCK' severity = '1' status = 'A'
        comment_text = 'Weld seam crack, batch held' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000017' material = 'MAT-441-STRIP' heat_number = 'H-2026-0428'
        defect_type = 'SCRA' severity = '3' status = 'O'
        comment_text = 'Faint scuff along one edge' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000018' material = 'MAT-304L-BAR' heat_number = 'H-2026-0429'
        defect_type = 'PORO' severity = '2' status = 'O'
        comment_text = 'Porosity at bar centre, pending UT recheck' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000019' material = 'MAT-430-COIL' heat_number = 'H-2026-0430'
        defect_type = 'DENT' severity = '3' status = 'C'
        comment_text = 'Minor dent, accepted by customer' )
      ( obs_uuid = cl_system_uuid=>create_uuid_x16_static( )
        obs_id = '00000020' material = 'MAT-316-PLATE' heat_number = 'H-2026-0431'
        defect_type = 'INCL' severity = '1' status = 'O'
        comment_text = 'Large inclusion at plate centre, scrap candidate' )
    ) ).

    " stamp the admin fields on every row
    UPDATE zquality_obs SET created_by = @user, created_at = @now,
                            last_changed_by = @user, last_changed_at = @now,
                            local_last_changed_by = @user, local_last_changed_at = @now.

    COMMIT WORK.
    out->write( |Quality observations inserted: { sy-dbcnt }| ).

  ENDMETHOD.
ENDCLASS.
