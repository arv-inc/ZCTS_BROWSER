*----------------------------------------------------------------------*
*       CLASS ZCL_BC009_REQUEST_B DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS zcl_bc009_request_b DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bc009_request .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.                    "ZCL_BC009_REQUEST_B DEFINITION



*----------------------------------------------------------------------*
*       CLASS ZCL_BC009_REQUEST_B IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS zcl_bc009_request_b IMPLEMENTATION.


  METHOD zif_bc009_request~move_as_copy.

*    DATA lt_range_korr TYPE RANGE OF trkorr.
*    FIELD-SYMBOLS <fs_range_korr> LIKE LINE OF lt_range_korr.

*    APPEND INITIAL LINE TO lt_range_korr ASSIGNING <fs_range_korr>.
*    <fs_range_korr>-sign = 'I'.
*    <fs_range_korr>-option = 'EQ'.
*    <fs_range_korr>-low = iv_trkorr.
*
*
*    SUBMIT zbc_009rep_transport
*      WITH s_trreqi IN lt_range_korr
*      WITH no_dis EQ abap_true
*      AND RETURN.

    DATA lo_transport_of_copies TYPE REF TO zif_bc009_tr_of_copies.
    DATA lv_clsname TYPE seoclsname VALUE 'ZCL_BC009_TR_OF_COPIES_B'.
    DATA lx_bc009 TYPE REF TO zcx_bc009_request.

    TRY.
        CREATE OBJECT lo_transport_of_copies TYPE (lv_clsname).
        lo_transport_of_copies->create_toc_n_move2target( iv_trkorr = iv_trkorr ).

      CATCH zcx_bc009_request INTO lx_bc009.

    ENDTRY.

  ENDMETHOD.                    "zif_bc009_request~move_as_copy
ENDCLASS.                    "ZCL_BC009_REQUEST_B IMPLEMENTATION
