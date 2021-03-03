create package           STOCK_API_PKG  AS  
/*==============================================================  
Created by Abdulkareem 04/01/2021
This Package will handle all the procedures
and functions which will be used with Calling Web Services for Stock module
==============================================================*/
type ref_cur is ref cursor ;--sys_refcursor;
--===================================================================================
-- stk_configuration 
--===================================================================================                             
procedure add_stk_conf_prc (     a_storage_id			     in     number      default null
                                ,a_param_id        		     in     number
                                ,a_param_value			     in     number
                                ,a_status				     in     number      
                                ,a_trans_date                in     varchar2    
                                ,a_data_source               in     number
                                ,a_user_id                   in     number  
                                ,a_id                        out    number
                                ,a_status_code               out    number
                                ,a_result                    out    ref_cur
                              );

--------------------------------------------------------------------------------
procedure edit_stk_conf_prc    ( a_id                        in     number
                                ,a_storage_id			     in     number      
                                ,a_param_id        		     in     number
                                ,a_status				     in     number      
                                ,a_param_value			     in     number
                                ,a_trans_date                in     varchar2    
                                ,a_data_source               in     number
                                ,a_user_id                   in     number  
                                ,a_status_code               out    number
                                ,a_result                    out    ref_cur
                              );
--------------------------------------------------------------------------------
procedure stk_conf_prc (     a_storage_id			     in     number      default null
                            ,a_param_id        		     in     number
                            ,a_param_value			     in     number
                            ,a_status				     in     number      
                            ,a_trans_date                in     varchar2    
                            ,a_data_source               in     number
                            ,a_user_id                   in     number  
                            ,a_id                        in out number
                            ,a_status_code               out    number
                            ,a_result                    out    ref_cur
                       ); 
--===================================================================================
-- stk_op_bal_hdr 
--===================================================================================  
procedure add_stk_op_bal_hdr_prc( a_storage_id				in			NUMBER
                                 ,a_doc_type				in			NUMBER          default 1
                                 ,a_doc_date				in			VARCHAR2
                                 ,a_storage_type			in			NUMBER
                                 ,a_inv_date				in			VARCHAR2
                                 ,a_inv_desc				in			VARCHAR2
                                 ,a_center_code				in			VARCHAR2
                                 ,a_currency_id				in			NUMBER
                                 ,a_exch_rate				in			NUMBER
                                 ,a_file_ref				in			VARCHAR2
                                 ,a_post_flag				in			NUMBER
                                 ,a_posted_date				in			VARCHAR2
                                 ,a_wf_role_id				in			NUMBER
                                 ,a_wf_level				in			NUMBER
                                 ,a_status					in			NUMBER
                                 ,a_trans_date              in          varchar2    
                                 ,a_data_source             in          number
                                 ,a_user_id                 in          number  
                                 ,a_id                      out         number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 ); 
-------------------------------------------------------------------------------- 
procedure edit_stk_op_bal_hdr_prc(a_storage_id				in			NUMBER
                                 ,a_id                      in          number
                                 ,a_doc_type				in			NUMBER         default 1
                                 ,a_doc_date				in			VARCHAR2
                                 ,a_storage_type			in			NUMBER
                                 ,a_inv_date				in			VARCHAR2
                                 ,a_inv_desc				in			VARCHAR2
                                 ,a_center_code				in			VARCHAR2
                                 ,a_currency_id				in			NUMBER
                                 ,a_exch_rate				in			NUMBER
                                 ,a_file_ref				in			VARCHAR2
                                 ,a_post_flag				in			NUMBER
                                 ,a_posted_date				in			VARCHAR2
                                 ,a_wf_role_id				in			NUMBER
                                 ,a_wf_level				in			NUMBER
                                 ,a_status					in			NUMBER
                                 ,a_trans_date              in          varchar2    
                                 ,a_data_source             in          number
                                 ,a_user_id                 in          number  
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 ); 
--------------------------------------------------------------------------------                                  
procedure delete_stk_op_bal_hdr_prc (a_id                   in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    );
--------------------------------------------------------------------------------       
function fn_collect_OP_BAL_HDR_ref(a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur) 
                                  return sys_refcursor
                                  ;  
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_op_bal_hdr_prc   (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               );
-- PUT
procedure edit_claims_data_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
-- DELETE
procedure delete_stk_op_bal_hdr_prc ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );                                                                                                                                     
-- ========================================================================== --
              ------------ stk_op_bal_dtl ------------------ 
procedure add_stk_op_bal_dtl_prc(  a_storage_id				in			NUMBER
                                  ,a_doc_type				in			NUMBER
                                  ,a_opb_id					in			NUMBER
                                  ,a_doc_date				in			VARCHAR2
                                  ,a_center_code			in			VARCHAR2
                                  ,a_mov_stamp				in			VARCHAR2
                                  ,a_item_id				in			NUMBER
                                  ,a_batch_no				in			VARCHAR2
                                  ,a_deal_unit				in			NUMBER
                                  ,a_deal_unit_qty			in			NUMBER
                                  ,a_deal_cur				in			NUMBER
                                  ,a_deal_cur_ucost			in			NUMBER
                                  ,a_deal_cur_tcost			in			NUMBER
                                  ,a_supplier_id			in			NUMBER
                                  ,a_prod_date			    in			VARCHAR2
                                  ,a_expire_date			in			VARCHAR2
                                  ,a_account_code			in			VARCHAR2
                                  ,a_funder					in			VARCHAR2
                                  ,a_donor					in			VARCHAR2
                                  ,a_activity				in			VARCHAR2
                                  ,a_item_pos				in			NUMBER
                                  ,a_shared_item			in			NUMBER
                                  ,a_sale_policy			in			NUMBER
                                  ,a_trans_date             in          varchar2    
                                  ,a_data_source            in          number
                                  ,a_user_id                in          number  
                                  ,a_id					    out			NUMBER
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                 );
--------------------------------------------------------------------------------                                                                                                     
procedure edit_stk_op_bal_dtl_prc( a_storage_id				in			NUMBER
                                  ,a_id					    in			NUMBER
                                  ,a_doc_type				in			NUMBER
                                  ,a_opb_id					in			NUMBER
                                  ,a_doc_date				in			VARCHAR2
                                  ,a_center_code			in			VARCHAR2
                                  ,a_mov_stamp				in			VARCHAR2
                                  ,a_item_id				in			NUMBER
                                  ,a_batch_no				in			VARCHAR2
                                  ,a_deal_unit				in			NUMBER
                                  ,a_deal_unit_qty			in			NUMBER
                                  ,a_deal_cur				in			NUMBER
                                  ,a_deal_cur_ucost			in			NUMBER
                                  ,a_deal_cur_tcost			in			NUMBER
                                  ,a_supplier_id			in			NUMBER
                                  ,a_prod_date			    in			VARCHAR2
                                  ,a_expire_date			in			VARCHAR2
                                  ,a_account_code			in			VARCHAR2
                                  ,a_funder					in			VARCHAR2
                                  ,a_donor					in			VARCHAR2
                                  ,a_activity				in			VARCHAR2
                                  ,a_item_pos				in			NUMBER
                                  ,a_shared_item			in			NUMBER
                                  ,a_sale_policy			in			NUMBER
                                  ,a_trans_date             in          varchar2    
                                  ,a_data_source            in          number
                                  ,a_user_id                in          number  
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                 ); 
--------------------------------------------------------------------------------
procedure delete_stk_op_bal_dtl_prc (a_id                   in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    );
--------------------------------------------------------------------------------
function fn_collect_op_bal_dtl_ref(a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur)  return sys_refcursor; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_op_bal_dtl_prc   (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_op_bal_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_op_bal_dtl_prc ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ); 
--===================================================================================
-- stk_grn_hdr 
--===================================================================================                             
    
procedure add_stk_grn_hdr_prc   ( a_storage_id				in			number
                                 ,a_doc_type				in			number                     default 2
                                 ,a_doc_date				in			varchar2
                                 ,a_storage_type			in			number
                                 ,a_stk_id					in			number
                                 ,a_stk_date				in			varchar2
                                 ,a_pur_bill_no				in			varchar2
                                 ,a_pur_bill_date			in			varchar2
                                 ,a_pay_type				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_bill_of_landing			in			varchar2
                                 ,a_supplier_id				in			number
                                 ,a_received_from			in			varchar2
                                 ,a_rec_from_phone			in			number
                                 ,a_received_by				in			varchar2
                                 ,a_currency				in			number
                                 ,a_exch_price				in			number
                                 ,a_post_flag				in			number
                                 ,a_posted_date				in			varchar2
                                 ,a_wf_role_id				in			number
                                 ,a_wf_level				in			number
                                 ,a_wf_status				in			number
                                 ,a_trans_date				in			varchar2
                                 ,a_data_source				in			number
                                 ,a_status                  in          number   
                                 ,a_user_id                 in          number
                                 ,a_id					    out			number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )    ; 
--------------------------------------------------------------------------------
procedure edit_stk_grn_hdr_prc   (a_id					    in			number 
                                 ,a_storage_id				in			number
                                 ,a_doc_type				in			number                     default 2
                                 ,a_doc_date				in			varchar2
                                 ,a_storage_type			in			number
                                 ,a_stk_id					in			number
                                 ,a_stk_date				in			varchar2
                                 ,a_pur_bill_no				in			varchar2
                                 ,a_pur_bill_date			in			varchar2
                                 ,a_pay_type				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_bill_of_landing			in			varchar2
                                 ,a_supplier_id				in			number
                                 ,a_received_from			in			varchar2
                                 ,a_rec_from_phone			in			number
                                 ,a_received_by				in			varchar2
                                 ,a_currency				in			number
                                 ,a_exch_price				in			number
                                 ,a_post_flag				in			number
                                 ,a_posted_date				in			varchar2
                                 ,a_wf_role_id				in			number
                                 ,a_wf_level				in			number
                                 ,a_wf_status				in			number
                                 ,a_trans_date				in			varchar2
                                 ,a_data_source				in			number
                                 ,a_status                  in          number   
                                 ,a_user_id                 in          number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 );
--------------------------------------------------------------------------------
procedure delete_stk_grn_hdr_prc    (a_id                   in     number
                                    ,a_storage_id           in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    );
--------------------------------------------------------------------------------  
function fn_collect_grn_hdr_ref   (a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_hdr_prc      (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) ;
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_hdr_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
--===================================================================================
-- stk_grn_fin_hdr 
--===================================================================================                             
procedure add_stk_grn_fin_hdr_prc  ( a_storage_id				in			number
                                    ,a_grn_id					in			number
                                    ,a_cur_id					in			number
                                    ,a_exch_price				in			number
                                    ,a_base_cur					in			number
                                    ,a_amount_type				in			number
                                    ,a_amount					in			number
                                    ,a_base_cur_amount			in			number
                                    ,a_grn_cur_amount			in			number
                                    ,a_trans_date    			in			varchar2
                                    ,a_data_source				in			number
                                    ,a_user_id                  in          number
                                    ,a_status					in			number
                                    ,a_id					    out			number
                                    ,a_status_code              out         number
                                    ,a_result                   out         ref_cur
                                    )   ;
--------------------------------------------------------------------------------
procedure edit_stk_grn_fin_hdr_prc   ( a_id					    in			number
                                  ,a_storage_id				in			number
                                  ,a_grn_id					in			number
                                  ,a_cur_id					in			number
                                  ,a_exch_price				in			number
                                  ,a_base_cur				in			number
                                  ,a_amount_type			in			number
                                  ,a_amount					in			number
                                  ,a_base_cur_amount		in			number
                                  ,a_grn_cur_amount			in			number
                                  ,a_trans_date				in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );
-------------------------------------------------------------------------------- 
procedure delete_stk_grn_fin_hdr_prc    (a_id                   in     number
                                        ,a_storage_id           in     number
                                        ,a_user_id              in     number
                                        ,a_trans_date           in     varchar2 default to_char(sysdate)
                                        ,a_data_source          in     number
                                        ,a_result               out    ref_cur
                                        ,a_status_code          out    number
                                        );
--------------------------------------------------------------------------------
function fn_collect_grn_fin_hdr_ref   (a_data_column_json           varchar2 
                                      ,a_where                      varchar2  default null 
                                      ,a_lookup_json                varchar2  default null
                                      ,a_Page_no                    number    default 1 
                                      ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                      ,a_user_id                    number
                                      ,a_status_code          out   number
                                      ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_fin_hdr_prc  (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_fin_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_fin_hdr_prc    ( a_body                           in          blob 
                                         ,a_status_code                    in out      number
                                         ,a_result                         in out      ref_cur
                                         );  
--===================================================================================
-- stk_grn_dtl 
--===================================================================================                             
procedure add_stk_grn_dtl_prc  ( a_storage_id				in			number
                                ,a_doc_date					in			varchar2
                                ,a_grn_id					in			number
                                ,a_center_code				in			varchar2
                                ,a_item_id					in			number
                                ,a_batch_no					in			varchar2
                                ,a_deal_unit				in			number
                                ,a_deal_qty					in			number
                                ,a_bonus					in			number
                                ,a_free_qty					in			number
                                ,a_deal_cur					in			number
                                ,a_deal_cur_ucost			in			number
                                ,a_deal_cur_tcost			in			number
                                ,a_cash_discount			in			number
                                ,a_exch_price				in			number
                                ,a_prod_date				in			varchar2
                                ,a_expire_date				in			varchar2
                                ,a_funder					in			varchar2
                                ,a_donor					in			varchar2
                                ,a_activity					in			varchar2
                                ,a_account_code				in			varchar2
                                ,a_sale_policy				in			number
                                ,a_shared_item				in			number
                                ,a_post_flag				in			number
                                ,a_item_pos					in			number
                                ,a_trans_date			    in			varchar2
                                ,a_data_source				in			number
                                ,a_status					in			number
                                ,a_user_id                  in          number
                                ,a_id					    out			number
                                ,a_status_code              out         number
                                ,a_result                   out         ref_cur
                                )     ;
--------------------------------------------------------------------------------
procedure edit_stk_grn_dtl_prc ( a_id					    in			number
                                ,a_storage_id				in			number
                                ,a_doc_date					in			varchar2
                                ,a_grn_id					in			number
                                ,a_center_code				in			varchar2
                                ,a_item_id					in			number
                                ,a_batch_no					in			varchar2
                                ,a_deal_unit				in			number
                                ,a_deal_qty					in			number
                                ,a_bonus					in			number
                                ,a_free_qty					in			number
                                ,a_deal_cur					in			number
                                ,a_deal_cur_ucost			in			number
                                ,a_deal_cur_tcost			in			number
                                ,a_cash_discount			in			number
                                ,a_exch_price				in			number
                                ,a_prod_date				in			varchar2
                                ,a_expire_date				in			varchar2
                                ,a_funder					in			varchar2
                                ,a_donor					in			varchar2
                                ,a_activity					in			varchar2
                                ,a_account_code				in			varchar2
                                ,a_sale_policy				in			number
                                ,a_shared_item				in			number
                                ,a_post_flag				in			number
                                ,a_item_pos					in			number
                                ,a_trans_date			    in			varchar2
                                ,a_data_source				in			number
                                ,a_status					in			number
                                ,a_user_id                  in          number
                                ,a_status_code              out         number
                                ,a_result                   out         ref_cur
                                );
--------------------------------------------------------------------------------
procedure delete_stk_grn_dtl_prc    (a_id                   in     number
                                    ,a_storage_id           in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    );
--------------------------------------------------------------------------------
function fn_collect_grn_dtl_ref       (a_data_column_json           varchar2 
                                      ,a_where                      varchar2  default null 
                                      ,a_lookup_json                varchar2  default null
                                      ,a_Page_no                    number    default 1 
                                      ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                      ,a_user_id                    number
                                      ,a_status_code          out   number
                                      ,a_result               out   ref_cur) return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_dtl_prc      (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_dtl_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
 --===================================================================================
-- stk_order_hdr 
--===================================================================================                             
procedure add_stk_order_hdr_prc  ( a_storage_id				in			number
                                  ,a_doc_type				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_center_code			in			varchar2
                                  ,a_spend_desc				in			varchar2
                                  ,a_activity				in			varchar2
                                  ,a_currency				in			number
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_id					    out			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );                                                                      
--------------------------------------------------------------------------------
procedure edit_stk_order_hdr_prc ( a_id					    in			number
                                  ,a_storage_id				in			number
                                  ,a_doc_type				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_center_code			in			varchar2
                                  ,a_spend_desc				in			varchar2
                                  ,a_activity				in			varchar2
                                  ,a_currency				in			number
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );
-------------------------------------------------------------------------------- 
procedure delete_stk_order_hdr_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
--------------------------------------------------------------------------------
function fn_collect_order_hdr_ref   (a_data_column_json           varchar2 
                                    ,a_where                      varchar2  default null 
                                    ,a_lookup_json                varchar2  default null
                                    ,a_Page_no                    number    default 1 
                                    ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                    ,a_user_id                    number
                                    ,a_status_code          out   number
                                    ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_order_hdr_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_order_hdr_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_order_hdr_prc ( a_body                           in          blob 
                                    ,a_status_code                    in out      number
                                    ,a_result                         in out      ref_cur
                                    );                                                                                                                                                                                                            
--===================================================================================
-- stk_order_dtl 
--===================================================================================                             
procedure add_stk_order_dtl_prc  ( a_storage_id			    in			number
                                  ,a_order_id				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_to_center			    in			varchar2
                                  ,a_mov_stamp			    in			varchar2
                                  ,a_item_id				in			number
                                  ,a_deal_unit			    in			number
                                  ,a_deal_unit_qty		    in			number
                                  ,a_deal_cur				in			number
                                  ,a_to_activity			in			varchar2
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_id					    out			number
                                  ,a_msg_id                 in out      varchar2
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );
--------------------------------------------------------------------------------
procedure edit_stk_order_dtl_prc ( a_id					    in out  	number
                                  ,a_storage_id			    in			number
                                  ,a_order_id				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_to_center			    in			varchar2
                                  ,a_mov_stamp			    in			varchar2
                                  ,a_item_id				in			number
                                  ,a_deal_unit			    in			number
                                  ,a_deal_unit_qty		    in			number
                                  ,a_deal_cur				in			number
                                  ,a_to_activity			in			varchar2
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_msg_id                 in out      varchar2
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );
-------------------------------------------------------------------------------- 
procedure delete_stk_order_dtl_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
--------------------------------------------------------------------------------
function fn_collect_order_dtl_ref   (a_data_column_json           varchar2 
                                    ,a_where                      varchar2  default null 
                                    ,a_lookup_json                varchar2  default null
                                    ,a_Page_no                    number    default 1 
                                    ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                    ,a_user_id                    number
                                    ,a_status_code          out   number
                                    ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_order_dtl_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_order_dtl_prc    ( a_body                           in          blob 
                                     ,a_id                             in out      number
                                     ,a_msg_id                         in out      varchar2
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_order_dtl_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       );                                                                                                                                                                                                                                                     
--===================================================================================
-- stk_sales_hdr 
--===================================================================================                             
procedure add_stk_sales_hdr_prc ( a_storage_id				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_doc_type				in			number
                                 ,a_client_type				in			number
                                 ,a_bene_id				    in			number
                                 ,a_bene_name				in			varchar2
                                 ,a_client_age				in			number
                                 ,a_age_class				in			number
                                 ,a_client_sex				in			number
                                 ,a_dr_no					in			number
                                 ,a_sale_type				in			number
                                 ,a_pay_type				in			number
                                 ,a_inss_comp				in			number
                                 ,a_inss_client				in			number
                                 ,a_inss_no					in			varchar2
                                 ,a_pat_perc				in			number
                                 ,a_insurance_code			in			varchar2
                                 ,a_notes					in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_id					    out			number
                                 ,a_msg_id                  out         varchar2
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 ) ;
--------------------------------------------------------------------------------
procedure edit_stk_sales_hdr_prc   ( a_id					    in			number 
                                    ,a_storage_id				in			number
                                    ,a_center_code				in			varchar2
                                    ,a_doc_type				    in			number
                                    ,a_client_type				in			number
                                    ,a_bene_id				    in			number
                                    ,a_bene_name				in			varchar2
                                    ,a_client_age				in			number
                                    ,a_age_class				in			number
                                    ,a_client_sex				in			number
                                    ,a_dr_no					in			number
                                    ,a_sale_type				in			number
                                    ,a_pay_type				    in			number
                                    ,a_inss_comp				in			number
                                    ,a_inss_client				in			number
                                    ,a_inss_no					in			varchar2
                                    ,a_pat_perc				    in			number
                                    ,a_insurance_code			in			varchar2
                                    ,a_notes					in			varchar2
                                    ,a_trans_date    		    in			varchar2
                                    ,a_data_source			    in			number
                                    ,a_user_id                  in          number
                                    ,a_status				    in			number
                                    ,a_msg_id                   out         varchar2
                                    ,a_status_code              out         number
                                    ,a_result                   out         ref_cur
                                    );
-------------------------------------------------------------------------------- 
procedure delete_stk_sales_hdr_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
--------------------------------------------------------------------------------
function fn_collect_stk_sales_hdr_ref   (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_sales_hdr_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_sales_hdr_prc    ( a_body                           in          blob 
                                     ,a_msg_id                         in out      varchar2
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_sales_hdr_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
--===================================================================================
-- stk_sales_dtl 
--===================================================================================                             
procedure add_stk_sales_dtl_prc ( a_storage_id				in			number
                                 ,a_sale_id					in			number
                                 ,a_center_code				in			varchar2
                                 ,a_to_center				in			varchar2
                                 ,a_item_id					in			number
                                 ,a_mov_stamp				in			varchar2
                                 ,a_deal_unit				in			number
                                 ,a_deal_unit_qty			in			number
                                 ,a_deal_cur				in			number
                                 ,a_exch_rate				in			number
                                 ,a_deal_price				in			number
                                 ,a_pat_perc				in			number
                                 ,a_is_vaitamin				in			number
                                 ,a_notes					in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_id					    out			number
                                 ,a_msg_id                  in out      varchar2
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )  ;
--------------------------------------------------------------------------------
procedure edit_stk_sales_dtl_prc ( a_id					    in			number
                                  ,a_storage_id				in			number
                                  ,a_sale_id				in			number
                                  ,a_center_code			in			varchar2
                                  ,a_to_center				in			varchar2
                                  ,a_item_id				in			number
                                  ,a_mov_stamp				in			varchar2
                                  ,a_deal_unit				in			number
                                  ,a_deal_unit_qty			in			number
                                  ,a_deal_cur				in			number
                                  ,a_exch_rate				in			number
                                  ,a_deal_price				in			number
                                  ,a_pat_perc				in			number
                                  ,a_is_vaitamin			in			number
                                  ,a_notes					in			varchar2
                                  ,a_trans_date    		    in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status				    in			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  );
-------------------------------------------------------------------------------- 
procedure delete_stk_sales_dtl_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
--------------------------------------------------------------------------------
function fn_collect_stk_sales_dtl_ref   (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_sales_dtl_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_sales_dtl_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_sales_dtl_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) ; 
--===================================================================================
-- stk_inv_hdr 
--===================================================================================                             
procedure add_stk_inv_hdr_prc ( a_storage_id		    in			number
                               ,a_doc_type				in			number
                               ,a_doc_date				in			varchar2
                               ,a_inv_type				in			number
                               ,a_storage_type			in			number
                               ,a_inv_desc				in			varchar2
                               ,a_trans_date    		in			varchar2
                               ,a_data_source			in			number
                               ,a_user_id               in          number
                               ,a_status				in			number
                               ,a_id					out			number
                               ,a_status_code           out         number
                               ,a_result                out         ref_cur
                               )  ;
--------------------------------------------------------------------------------
procedure edit_stk_inv_hdr_prc (  a_id					    in			number
                                 ,a_storage_id				in			number
                                 ,a_doc_type				in			number
                                 ,a_doc_date				in			varchar2
                                 ,a_inv_type				in			number
                                 ,a_storage_type			in			number
                                 ,a_inv_desc				in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 );
-------------------------------------------------------------------------------- 
procedure delete_stk_inv_hdr_prc      (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
function fn_collect_stk_inv_hdr_ref     (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_inv_hdr_prc    ( a_body                           in          blob 
                              ,a_json                           in out      ref_cur                                    
                              ,a_id                             in out      number
                              ,a_status_code                    in out      number
                              ,a_result                         in out      ref_cur
                             );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_inv_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_inv_hdr_prc      ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) ;    
--===================================================================================
-- stk_inv_dtl 
--===================================================================================                             
procedure add_stk_inv_dtl_prc (a_storage_id				in			number
                              ,a_inv_id					in			number
                              ,a_storage_type			in			number
                              ,a_item_id				in			number
                              ,a_mov_stamp				in			varchar2
                              ,a_def_unit				in			number
                              ,a_qty					in			number
                              ,a_physical_qty			in			number
                              ,a_def_unit_cost			in			number
                              ,a_total_cost				in			number
                              ,a_item_pos				in			number
                              ,a_notes					in			varchar2
                              ,a_trans_date    		    in			varchar2
                              ,a_data_source			in			number
                              ,a_user_id                in          number
                              ,a_status				    in			number
                              ,a_id					    out			number
                              ,a_status_code            out         number
                              ,a_result                 out         ref_cur
                              )  ;
--------------------------------------------------------------------------------
procedure edit_stk_inv_dtl_prc (a_id					in			number
                               ,a_storage_id			in		    number
                               ,a_inv_id				in		    number
                               ,a_storage_type			in			number
                               ,a_item_id				in			number
                               ,a_mov_stamp				in			varchar2
                               ,a_def_unit				in			number
                               ,a_qty					in			number
                               ,a_physical_qty			in			number
                               ,a_def_unit_cost			in			number
                               ,a_total_cost			in			number
                               ,a_item_pos				in			number
                               ,a_notes					in			varchar2
                               ,a_trans_date    		in			varchar2
                               ,a_data_source			in			number
                               ,a_user_id               in          number
                               ,a_status				in			number
                               ,a_status_code           out         number
                               ,a_result                out         ref_cur
                               );
-------------------------------------------------------------------------------- 
procedure delete_stk_inv_dtl_prc      (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      );
--------------------------------------------------------------------------------
function fn_collect_stk_inv_dtl_ref     (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor;
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_inv_dtl_prc    ( a_body                           in          blob 
                              ,a_json                           in out      ref_cur                                    
                              ,a_id                             in out      number
                              ,a_status_code                    in out      number
                              ,a_result                         in out      ref_cur
                             );
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_inv_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  );
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_inv_dtl_prc      ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
end;
/

create package body           STOCK_API_PKG  AS  
/*==============================================================  
Created by Abdulkareem 04/01/2021
This Package will handle all the procedures
and functions which will be used with Calling Web Services for Stock module
==============================================================*/

--===================================================================================
-- stk_configuration 
--===================================================================================                             
 
    function validate_stk_conf(v_stk_configuration_rec stk_configuration%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--========================================================================= 
procedure add_stk_conf_prc (    a_storage_id			    in     number      default null
                               ,a_param_id        		    in     number
                               ,a_param_value			    in     number
                               ,a_status				    in     number      
                               ,a_trans_date                in     varchar2    
                               ,a_data_source               in     number
                               ,a_user_id                   in     number  
                               ,a_id                        out    number
                               ,a_status_code               out    number
                               ,a_result                    out    ref_cur
                              )
    is 
    v_stk_conf_rec            stk_configuration%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate claims hdr (data)
        if not validate_stk_conf(v_stk_conf_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_conf_rec.storage_id			  :=  a_storage_id			                                                                              ;
        v_stk_conf_rec.param_id     		  :=  a_param_id		                                                                                  ;
        v_stk_conf_rec.param_value			  :=  a_param_value			                                                                              ;
        v_stk_conf_rec.status				  :=  a_status				                                                                              ;
        v_stk_conf_rec.ins_date               :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_conf_rec.data_source            :=  a_data_source                                                                                       ;
        v_stk_conf_rec.created_by             :=  a_user_id                                                                                           ;

        -- Insert Services record
            insert into stk_configuration values v_stk_conf_rec returning id into a_id
            ;

            mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                         ,a_01          => 'Row added successfully. ID: '||a_id
                                                         ,a_msg_cur     => a_result
                                                         ,a_status_code => a_status_code
                                                         );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
--------------------------------------------------------------------------------
procedure edit_stk_conf_prc    ( a_id                        in     number
                                ,a_storage_id			     in     number      
                                ,a_param_id        		     in     number
                                ,a_status				     in     number      
                                ,a_param_value			     in     number
                                ,a_trans_date                in     varchar2    
                                ,a_data_source               in     number
                                ,a_user_id                   in     number  
                                ,a_status_code               out    number
                                ,a_result                    out    ref_cur
                              )
is 
    v_stk_conf_rec            stk_configuration%rowtype;
    begin 
       -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;     
--RAISE_APPLICATION_ERROR (-200101,'User has no privliges');   
        end if; 
            -- Validate stk conf 
           if not validate_stk_conf(v_stk_conf_rec) then
           
           mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                        ,a_01          => v_stk_conf_rec.id
                                                        ,a_msg_cur     => a_result
                                                        ,a_status_code => a_status_code
                                                        );
                
                return;
-- RAISE_APPLICATION_ERROR (-200102,'Validation error');  
            end if;         
           
        -- Assign values     
        v_stk_conf_rec.storage_id			  :=  a_storage_id			                                                                              ;
        v_stk_conf_rec.param_id     		  :=  a_param_id		                                                                                  ;
        v_stk_conf_rec.param_value			  :=  a_param_value			                                                                              ;
        v_stk_conf_rec.status				  :=  a_status				                                                                              ;
        v_stk_conf_rec.updated                :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_conf_rec.data_source            :=  a_data_source                                                                                       ;
        v_stk_conf_rec.updated_by             :=  a_user_id                                                                                           ;

         -- update claim hdr
update   stk_configuration 
set   
         storage_id 			            =   v_stk_conf_rec.storage_id		       
      ,  param_id       		            =   v_stk_conf_rec.param_id     	               
      ,  param_value		                =   v_stk_conf_rec.param_value		       
      ,  updated                            =   v_stk_conf_rec.updated                 
      ,  data_source                        =   v_stk_conf_rec.data_source             
      ,  updated_by                         =   v_stk_conf_rec.updated_by              
      ,  status                             =   v_stk_conf_rec.status                  
      
where id = a_id ; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => a_id
                                                                 ,a_02          => sql%ROWCOUNT||' rows updated successfully.'
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );            
            
        exception 
                  
                    
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20101
                                                                 ,a_01          =>v_stk_conf_rec.id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );   
            
        RAISE_APPLICATION_ERROR (-200103,'Unknown error');    
        
    end; 
                                
----=========================================================================  
procedure stk_conf_prc (     a_storage_id			     in     number      default null
                            ,a_param_id        		     in     number
                            ,a_param_value			     in     number
                            ,a_status				     in     number      
                            ,a_trans_date                in     varchar2    
                            ,a_data_source               in     number
                            ,a_user_id                   in     number  
                            ,a_id                        in out number
                            ,a_status_code               out    number
                            ,a_result                    out    ref_cur
                          )
is                              
L_CNT     number;
V_REF     MDL_STOCK.STOCK_API_PKG.ref_cur;
v_res     clob;
l_value   number;
begin
if a_param_value IS NOT NULL THEN
SELECT COUNT(*) 
INTO L_CNT
FROM MDL_STOCK.STK_CONFIGURATION
WHERE STORAGE_ID    =   a_storage_id
AND   PARAM_ID      =   a_param_id  ;
  IF L_CNT =0 THEN
  

                             add_stk_conf_prc (     a_storage_id			   => a_storage_id
                                                   ,a_param_id        		   => a_param_id
                                                   ,a_param_value			   => a_param_value
                                                   ,a_status				   => a_status
                                                   ,a_trans_date               => TO_CHAR(SYSDATE,'dd/mm/yyyy :HH24:SS:MM')
                                                   ,a_data_source              => a_data_source
                                                   ,a_user_id                  => a_user_id
                                                   ,a_id                       => a_id
                                                   ,a_status_code              => a_status_code
                                                   ,a_result                   => a_result
    
                                               );
  ELSIF L_CNT > 0 THEN
    select param_value 
    into l_value
    from  MDL_STOCK.STK_CONFIGURATION
    WHERE STORAGE_ID    =   a_storage_id
    AND   PARAM_ID      =   a_param_id  ;
    
    if    l_value       =   a_param_value then
    null;
    else
                            edit_stk_conf_prc (     a_id                       => MDL_STOCK.STOCK_CALC.GET_STK_CONF_ID(a_branch=> a_storage_id,a_param=> a_param_id)
                                                   ,a_storage_id			   => a_storage_id
                                                   ,a_param_id        		   => a_param_id
                                                   ,a_param_value			   => a_param_value
                                                   ,a_status				   => a_status
                                                   ,a_trans_date               => TO_CHAR(SYSDATE,'dd/mm/yyyy :HH24:SS:MM')
                                                   ,a_data_source              => a_data_source
                                                   ,a_user_id                  => a_user_id
                                                   ,a_status_code              => a_status_code
                                                   ,a_result                   => a_result

                                               );
  
    end if;
  END IF;
 END IF;

end;
--===================================================================================
-- stk_op_bal_hdr 
--===================================================================================                             
 
    function validate_op_bal_hdr(v_stk_op_bal_hdr_rec stk_op_bal_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_op_bal_hdr_prc( a_storage_id				in			NUMBER
                                 ,a_doc_type				in			NUMBER         default 1
                                 ,a_doc_date				in			VARCHAR2
                                 ,a_storage_type			in			NUMBER
                                 ,a_inv_date				in			VARCHAR2
                                 ,a_inv_desc				in			VARCHAR2
                                 ,a_center_code				in			VARCHAR2
                                 ,a_currency_id				in			NUMBER
                                 ,a_exch_rate				in			NUMBER
                                 ,a_file_ref				in			VARCHAR2
                                 ,a_post_flag				in			NUMBER
                                 ,a_posted_date				in			VARCHAR2
                                 ,a_wf_role_id				in			NUMBER
                                 ,a_wf_level				in			NUMBER
                                 ,a_status					in			NUMBER
                                 ,a_trans_date              in          varchar2    
                                 ,a_data_source             in          number
                                 ,a_user_id                 in          number  
                                 ,a_id                      out         number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_op_bal_hdr_rec            stk_op_bal_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_op_bal_hdr(v_stk_op_bal_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_op_bal_hdr_rec.storage_id		  :=  a_storage_id	                                                                                     ;
        v_stk_op_bal_hdr_rec.doc_type		  :=  a_doc_type	                                                                                     ;
        v_stk_op_bal_hdr_rec.doc_date		  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	 ;
        v_stk_op_bal_hdr_rec.storage_type	  :=  a_storage_type                                                                                     ;
        v_stk_op_bal_hdr_rec.inv_date	      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_inv_date,a_data_source => a_data_source)	 ;
        v_stk_op_bal_hdr_rec.inv_desc	      :=  a_inv_desc	                                                                                     ;
        v_stk_op_bal_hdr_rec.center_code	  :=  a_center_code	                                                                                     ;
        v_stk_op_bal_hdr_rec.currency_id	  :=  a_currency_id	                                                                                     ;
        v_stk_op_bal_hdr_rec.exch_rate	      :=  a_exch_rate	                                                                                     ;
        v_stk_op_bal_hdr_rec.file_ref	      :=  a_file_ref	                                                                                     ;
        v_stk_op_bal_hdr_rec.post_flag	      :=  a_post_flag	                                                                                     ;
        v_stk_op_bal_hdr_rec.posted_date	  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_posted_date,a_data_source => a_data_source);	
        v_stk_op_bal_hdr_rec.wf_role_id	      :=  a_wf_role_id	                                                                                     ;
        v_stk_op_bal_hdr_rec.wf_level	      :=  a_wf_level	                                                                                     ;
        v_stk_op_bal_hdr_rec.status		      :=  a_status		                                                                                     ;
        v_stk_op_bal_hdr_rec.ins_date         :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source);
        v_stk_op_bal_hdr_rec.data_source      :=  a_data_source                                                                                      ;
        v_stk_op_bal_hdr_rec.created_by       :=  a_user_id                                                                                          ;
        
        -- Insert Open Balance Hdr record
            insert into stk_op_bal_hdr values v_stk_op_bal_hdr_rec returning id into a_id
            ;

                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure edit_stk_op_bal_hdr_prc(a_storage_id				in			NUMBER
                                 ,a_id                      in          number
                                 ,a_doc_type				in			NUMBER            default 1
                                 ,a_doc_date				in			VARCHAR2
                                 ,a_storage_type			in			NUMBER
                                 ,a_inv_date				in			VARCHAR2
                                 ,a_inv_desc				in			VARCHAR2
                                 ,a_center_code				in			VARCHAR2
                                 ,a_currency_id				in			NUMBER
                                 ,a_exch_rate				in			NUMBER
                                 ,a_file_ref				in			VARCHAR2
                                 ,a_post_flag				in			NUMBER
                                 ,a_posted_date				in			VARCHAR2
                                 ,a_wf_role_id				in			NUMBER
                                 ,a_wf_level				in			NUMBER
                                 ,a_status					in			NUMBER
                                 ,a_trans_date              in          varchar2    
                                 ,a_data_source             in          number
                                 ,a_user_id                 in          number  
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_op_bal_hdr_rec            stk_op_bal_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_op_bal_hdr(v_stk_op_bal_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_op_bal_hdr_rec.doc_type		 :=  a_doc_type	                                                                                            ;
        v_stk_op_bal_hdr_rec.doc_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)      ;
        v_stk_op_bal_hdr_rec.storage_type	 :=  a_storage_type                                                                                         ;
        v_stk_op_bal_hdr_rec.inv_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_inv_date,a_data_source => a_data_source)      ;
        v_stk_op_bal_hdr_rec.inv_desc	     :=  a_inv_desc	                                                                                            ;
        v_stk_op_bal_hdr_rec.center_code	 :=  a_center_code	                                                                                        ;
        v_stk_op_bal_hdr_rec.currency_id	 :=  a_currency_id	                                                                                        ;
        v_stk_op_bal_hdr_rec.exch_rate		 :=  a_exch_rate	                                                                                        ;
        v_stk_op_bal_hdr_rec.file_ref	     :=  a_file_ref	                                                                                            ;
        v_stk_op_bal_hdr_rec.post_flag	     :=  a_post_flag	                                                                                        ;
        v_stk_op_bal_hdr_rec.posted_date	 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_posted_date,a_data_source => a_data_source)   ;
        v_stk_op_bal_hdr_rec.wf_role_id		 :=  a_wf_role_id	                                                                                        ;
        v_stk_op_bal_hdr_rec.wf_level	     :=  a_wf_level	                                                                                            ;
        v_stk_op_bal_hdr_rec.status		     :=  a_status		                                                                                        ;
        v_stk_op_bal_hdr_rec.updated         :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)    ;
        v_stk_op_bal_hdr_rec.data_source     :=  a_data_source                                                                                          ;
        v_stk_op_bal_hdr_rec.updated_by      :=  a_user_id                                                                                              ;                                                                                       
        
        -- Insert Open Balance Hdr record
             update stk_op_bal_hdr 
    set   
         doc_type	          =   v_stk_op_bal_hdr_rec.doc_type	   
      ,  doc_date	          =   v_stk_op_bal_hdr_rec.doc_date	            
      ,  storage_type         =   v_stk_op_bal_hdr_rec.storage_type
      ,  inv_date	          =   v_stk_op_bal_hdr_rec.inv_date	   
      ,  inv_desc	          =   v_stk_op_bal_hdr_rec.inv_desc	  
      ,  center_code          =   v_stk_op_bal_hdr_rec.center_code 
      ,  currency_id          =   v_stk_op_bal_hdr_rec.currency_id 
      ,  exch_rate	          =   v_stk_op_bal_hdr_rec.exch_rate
      ,  file_ref	          =   v_stk_op_bal_hdr_rec.file_ref	  
      ,  post_flag	          =   v_stk_op_bal_hdr_rec.post_flag
      ,  posted_date          =   v_stk_op_bal_hdr_rec.posted_date 
      ,  wf_role_id	          =   v_stk_op_bal_hdr_rec.wf_role_id
      ,  wf_level	          =   v_stk_op_bal_hdr_rec.wf_level	   
      ,  status		          =   v_stk_op_bal_hdr_rec.status	
      ,  updated              =   v_stk_op_bal_hdr_rec.updated     
      ,  data_source          =   v_stk_op_bal_hdr_rec.data_source 
      ,  updated_by           =   v_stk_op_bal_hdr_rec.updated_by  
      
      
    where id         = a_id 
    and   storage_id =a_storage_id;

                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_op_bal_hdr_prc (a_id                   in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    )
is 
   v_stk_op_bal_hdr_rec            stk_op_bal_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_op_bal_hdr(v_stk_op_bal_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_op_bal_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_op_bal_hdr 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id = a_id ; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------       
function fn_collect_OP_BAL_HDR_ref(a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_OP_BAL_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_op_bal_hdr_prc   (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json := MDL_STOCK.STOCK_API_PKG.fn_collect_OP_BAL_HDR_ref(     a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                 ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                 ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                 ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                 ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                 ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                                 ,a_status_code                      => a_status_code                                           
                                                                 ,a_result                           => a_result   
                                                                 );
  end; 
else
    begin
    add_stk_op_bal_hdr_prc(  a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type		      => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_doc_date		      => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_storage_type	      => apex_json.get_varchar2(p_path => 'a_storage_type')
                            ,a_inv_date		      => apex_json.get_varchar2(p_path => 'a_inv_date')
                            ,a_inv_desc		      => apex_json.get_varchar2(p_path => 'a_inv_desc')
                            ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_currency_id		  => apex_json.get_varchar2(p_path => 'a_currency_id')
                            ,a_exch_rate		  => apex_json.get_varchar2(p_path => 'a_exch_rate')
                            ,a_file_ref		      => apex_json.get_varchar2(p_path => 'a_file_ref')
                            ,a_post_flag		  => apex_json.get_varchar2(p_path => 'a_post_flag')
                            ,a_posted_date		  => apex_json.get_varchar2(p_path => 'a_posted_date')
                            ,a_wf_role_id		  => apex_json.get_varchar2(p_path => 'a_wf_role_id')
                            ,a_wf_level		      => apex_json.get_varchar2(p_path => 'a_wf_level')
                            ,a_status			  => apex_json.get_varchar2(p_path => 'a_status')
                            ,a_trans_date         => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source        => OWA_UTIL.get_cgi_env  ('a_data_source')
                            ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')
                            ,a_id                 => a_id                                                     
                            ,a_status_code        => a_status_code
                            ,a_result             => a_result    
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_claims_data_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_op_bal_hdr_prc (   a_id                 => apex_json.get_varchar2(p_path => 'a_id')  
                            ,a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type		      => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_doc_date		      => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_storage_type	      => apex_json.get_varchar2(p_path => 'a_storage_type')
                            ,a_inv_date		      => apex_json.get_varchar2(p_path => 'a_inv_date')
                            ,a_inv_desc		      => apex_json.get_varchar2(p_path => 'a_inv_desc')
                            ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_currency_id		  => apex_json.get_varchar2(p_path => 'a_currency_id')
                            ,a_exch_rate		  => apex_json.get_varchar2(p_path => 'a_exch_rate')
                            ,a_file_ref		      => apex_json.get_varchar2(p_path => 'a_file_ref')
                            ,a_post_flag		  => apex_json.get_varchar2(p_path => 'a_post_flag')
                            ,a_posted_date		  => apex_json.get_varchar2(p_path => 'a_posted_date')
                            ,a_wf_role_id		  => apex_json.get_varchar2(p_path => 'a_wf_role_id')
                            ,a_wf_level		      => apex_json.get_varchar2(p_path => 'a_wf_level')
                            ,a_status			  => apex_json.get_varchar2(p_path => 'a_status')
                            ,a_trans_date         => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source        => OWA_UTIL.get_cgi_env  ('a_data_source')
                            ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')                                               
                            ,a_status_code        => a_status_code
                            ,a_result             => a_result    
                            );                                
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_op_bal_hdr_prc ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_op_bal_hdr_prc ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                           ,a_user_id              => OWA_UTIL.get_cgi_env  ('a_user_id')
                           ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source          => OWA_UTIL.get_cgi_env  ('a_data_source')
                           ,a_result               => a_result
                           ,a_status_code          => a_status_code
                           )   ;
end; 
--===================================================================================    
--===================================================================================
-- stk_op_bal_dtl 
--===================================================================================                             
 
    function validate_op_bal_dtl(v_stk_op_bal_dtl_rec stk_op_bal_dtl%rowtype) return boolean 
    is
    begin 
        return true;
    end;
    
    
    
--------------------------------------------------------------------------------    
procedure add_stk_op_bal_dtl_prc(  a_storage_id				in			NUMBER
                                  ,a_doc_type				in			NUMBER      
                                  ,a_opb_id					in			NUMBER
                                  ,a_doc_date				in			VARCHAR2
                                  ,a_center_code			in			VARCHAR2
                                  ,a_mov_stamp				in			VARCHAR2
                                  ,a_item_id				in			NUMBER
                                  ,a_batch_no				in			VARCHAR2
                                  ,a_deal_unit				in			NUMBER
                                  ,a_deal_unit_qty			in			NUMBER
                                  ,a_deal_cur				in			NUMBER
                                  ,a_deal_cur_ucost			in			NUMBER
                                  ,a_deal_cur_tcost			in			NUMBER
                                  ,a_supplier_id			in			NUMBER
                                  ,a_prod_date			    in			VARCHAR2
                                  ,a_expire_date			in			VARCHAR2
                                  ,a_account_code			in			VARCHAR2
                                  ,a_funder					in			VARCHAR2
                                  ,a_donor					in			VARCHAR2
                                  ,a_activity				in			VARCHAR2
                                  ,a_item_pos				in			NUMBER
                                  ,a_shared_item			in			NUMBER
                                  ,a_sale_policy			in			NUMBER
                                  ,a_trans_date             in          varchar2    
                                  ,a_data_source            in          number
                                  ,a_user_id                in          number  
                                  ,a_id					    out			NUMBER
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                 ) is
 v_stk_op_bal_dtl_rec            stk_op_bal_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_op_bal_dtl(v_stk_op_bal_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_op_bal_dtl_rec.storage_id	    :=  a_storage_id		                                                                                  ;
--        v_stk_op_bal_dtl_rec.id			    :=  a_id				                                                                                  ;
        v_stk_op_bal_dtl_rec.doc_type	    :=  a_doc_type		                                                                                      ;
        v_stk_op_bal_dtl_rec.opb_id			:=  a_opb_id			                                                                                  ;
        v_stk_op_bal_dtl_rec.doc_date	    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)     ;
        v_stk_op_bal_dtl_rec.center_code    :=  a_center_code	                                                                                      ;
        v_stk_op_bal_dtl_rec.mov_stamp	    :=  a_mov_stamp		                                                                                      ;
        v_stk_op_bal_dtl_rec.item_id	    :=  a_item_id		                                                                                      ;
        v_stk_op_bal_dtl_rec.batch_no	    :=  a_batch_no		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_unit	    :=  a_deal_unit		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_unit_qty  :=  a_deal_unit_qty	                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_cur	    :=  a_deal_cur		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_cur_ucost :=  a_deal_cur_ucost	                                                                                  ;
        v_stk_op_bal_dtl_rec.deal_cur_tcost :=  a_deal_cur_tcost	                                                                                  ;
        v_stk_op_bal_dtl_rec.supplier_id    :=  a_supplier_id	                                                                                      ;
        v_stk_op_bal_dtl_rec.prod_date	    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_prod_date,a_data_source => a_data_source)    ;
        v_stk_op_bal_dtl_rec.expire_date    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_expire_date,a_data_source => a_data_source)  ;
        v_stk_op_bal_dtl_rec.account_code   :=  a_account_code	                                                                                      ;
        v_stk_op_bal_dtl_rec.funder		    :=  a_funder		                                                                                      ;	
        v_stk_op_bal_dtl_rec.donor		    :=  a_donor			                                                                                      ;
        v_stk_op_bal_dtl_rec.activity	    :=  a_activity		                                                                                      ;
        v_stk_op_bal_dtl_rec.item_pos	    :=  a_item_pos		                                                                                      ;
        v_stk_op_bal_dtl_rec.shared_item    :=  a_shared_item	                                                                                      ;
        v_stk_op_bal_dtl_rec.sale_policy    :=  a_sale_policy	                                                                                      ;
        v_stk_op_bal_dtl_rec.created        :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)   ;
        v_stk_op_bal_dtl_rec.data_source    :=  a_data_source                                                                                         ;
        v_stk_op_bal_dtl_rec.created_by     :=  a_user_id                                                                                             ;
        
        
        
        
        
        -- Insert Open Balance dtl record
    insert into  stk_op_bal_dtl values v_stk_op_bal_dtl_rec 
    returning id into a_id;
    
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 

procedure edit_stk_op_bal_dtl_prc( a_storage_id				in			NUMBER
                                  ,a_id					    in			NUMBER
                                  ,a_doc_type				in			NUMBER          
                                  ,a_opb_id					in			NUMBER
                                  ,a_doc_date				in			VARCHAR2
                                  ,a_center_code			in			VARCHAR2
                                  ,a_mov_stamp				in			VARCHAR2
                                  ,a_item_id				in			NUMBER
                                  ,a_batch_no				in			VARCHAR2
                                  ,a_deal_unit				in			NUMBER
                                  ,a_deal_unit_qty			in			NUMBER
                                  ,a_deal_cur				in			NUMBER
                                  ,a_deal_cur_ucost			in			NUMBER
                                  ,a_deal_cur_tcost			in			NUMBER
                                  ,a_supplier_id			in			NUMBER
                                  ,a_prod_date			    in			VARCHAR2
                                  ,a_expire_date			in			VARCHAR2
                                  ,a_account_code			in			VARCHAR2
                                  ,a_funder					in			VARCHAR2
                                  ,a_donor					in			VARCHAR2
                                  ,a_activity				in			VARCHAR2
                                  ,a_item_pos				in			NUMBER
                                  ,a_shared_item			in			NUMBER
                                  ,a_sale_policy			in			NUMBER
                                  ,a_trans_date             in          varchar2    
                                  ,a_data_source            in          number
                                  ,a_user_id                in          number  
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                 )
is 
    v_stk_op_bal_dtl_rec            stk_op_bal_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_op_bal_dtl(v_stk_op_bal_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_op_bal_dtl_rec.storage_id	    :=  a_storage_id		                                                                                  ;
        v_stk_op_bal_dtl_rec.id			    :=  a_id				                                                                                  ;
        v_stk_op_bal_dtl_rec.doc_type	    :=  a_doc_type		                                                                                      ;
        v_stk_op_bal_dtl_rec.opb_id			:=  a_opb_id			                                                                                  ;
        v_stk_op_bal_dtl_rec.doc_date	    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)     ;
        v_stk_op_bal_dtl_rec.center_code    :=  a_center_code	                                                                                      ;
        v_stk_op_bal_dtl_rec.mov_stamp	    :=  a_mov_stamp		                                                                                      ;
        v_stk_op_bal_dtl_rec.item_id	    :=  a_item_id		                                                                                      ;
        v_stk_op_bal_dtl_rec.batch_no	    :=  a_batch_no		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_unit	    :=  a_deal_unit		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_unit_qty  :=  a_deal_unit_qty	                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_cur	    :=  a_deal_cur		                                                                                      ;
        v_stk_op_bal_dtl_rec.deal_cur_ucost :=  a_deal_cur_ucost	                                                                                  ;
        v_stk_op_bal_dtl_rec.deal_cur_tcost :=  a_deal_cur_tcost	                                                                                  ;
        v_stk_op_bal_dtl_rec.supplier_id    :=  a_supplier_id	                                                                                      ;
        v_stk_op_bal_dtl_rec.prod_date	    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_prod_date,a_data_source => a_data_source)    ;
        v_stk_op_bal_dtl_rec.expire_date    :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_expire_date,a_data_source => a_data_source)  ;
        v_stk_op_bal_dtl_rec.account_code   :=  a_account_code	                                                                                      ;
        v_stk_op_bal_dtl_rec.funder		    :=  a_funder		                                                                                      ;	
        v_stk_op_bal_dtl_rec.donor		    :=  a_donor			                                                                                      ;
        v_stk_op_bal_dtl_rec.activity	    :=  a_activity		                                                                                      ;
        v_stk_op_bal_dtl_rec.item_pos	    :=  a_item_pos		                                                                                      ;
        v_stk_op_bal_dtl_rec.shared_item    :=  a_shared_item	                                                                                      ;
        v_stk_op_bal_dtl_rec.sale_policy    :=  a_sale_policy	                                                                                      ;
        v_stk_op_bal_dtl_rec.updated        :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)   ;
        v_stk_op_bal_dtl_rec.data_source    :=  a_data_source                                                                                         ;
        v_stk_op_bal_dtl_rec.updated_by     :=  a_user_id                                                                                             ;
        
        
        
        
        
        -- update Open Balance Dtl record
    update stk_op_bal_dtl 
    set   
         doc_type	 	           =   v_stk_op_bal_dtl_rec.doc_type	 	 
      ,  opb_id			           =   v_stk_op_bal_dtl_rec.opb_id			              
      ,  doc_date	               =   v_stk_op_bal_dtl_rec.doc_date	     
      ,  center_code               =   v_stk_op_bal_dtl_rec.center_code      
      ,  mov_stamp	 	           =   v_stk_op_bal_dtl_rec.mov_stamp	 	 
      ,  item_id	 	           =   v_stk_op_bal_dtl_rec.item_id	 	     
      ,  batch_no	 	           =   v_stk_op_bal_dtl_rec.batch_no	 	 
      ,  deal_unit	               =   v_stk_op_bal_dtl_rec.deal_unit	     
      ,  deal_unit_qty 	           =   v_stk_op_bal_dtl_rec.deal_unit_qty 	 
      ,  deal_cur	 	           =   v_stk_op_bal_dtl_rec.deal_cur	 	 
      ,  deal_cur_ucost            =   v_stk_op_bal_dtl_rec.deal_cur_ucost   
      ,  deal_cur_tcost            =   v_stk_op_bal_dtl_rec.deal_cur_tcost   
      ,  supplier_id               =   v_stk_op_bal_dtl_rec.supplier_id      
      ,  prod_date	               =   v_stk_op_bal_dtl_rec.prod_date	     
      ,  expire_date               =   v_stk_op_bal_dtl_rec.expire_date      
      ,  account_code              =   v_stk_op_bal_dtl_rec.account_code     
      ,  funder		               =   v_stk_op_bal_dtl_rec.funder		     
      ,  donor		               =   v_stk_op_bal_dtl_rec.donor		     
      ,  activity	               =   v_stk_op_bal_dtl_rec.activity	     
      ,  item_pos	               =   v_stk_op_bal_dtl_rec.item_pos	     
      ,  shared_item               =   v_stk_op_bal_dtl_rec.shared_item      
      ,  sale_policy               =   v_stk_op_bal_dtl_rec.sale_policy      
      ,  updated                   =   v_stk_op_bal_dtl_rec.updated          
      ,  data_source               =   v_stk_op_bal_dtl_rec.data_source      
      ,  updated_by                =   v_stk_op_bal_dtl_rec.updated_by       
      
    where id         = a_id 
    and   storage_id =a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_op_bal_dtl_prc (a_id                   in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    )
is 
   v_stk_op_bal_dtl_rec            stk_op_bal_dtl%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_op_bal_dtl(v_stk_op_bal_dtl_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_op_bal_dtl_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_op_bal_dtl 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id = a_id ; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------  
function fn_collect_op_bal_dtl_ref(a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_OP_BAL_DTL
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_op_bal_dtl_prc   (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_op_bal_dtl_ref(     a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                  ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                  ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                  ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                  ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                  ,a_user_id                          => OWA_UTIL.get_cgi_env('a_user_id')                     
                                                                  ,a_status_code                      => a_status_code                                           
                                                                  ,a_result                           => a_result   
                                                                  );
  end; 
else
    begin
    add_stk_op_bal_dtl_prc(  a_storage_id		=> apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type		    => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_opb_id			=> apex_json.get_varchar2(p_path => 'a_opb_id')
                            ,a_doc_date		    => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_center_code	    => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_mov_stamp		=> apex_json.get_varchar2(p_path => 'a_mov_stamp')
                            ,a_item_id		    => apex_json.get_varchar2(p_path => 'a_item_id')
                            ,a_batch_no		    => apex_json.get_varchar2(p_path => 'a_batch_no')
                            ,a_deal_unit		=> apex_json.get_varchar2(p_path => 'a_deal_unit')
                            ,a_deal_unit_qty	=> apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                            ,a_deal_cur		    => apex_json.get_varchar2(p_path => 'a_deal_cur')
                            ,a_deal_cur_ucost	=> apex_json.get_varchar2(p_path => 'a_deal_cur_ucost')
                            ,a_deal_cur_tcost	=> apex_json.get_varchar2(p_path => 'a_deal_cur_tcost')
                            ,a_supplier_id	    => apex_json.get_varchar2(p_path => 'a_supplier_id')
                            ,a_prod_date		=> apex_json.get_varchar2(p_path => 'a_prod_date')
                            ,a_expire_date	    => apex_json.get_varchar2(p_path => 'a_expire_date')
                            ,a_account_code	    => apex_json.get_varchar2(p_path => 'a_account_code')
                            ,a_funder			=> apex_json.get_varchar2(p_path => 'a_funder')
                            ,a_donor			=> apex_json.get_varchar2(p_path => 'a_donor')
                            ,a_activity		    => apex_json.get_varchar2(p_path => 'a_activity')
                            ,a_item_pos		    => apex_json.get_varchar2(p_path => 'a_item_pos')
                            ,a_shared_item	    => apex_json.get_varchar2(p_path => 'a_shared_item')
                            ,a_sale_policy	    => apex_json.get_varchar2(p_path => 'a_sale_policy')
                            ,a_trans_date       => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source      => OWA_UTIL.get_cgi_env('a_data_source')
                            ,a_user_id          => OWA_UTIL.get_cgi_env('a_user_id')
                            ,a_id               => a_id                                                     
                            ,a_status_code      => a_status_code
                            ,a_result           => a_result  
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_op_bal_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_op_bal_dtl_prc (   a_id               => apex_json.get_varchar2(p_path => 'a_id') 
                            ,a_storage_id		=> apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type		    => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_opb_id			=> apex_json.get_varchar2(p_path => 'a_opb_id')
                            ,a_doc_date		    => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_center_code	    => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_mov_stamp		=> apex_json.get_varchar2(p_path => 'a_mov_stamp')
                            ,a_item_id		    => apex_json.get_varchar2(p_path => 'a_item_id')
                            ,a_batch_no		    => apex_json.get_varchar2(p_path => 'a_batch_no')
                            ,a_deal_unit		=> apex_json.get_varchar2(p_path => 'a_deal_unit')
                            ,a_deal_unit_qty	=> apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                            ,a_deal_cur		    => apex_json.get_varchar2(p_path => 'a_deal_cur')
                            ,a_deal_cur_ucost	=> apex_json.get_varchar2(p_path => 'a_deal_cur_ucost')
                            ,a_deal_cur_tcost	=> apex_json.get_varchar2(p_path => 'a_deal_cur_tcost')
                            ,a_supplier_id	    => apex_json.get_varchar2(p_path => 'a_supplier_id')
                            ,a_prod_date		=> apex_json.get_varchar2(p_path => 'a_prod_date')
                            ,a_expire_date	    => apex_json.get_varchar2(p_path => 'a_expire_date')
                            ,a_account_code	    => apex_json.get_varchar2(p_path => 'a_account_code')
                            ,a_funder			=> apex_json.get_varchar2(p_path => 'a_funder')
                            ,a_donor			=> apex_json.get_varchar2(p_path => 'a_donor')
                            ,a_activity		    => apex_json.get_varchar2(p_path => 'a_activity')
                            ,a_item_pos		    => apex_json.get_varchar2(p_path => 'a_item_pos')
                            ,a_shared_item	    => apex_json.get_varchar2(p_path => 'a_shared_item')
                            ,a_sale_policy	    => apex_json.get_varchar2(p_path => 'a_sale_policy')
                            ,a_trans_date       => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source      => OWA_UTIL.get_cgi_env('a_data_source')
                            ,a_user_id          => OWA_UTIL.get_cgi_env('a_user_id')
                            ,a_status_code      => a_status_code
                            ,a_result           => a_result  
                            );                              
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_op_bal_dtl_prc ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_op_bal_dtl_prc ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                           ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                           ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                           ,a_result               => a_result
                           ,a_status_code          => a_status_code
                           )   ;
end; 
--===================================================================================
-- stk_grn_hdr 
--===================================================================================                             
 
    function validate_stk_grn_hdr(v_stk_grn_hdr_rec stk_grn_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_grn_hdr_prc   ( a_storage_id				in			number
                                 ,a_doc_type				in			number                     default 2
                                 ,a_doc_date				in			varchar2
                                 ,a_storage_type			in			number
                                 ,a_stk_id					in			number
                                 ,a_stk_date				in			varchar2
                                 ,a_pur_bill_no				in			varchar2
                                 ,a_pur_bill_date			in			varchar2
                                 ,a_pay_type				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_bill_of_landing			in			varchar2
                                 ,a_supplier_id				in			number
                                 ,a_received_from			in			varchar2
                                 ,a_rec_from_phone			in			number
                                 ,a_received_by				in			varchar2
                                 ,a_currency				in			number
                                 ,a_exch_price				in			number
                                 ,a_post_flag				in			number
                                 ,a_posted_date				in			varchar2
                                 ,a_wf_role_id				in			number
                                 ,a_wf_level				in			number
                                 ,a_wf_status				in			number
                                 ,a_trans_date				in			varchar2
                                 ,a_data_source				in			number
                                 ,a_status                  in          number   
                                 ,a_user_id                 in          number
                                 ,a_id					    out			number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_grn_hdr_rec            stk_grn_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_hdr(v_stk_grn_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_grn_hdr_rec.storage_id		  :=  a_storage_id		                                                                                    ;
        v_stk_grn_hdr_rec.doc_type		      :=  a_doc_type		                                                                                    ;
        v_stk_grn_hdr_rec.doc_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)     ;
        v_stk_grn_hdr_rec.storage_type	      :=  a_storage_type	                                                                                    ;
        v_stk_grn_hdr_rec.stk_id			  :=  a_stk_id                                                                                              ;
        v_stk_grn_hdr_rec.stk_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_stk_date,a_data_source => a_data_source)     ;
        v_stk_grn_hdr_rec.pur_bill_no		  :=  a_pur_bill_no		                                                                                    ;
        v_stk_grn_hdr_rec.pur_bill_date	      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_pur_bill_date,a_data_source => a_data_source);
        v_stk_grn_hdr_rec.pay_type		      :=  a_pay_type		                                                                                    ;
        v_stk_grn_hdr_rec.center_code		  :=  a_center_code		                                                                                    ;
        v_stk_grn_hdr_rec.bill_of_landing	  :=  a_bill_of_landing		                                                                                ;
        v_stk_grn_hdr_rec.supplier_id		  :=  a_supplier_id                                                                                         ;	
        v_stk_grn_hdr_rec.received_from	      :=  a_received_from		                                                                                ;
        v_stk_grn_hdr_rec.rec_from_phone	  :=  a_rec_from_phone	                                                                                    ;
        v_stk_grn_hdr_rec.received_by		  :=  a_received_by		                                                                                    ;
        v_stk_grn_hdr_rec.currency		      :=  a_currency                                                                                            ;
        v_stk_grn_hdr_rec.exch_price		  :=  a_exch_price                                                                                          ;
        v_stk_grn_hdr_rec.post_flag		      :=  a_post_flag                                                                                           ;
        v_stk_grn_hdr_rec.posted_date		  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_posted_date,a_data_source => a_data_source)  ;
        v_stk_grn_hdr_rec.wf_role_id		  :=  a_wf_role_id                                                                                          ;
        v_stk_grn_hdr_rec.wf_level		      :=  a_wf_level                                                                                            ;
        v_stk_grn_hdr_rec.wf_status		      :=  a_wf_status                                                                                           ;
        v_stk_grn_hdr_rec.status		      :=  a_status                                                                                              ;
        v_stk_grn_hdr_rec.ins_date  		  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)   ;
        v_stk_grn_hdr_rec.data_source		  :=  a_data_source                                                                                         ;
        v_stk_grn_hdr_rec.created_by		  :=  a_user_id                                                                                             ;

                -- Insert GRN Hdr record
            insert into stk_grn_hdr values v_stk_grn_hdr_rec 
            returning id into a_id
            ;

                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
--------------------------------------------------------------------------------
procedure edit_stk_grn_hdr_prc   (a_id					    in			number 
                                 ,a_storage_id				in			number
                                 ,a_doc_type				in			number                     default 2
                                 ,a_doc_date				in			varchar2
                                 ,a_storage_type			in			number
                                 ,a_stk_id					in			number
                                 ,a_stk_date				in			varchar2
                                 ,a_pur_bill_no				in			varchar2
                                 ,a_pur_bill_date			in			varchar2
                                 ,a_pay_type				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_bill_of_landing			in			varchar2
                                 ,a_supplier_id				in			number
                                 ,a_received_from			in			varchar2
                                 ,a_rec_from_phone			in			number
                                 ,a_received_by				in			varchar2
                                 ,a_currency				in			number
                                 ,a_exch_price				in			number
                                 ,a_post_flag				in			number
                                 ,a_posted_date				in			varchar2
                                 ,a_wf_role_id				in			number
                                 ,a_wf_level				in			number
                                 ,a_wf_status				in			number
                                 ,a_trans_date				in			varchar2
                                 ,a_data_source				in			number
                                 ,a_status                  in          number   
                                 ,a_user_id                 in          number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_grn_hdr_rec            stk_grn_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_hdr(v_stk_grn_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_grn_hdr_rec.storage_id		  :=  a_storage_id		                                                                                    ;
        v_stk_grn_hdr_rec.doc_type		      :=  a_doc_type		                                                                                    ;
        v_stk_grn_hdr_rec.doc_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)     ;
        v_stk_grn_hdr_rec.storage_type	      :=  a_storage_type	                                                                                    ;
        v_stk_grn_hdr_rec.stk_id			  :=  a_stk_id                                                                                              ;
        v_stk_grn_hdr_rec.stk_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_stk_date,a_data_source => a_data_source)     ;
        v_stk_grn_hdr_rec.pur_bill_no		  :=  a_pur_bill_no		                                                                                    ;
        v_stk_grn_hdr_rec.pur_bill_date	      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_pur_bill_date,a_data_source => a_data_source);
        v_stk_grn_hdr_rec.pay_type		      :=  a_pay_type		                                                                                    ;
        v_stk_grn_hdr_rec.center_code		  :=  a_center_code		                                                                                    ;
        v_stk_grn_hdr_rec.bill_of_landing	  :=  a_bill_of_landing		                                                                                ;
        v_stk_grn_hdr_rec.supplier_id		  :=  a_supplier_id                                                                                         ;	
        v_stk_grn_hdr_rec.received_from	      :=  a_received_from		                                                                                ;
        v_stk_grn_hdr_rec.rec_from_phone	  :=  a_rec_from_phone	                                                                                    ;
        v_stk_grn_hdr_rec.received_by		  :=  a_received_by		                                                                                    ;
        v_stk_grn_hdr_rec.currency		      :=  a_currency                                                                                            ;
        v_stk_grn_hdr_rec.exch_price		  :=  a_exch_price                                                                                          ;
        v_stk_grn_hdr_rec.post_flag		      :=  a_post_flag                                                                                           ;
        v_stk_grn_hdr_rec.posted_date		  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_posted_date,a_data_source => a_data_source)  ;
        v_stk_grn_hdr_rec.wf_role_id		  :=  a_wf_role_id                                                                                          ;
        v_stk_grn_hdr_rec.wf_level		      :=  a_wf_level                                                                                            ;
        v_stk_grn_hdr_rec.wf_status		      :=  a_wf_status                                                                                           ;
        v_stk_grn_hdr_rec.status		      :=  a_status                                                                                              ;
        v_stk_grn_hdr_rec.updated   		  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)   ;
        v_stk_grn_hdr_rec.data_source		  :=  a_data_source                                                                                         ;
        v_stk_grn_hdr_rec.updated_by		  :=  a_user_id                                                                                             ;
        
        -- update Open Balance Dtl record
    update stk_grn_hdr 
    set   
         storage_id		         =   v_stk_grn_hdr_rec.storage_id		 
      ,  doc_type		         =   v_stk_grn_hdr_rec.doc_type		               
      ,  doc_date		         =   v_stk_grn_hdr_rec.doc_date		     
      ,  storage_type	         =   v_stk_grn_hdr_rec.storage_type	     
      ,  stk_id			         =   v_stk_grn_hdr_rec.stk_id			 
      ,  stk_date		         =   v_stk_grn_hdr_rec.stk_date		     
      ,  pur_bill_no		     =   v_stk_grn_hdr_rec.pur_bill_no		 
      ,  pur_bill_date	         =   v_stk_grn_hdr_rec.pur_bill_date	 
      ,  pay_type		         =   v_stk_grn_hdr_rec.pay_type		     
      ,  center_code		     =   v_stk_grn_hdr_rec.center_code		 
      ,  bill_of_landing	     =   v_stk_grn_hdr_rec.bill_of_landing	 
      ,  supplier_id		     =   v_stk_grn_hdr_rec.supplier_id		 
      ,  received_from	         =   v_stk_grn_hdr_rec.received_from	 
      ,  rec_from_phone	         =   v_stk_grn_hdr_rec.rec_from_phone	 
      ,  received_by		     =   v_stk_grn_hdr_rec.received_by		 
      ,  currency		         =   v_stk_grn_hdr_rec.currency		     
      ,  exch_price		         =   v_stk_grn_hdr_rec.exch_price		 
      ,  post_flag		         =   v_stk_grn_hdr_rec.post_flag		 
      ,  posted_date		     =   v_stk_grn_hdr_rec.posted_date		 
      ,  wf_role_id		         =   v_stk_grn_hdr_rec.wf_role_id		 
      ,  wf_level		         =   v_stk_grn_hdr_rec.wf_level		     
      ,  wf_status		         =   v_stk_grn_hdr_rec.wf_status		 
      ,  status		             =   v_stk_grn_hdr_rec.status		     
      ,  updated   		         =   v_stk_grn_hdr_rec.updated   		 
      ,  data_source		     =   v_stk_grn_hdr_rec.data_source		 
      ,  updated_by              =   v_stk_grn_hdr_rec.updated_by        	

    where id         = a_id 
    and   storage_id =a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_grn_hdr_prc    (a_id                   in     number
                                    ,a_storage_id           in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    )
is 
   v_stk_grn_hdr_rec            stk_grn_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_grn_hdr(v_stk_grn_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_grn_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_grn_hdr 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_grn_hdr_ref   (a_data_column_json           varchar2 
                                  ,a_where                      varchar2  default null 
                                  ,a_lookup_json                varchar2  default null
                                  ,a_Page_no                    number    default 1 
                                  ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                  ,a_user_id                    number
                                  ,a_status_code          out   number
                                  ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_STK_GRN_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_hdr_prc      (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_grn_hdr_ref(     a_data_column_json                 => apex_json.get_varchar2(p_path => 'a_data_column_json')   
                                                               ,a_where                            => apex_json.get_varchar2(p_path => 'a_where')              
                                                               ,a_lookup_json                      => apex_json.get_varchar2(p_path => 'a_lookup_json')        
                                                               ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                               ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                               ,a_user_id                          => OWA_UTIL.get_cgi_env('a_user_id')                     
                                                               ,a_status_code                      => a_status_code                                           
                                                               ,a_result                           => a_result   
                                                               );
  end; 
else
    begin
    add_stk_grn_hdr_prc   (  a_storage_id	      => apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type			  => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_doc_date			  => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_storage_type		  => apex_json.get_varchar2(p_path => 'a_storage_type')
                            ,a_stk_id		      => apex_json.get_varchar2(p_path => 'a_stk_id')
                            ,a_stk_date			  => apex_json.get_varchar2(p_path => 'a_stk_date')
                            ,a_pur_bill_no		  => apex_json.get_varchar2(p_path => 'a_pur_bill_no')
                            ,a_pur_bill_date	  => apex_json.get_varchar2(p_path => 'a_pur_bill_date')
                            ,a_pay_type			  => apex_json.get_varchar2(p_path => 'a_pay_type')
                            ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_bill_of_landing	  => apex_json.get_varchar2(p_path => 'a_bill_of_landing')
                            ,a_supplier_id		  => apex_json.get_varchar2(p_path => 'a_supplier_id')
                            ,a_received_from	  => apex_json.get_varchar2(p_path => 'a_received_from')
                            ,a_rec_from_phone	  => apex_json.get_varchar2(p_path => 'a_rec_from_phone')
                            ,a_received_by		  => apex_json.get_varchar2(p_path => 'a_received_by')
                            ,a_currency			  => apex_json.get_varchar2(p_path => 'a_currency')
                            ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                            ,a_post_flag		  => apex_json.get_varchar2(p_path => 'a_post_flag')
                            ,a_posted_date		  => apex_json.get_varchar2(p_path => 'a_posted_date')
                            ,a_wf_role_id		  => apex_json.get_varchar2(p_path => 'a_wf_role_id')
                            ,a_wf_level			  => apex_json.get_varchar2(p_path => 'a_wf_level')
                            ,a_wf_status		  => apex_json.get_varchar2(p_path => 'a_wf_status')
                            ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                            ,a_status             => apex_json.get_varchar2(p_path => 'a_status')
                            ,a_user_id            => OWA_UTIL.get_cgi_env('a_user_id')
                            ,a_id				  => a_id                                                     
                            ,a_status_code        => a_status_code
                            ,a_result             => a_result  

                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_grn_hdr_prc    (   a_id				  => apex_json.get_varchar2(p_path => 'a_id')    
                            ,a_storage_id	      => apex_json.get_varchar2(p_path => 'a_storage_id')
                            ,a_doc_type			  => apex_json.get_varchar2(p_path => 'a_doc_type')
                            ,a_doc_date			  => apex_json.get_varchar2(p_path => 'a_doc_date')
                            ,a_storage_type		  => apex_json.get_varchar2(p_path => 'a_storage_type')
                            ,a_stk_id		      => apex_json.get_varchar2(p_path => 'a_stk_id')
                            ,a_stk_date			  => apex_json.get_varchar2(p_path => 'a_stk_date')
                            ,a_pur_bill_no		  => apex_json.get_varchar2(p_path => 'a_pur_bill_no')
                            ,a_pur_bill_date	  => apex_json.get_varchar2(p_path => 'a_pur_bill_date')
                            ,a_pay_type			  => apex_json.get_varchar2(p_path => 'a_pay_type')
                            ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                            ,a_bill_of_landing	  => apex_json.get_varchar2(p_path => 'a_bill_of_landing')
                            ,a_supplier_id		  => apex_json.get_varchar2(p_path => 'a_supplier_id')
                            ,a_received_from	  => apex_json.get_varchar2(p_path => 'a_received_from')
                            ,a_rec_from_phone	  => apex_json.get_varchar2(p_path => 'a_rec_from_phone')
                            ,a_received_by		  => apex_json.get_varchar2(p_path => 'a_received_by')
                            ,a_currency			  => apex_json.get_varchar2(p_path => 'a_currency')
                            ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                            ,a_post_flag		  => apex_json.get_varchar2(p_path => 'a_post_flag')
                            ,a_posted_date		  => apex_json.get_varchar2(p_path => 'a_posted_date')
                            ,a_wf_role_id		  => apex_json.get_varchar2(p_path => 'a_wf_role_id')
                            ,a_wf_level			  => apex_json.get_varchar2(p_path => 'a_wf_level')
                            ,a_wf_status		  => apex_json.get_varchar2(p_path => 'a_wf_status')
                            ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                            ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                            ,a_status             => apex_json.get_varchar2(p_path => 'a_status')
                            ,a_user_id            => OWA_UTIL.get_cgi_env('a_user_id')
                            ,a_status_code        => a_status_code
                            ,a_result             => a_result  

                            );                          
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_hdr_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_grn_hdr_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                           ,a_storage_id	       => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                           ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                           ,a_result               => a_result
                           ,a_status_code          => a_status_code
                           )   ;
end; 
--===================================================================================
-- stk_grn_fin_hdr 
--===================================================================================                             
 
    function validate_stk_grn_fin_hdr(v_stk_grn_fin_hdr_rec stk_grn_fin_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_grn_fin_hdr_prc  ( a_storage_id				in			number
                                    ,a_grn_id					in			number
                                    ,a_cur_id					in			number
                                    ,a_exch_price				in			number
                                    ,a_base_cur					in			number
                                    ,a_amount_type				in			number
                                    ,a_amount					in			number
                                    ,a_base_cur_amount			in			number
                                    ,a_grn_cur_amount			in			number
                                    ,a_trans_date    			in			varchar2
                                    ,a_data_source				in			number
                                    ,a_user_id                  in          number
                                    ,a_status					in			number
                                    ,a_id					    out			number
                                    ,a_status_code              out         number
                                    ,a_result                   out         ref_cur
                                    )
is 
    v_stk_grn_fin_hdr_rec            stk_grn_fin_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_fin_hdr(v_stk_grn_fin_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_grn_fin_hdr_rec.storage_id		  :=  a_storage_id		                                                                                  ;
        v_stk_grn_fin_hdr_rec.grn_id			  :=  a_grn_id			                                                                                  ;
        v_stk_grn_fin_hdr_rec.cur_id			  :=  a_cur_id			                                                                                  ;
        v_stk_grn_fin_hdr_rec.exch_price		  :=  a_exch_price		                                                                                  ;
        v_stk_grn_fin_hdr_rec.base_cur			  :=  a_base_cur			                                                                              ;
        v_stk_grn_fin_hdr_rec.amount_type		  :=  a_amount_type		                                                                                  ;
        v_stk_grn_fin_hdr_rec.amount			  :=  a_amount			                                                                                  ;
        v_stk_grn_fin_hdr_rec.base_cur_amount	  :=  a_base_cur_amount	                                                                                  ;
        v_stk_grn_fin_hdr_rec.grn_cur_amount	  :=  a_grn_cur_amount	                                                                                  ;
        v_stk_grn_fin_hdr_rec.ins_date			  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_grn_fin_hdr_rec.status     		  :=  a_status	                                                                                          ;
        v_stk_grn_fin_hdr_rec.data_source		  :=  a_data_source		                                                                                  ;
        v_stk_grn_fin_hdr_rec.created_by          :=  a_user_id                                                                                           ;	
        

                -- Insert GRN Hdr record
            insert into stk_grn_fin_hdr values v_stk_grn_fin_hdr_rec 
            returning id into a_id
            ;
            -- update items cost to include new costs in the header ( in case of inserting the costs after inserting GRN details)
            update stk_grn_dtl d
            set row_version=row_version+1
            where grn_id     = a_grn_id
            and   storage_id = a_storage_id
            ;
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
--                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
--                                                                 ,a_01          => sqlerrm
--                                                                 ,a_status_code => a_status_code
--                                                                 ,a_msg_cur     => a_result
--                                                                 );
RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_grn_fin_hdr_prc   ( a_id					    in			number
                                      ,a_storage_id				in			number
                                      ,a_grn_id					in			number
                                      ,a_cur_id					in			number
                                      ,a_exch_price				in			number
                                      ,a_base_cur				in			number
                                      ,a_amount_type			in			number
                                      ,a_amount					in			number
                                      ,a_base_cur_amount		in			number
                                      ,a_grn_cur_amount			in			number
                                      ,a_trans_date				in			varchar2
                                      ,a_data_source			in			number
                                      ,a_user_id                in          number
                                      ,a_status					in			number
                                      ,a_status_code            out         number
                                      ,a_result                 out         ref_cur
                                      )
is 
    v_stk_grn_fin_hdr_rec            stk_grn_fin_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_fin_hdr(v_stk_grn_fin_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_grn_fin_hdr_rec.storage_id		  :=  a_storage_id		                                                                                  ;
        v_stk_grn_fin_hdr_rec.grn_id			  :=  a_grn_id			                                                                                  ;
        v_stk_grn_fin_hdr_rec.cur_id			  :=  a_cur_id			                                                                                  ;
        v_stk_grn_fin_hdr_rec.exch_price		  :=  a_exch_price		                                                                                  ;
        v_stk_grn_fin_hdr_rec.base_cur			  :=  a_base_cur			                                                                              ;
        v_stk_grn_fin_hdr_rec.amount_type		  :=  a_amount_type		                                                                                  ;
        v_stk_grn_fin_hdr_rec.amount			  :=  a_amount			                                                                                  ;
        v_stk_grn_fin_hdr_rec.base_cur_amount	  :=  a_base_cur_amount	                                                                                  ;
        v_stk_grn_fin_hdr_rec.grn_cur_amount	  :=  a_grn_cur_amount	                                                                                  ;
        v_stk_grn_fin_hdr_rec.updated			  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_grn_fin_hdr_rec.status     		  :=  a_status	                                                                                          ;
        v_stk_grn_fin_hdr_rec.data_source		  :=  a_data_source		                                                                                  ;
        v_stk_grn_fin_hdr_rec.updated_by          :=  a_user_id                                                                                           ;	
        
        -- update Open Balance Dtl record
    update stk_grn_fin_hdr 
    set   
         storage_id		    =   v_stk_grn_fin_hdr_rec.storage_id			 
      ,  grn_id			    =   v_stk_grn_fin_hdr_rec.grn_id			                 
      ,  cur_id			    =   v_stk_grn_fin_hdr_rec.cur_id			     
      ,  exch_price		    =   v_stk_grn_fin_hdr_rec.exch_price		     
      ,  base_cur			=   v_stk_grn_fin_hdr_rec.base_cur				 
      ,  amount_type		=   v_stk_grn_fin_hdr_rec.amount_type		     
      ,  amount			    =   v_stk_grn_fin_hdr_rec.amount				 
      ,  base_cur_amount	=   v_stk_grn_fin_hdr_rec.base_cur_amount	     
      ,  grn_cur_amount	    =   v_stk_grn_fin_hdr_rec.grn_cur_amount	     
      ,  updated			=   v_stk_grn_fin_hdr_rec.updated				 
      ,  data_source		=   v_stk_grn_fin_hdr_rec.data_source			 
      ,  updated_by         =   v_stk_grn_fin_hdr_rec.updated_by        	 

    where id         = a_id 
    and   storage_id =a_storage_id; 
    
     -- update items cost to include new costs in the header ( in case of updating the costs after inserting GRN details)
            update stk_grn_dtl d
            set row_version  = row_version+1
            where grn_id     = a_grn_id
            and   storage_id = a_storage_id
            ;
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_grn_fin_hdr_prc    (a_id                   in     number
                                        ,a_storage_id           in     number
                                        ,a_user_id              in     number
                                        ,a_trans_date           in     varchar2 default to_char(sysdate)
                                        ,a_data_source          in     number
                                        ,a_result               out    ref_cur
                                        ,a_status_code          out    number
                                        )
is 
   v_stk_grn_fin_hdr_rec            stk_grn_fin_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_grn_fin_hdr(v_stk_grn_fin_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_grn_fin_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_grn_fin_hdr 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_grn_fin_hdr_ref   (a_data_column_json           varchar2 
                                      ,a_where                      varchar2  default null 
                                      ,a_lookup_json                varchar2  default null
                                      ,a_Page_no                    number    default 1 
                                      ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                      ,a_user_id                    number
                                      ,a_status_code          out   number
                                      ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_GRN_FIN_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_fin_hdr_prc    ( a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_grn_fin_hdr_ref( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                               ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                               ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                               ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                               ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                               ,a_user_id                          => OWA_UTIL.get_cgi_env('a_user_id')                     
                                                               ,a_status_code                      => a_status_code                                           
                                                               ,a_result                           => a_result   
                                                               );
  end; 
else
    begin
    add_stk_grn_fin_hdr_prc  (  a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                               ,a_grn_id			  => apex_json.get_varchar2(p_path => 'a_grn_id')
                               ,a_cur_id			  => apex_json.get_varchar2(p_path => 'a_cur_id')
                               ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                               ,a_base_cur			  => apex_json.get_varchar2(p_path => 'a_base_cur')
                               ,a_amount_type		  => apex_json.get_varchar2(p_path => 'a_amount_type')
                               ,a_amount			  => apex_json.get_varchar2(p_path => 'a_amount')
                               ,a_base_cur_amount	  => apex_json.get_varchar2(p_path => 'a_base_cur_amount')
                               ,a_grn_cur_amount	  => apex_json.get_varchar2(p_path => 'a_grn_cur_amount')
                               ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                               ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                               ,a_status              => apex_json.get_varchar2(p_path => 'a_status')
                               ,a_user_id             => OWA_UTIL.get_cgi_env('a_user_id')
                               ,a_id				  => a_id                                                     
                               ,a_status_code         => a_status_code
                               ,a_result              => a_result  
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_fin_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_grn_fin_hdr_prc    (  a_id				  => apex_json.get_varchar2(p_path => 'a_id') 
                           ,a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_grn_id			  => apex_json.get_varchar2(p_path => 'a_grn_id')
                           ,a_cur_id			  => apex_json.get_varchar2(p_path => 'a_cur_id')
                           ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                           ,a_base_cur			  => apex_json.get_varchar2(p_path => 'a_base_cur')
                           ,a_amount_type		  => apex_json.get_varchar2(p_path => 'a_amount_type')
                           ,a_amount			  => apex_json.get_varchar2(p_path => 'a_amount')
                           ,a_base_cur_amount	  => apex_json.get_varchar2(p_path => 'a_base_cur_amount')
                           ,a_grn_cur_amount	  => apex_json.get_varchar2(p_path => 'a_grn_cur_amount')
                           ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                           ,a_status              => apex_json.get_varchar2(p_path => 'a_status')
                           ,a_user_id             => OWA_UTIL.get_cgi_env('a_user_id')
                           ,a_status_code         => a_status_code
                           ,a_result              => a_result  
                         );                        
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_fin_hdr_prc    ( a_body                           in          blob 
                                         ,a_status_code                    in out      number
                                         ,a_result                         in out      ref_cur
                                         ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_grn_fin_hdr_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                               ,a_storage_id	       => apex_json.get_varchar2(p_path => 'a_storage_id')
                               ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                               ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                               ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                               ,a_result               => a_result
                               ,a_status_code          => a_status_code
                               )   ;
end; 
--===================================================================================
-- stk_grn_dtl 
--===================================================================================                             
 
    function validate_stk_grn_dtl(v_stk_grn_dtl_rec stk_grn_dtl%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_grn_dtl_prc  ( a_storage_id				in			number
                                ,a_doc_date					in			varchar2
                                ,a_grn_id					in			number
                                ,a_center_code				in			varchar2
                                ,a_item_id					in			number
                                ,a_batch_no					in			varchar2
                                ,a_deal_unit				in			number
                                ,a_deal_qty					in			number
                                ,a_bonus					in			number
                                ,a_free_qty					in			number
                                ,a_deal_cur					in			number
                                ,a_deal_cur_ucost			in			number
                                ,a_deal_cur_tcost			in			number
                                ,a_cash_discount			in			number
                                ,a_exch_price				in			number
                                ,a_prod_date				in			varchar2
                                ,a_expire_date				in			varchar2
                                ,a_funder					in			varchar2
                                ,a_donor					in			varchar2
                                ,a_activity					in			varchar2
                                ,a_account_code				in			varchar2
                                ,a_sale_policy				in			number
                                ,a_shared_item				in			number
                                ,a_post_flag				in			number
                                ,a_item_pos					in			number
                                ,a_trans_date			    in			varchar2
                                ,a_data_source				in			number
                                ,a_status					in			number
                                ,a_user_id                  in          number
                                ,a_id					    out			number
                                ,a_status_code              out         number
                                ,a_result                   out         ref_cur
                                )
is 
    v_stk_grn_dtl_rec            stk_grn_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_dtl(v_stk_grn_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_grn_dtl_rec.storage_id		 :=  a_storage_id		                                                                                        ;
        v_stk_grn_dtl_rec.doc_date			 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)			;
        v_stk_grn_dtl_rec.grn_id			 :=  a_grn_id			                                                                                        ;
        v_stk_grn_dtl_rec.center_code		 :=  a_center_code		                                                                                        ;
        v_stk_grn_dtl_rec.item_id			 :=  a_item_id			                                                                                        ;
        v_stk_grn_dtl_rec.batch_no			 :=  a_batch_no			                                                                                        ;
        v_stk_grn_dtl_rec.deal_unit		     :=  a_deal_unit		                                                                                        ;
        v_stk_grn_dtl_rec.deal_qty			 :=  a_deal_qty			                                                                                        ;
        v_stk_grn_dtl_rec.bonus			     :=  a_bonus			                                                                                        ;
        v_stk_grn_dtl_rec.free_qty			 :=  a_free_qty			                                                                                        ;
        v_stk_grn_dtl_rec.deal_cur			 :=  a_deal_cur			                                                                                        ;	
        v_stk_grn_dtl_rec.deal_cur_ucost     :=  a_deal_cur_ucost	                                                                                        ;	
        v_stk_grn_dtl_rec.deal_cur_tcost	 :=  a_deal_cur_tcost	                                                                                        ;
        v_stk_grn_dtl_rec.cash_discount	     :=  a_cash_discount	                                                                                        ;
        v_stk_grn_dtl_rec.exch_price		 :=  a_exch_price		                                                                                        ;
        v_stk_grn_dtl_rec.prod_date		     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_prod_date,a_data_source => a_data_source)		    ;
        v_stk_grn_dtl_rec.expire_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_expire_date,a_data_source => a_data_source)		;
        v_stk_grn_dtl_rec.funder			 :=  a_funder			                                                                                        ;
        v_stk_grn_dtl_rec.donor			     :=  a_donor			                                                                                        ;
        v_stk_grn_dtl_rec.activity			 :=  a_activity			                                                                                        ;
        v_stk_grn_dtl_rec.account_code		 :=  a_account_code		                                                                                        ;
        v_stk_grn_dtl_rec.sale_policy		 :=  a_sale_policy		                                                                                        ;
        v_stk_grn_dtl_rec.shared_item		 :=  a_shared_item		                                                                                        ;
        v_stk_grn_dtl_rec.post_flag		     :=  a_post_flag		                                                                                        ;
        v_stk_grn_dtl_rec.item_pos			 :=  a_item_pos			                                                                                        ;
        v_stk_grn_dtl_rec.ins_date  		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)		;
        v_stk_grn_dtl_rec.data_source		 :=  a_data_source		                                                                                        ;
        v_stk_grn_dtl_rec.status			 :=  a_status			                                                                                        ;
        v_stk_grn_dtl_rec.created_by         :=  a_user_id                                                                                                  ;


                -- Insert GRN Dtl record
            insert into stk_grn_dtl values v_stk_grn_dtl_rec 
            returning id into a_id
            ;

                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
--------------------------------------------------------------------------------
procedure edit_stk_grn_dtl_prc ( a_id					    in			number
                                ,a_storage_id				in			number
                                ,a_doc_date					in			varchar2
                                ,a_grn_id					in			number
                                ,a_center_code				in			varchar2
                                ,a_item_id					in			number
                                ,a_batch_no					in			varchar2
                                ,a_deal_unit				in			number
                                ,a_deal_qty					in			number
                                ,a_bonus					in			number
                                ,a_free_qty					in			number
                                ,a_deal_cur					in			number
                                ,a_deal_cur_ucost			in			number
                                ,a_deal_cur_tcost			in			number
                                ,a_cash_discount			in			number
                                ,a_exch_price				in			number
                                ,a_prod_date				in			varchar2
                                ,a_expire_date				in			varchar2
                                ,a_funder					in			varchar2
                                ,a_donor					in			varchar2
                                ,a_activity					in			varchar2
                                ,a_account_code				in			varchar2
                                ,a_sale_policy				in			number
                                ,a_shared_item				in			number
                                ,a_post_flag				in			number
                                ,a_item_pos					in			number
                                ,a_trans_date			    in			varchar2
                                ,a_data_source				in			number
                                ,a_status					in			number
                                ,a_user_id                  in          number
                                ,a_status_code              out         number
                                ,a_result                   out         ref_cur
                                )
is 
    v_stk_grn_dtl_rec            stk_grn_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_grn_dtl(v_stk_grn_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
         -- Assign values     
        v_stk_grn_dtl_rec.storage_id		 :=  a_storage_id		                                                                                        ;
        v_stk_grn_dtl_rec.doc_date			 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)			;
        v_stk_grn_dtl_rec.grn_id			 :=  a_grn_id			                                                                                        ;
        v_stk_grn_dtl_rec.center_code		 :=  a_center_code		                                                                                        ;
        v_stk_grn_dtl_rec.item_id			 :=  a_item_id			                                                                                        ;
        v_stk_grn_dtl_rec.batch_no			 :=  a_batch_no			                                                                                        ;
        v_stk_grn_dtl_rec.deal_unit		     :=  a_deal_unit		                                                                                        ;
        v_stk_grn_dtl_rec.deal_qty			 :=  a_deal_qty			                                                                                        ;
        v_stk_grn_dtl_rec.bonus			     :=  a_bonus			                                                                                        ;
        v_stk_grn_dtl_rec.free_qty			 :=  a_free_qty			                                                                                        ;
        v_stk_grn_dtl_rec.deal_cur			 :=  a_deal_cur			                                                                                        ;	
        v_stk_grn_dtl_rec.deal_cur_ucost     :=  a_deal_cur_ucost	                                                                                        ;	
        v_stk_grn_dtl_rec.deal_cur_tcost	 :=  a_deal_cur_tcost	                                                                                        ;
        v_stk_grn_dtl_rec.cash_discount	     :=  a_cash_discount	                                                                                        ;
        v_stk_grn_dtl_rec.exch_price		 :=  a_exch_price		                                                                                        ;
        v_stk_grn_dtl_rec.prod_date		     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_prod_date,a_data_source => a_data_source)		    ;
        v_stk_grn_dtl_rec.expire_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_expire_date,a_data_source => a_data_source)		;
        v_stk_grn_dtl_rec.funder			 :=  a_funder			                                                                                        ;
        v_stk_grn_dtl_rec.donor			     :=  a_donor			                                                                                        ;
        v_stk_grn_dtl_rec.activity			 :=  a_activity			                                                                                        ;
        v_stk_grn_dtl_rec.account_code		 :=  a_account_code		                                                                                        ;
        v_stk_grn_dtl_rec.sale_policy		 :=  a_sale_policy		                                                                                        ;
        v_stk_grn_dtl_rec.shared_item		 :=  a_shared_item		                                                                                        ;
        v_stk_grn_dtl_rec.post_flag		     :=  a_post_flag		                                                                                        ;
        v_stk_grn_dtl_rec.item_pos			 :=  a_item_pos			                                                                                        ;
        v_stk_grn_dtl_rec.updated   		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)		;
        v_stk_grn_dtl_rec.data_source		 :=  a_data_source		                                                                                        ;
        v_stk_grn_dtl_rec.status			 :=  a_status			                                                                                        ;
        v_stk_grn_dtl_rec.updated_by         :=  a_user_id                                                                                                  ;
        
        -- update GRN Dtl record
    update stk_grn_dtl 
    set   
         storage_id		    =   v_stk_grn_dtl_rec.storage_id			 
      ,  doc_date			=   v_stk_grn_dtl_rec.doc_date			              
      ,  grn_id			    =   v_stk_grn_dtl_rec.grn_id			     
      ,  center_code		=   v_stk_grn_dtl_rec.center_code		     
      ,  item_id			=   v_stk_grn_dtl_rec.item_id				 
      ,  batch_no			=   v_stk_grn_dtl_rec.batch_no			     
      ,  deal_unit		    =   v_stk_grn_dtl_rec.deal_unit		    	 
      ,  deal_qty			=   v_stk_grn_dtl_rec.deal_qty			     
      ,  bonus			    =   v_stk_grn_dtl_rec.bonus			         
      ,  free_qty			=   v_stk_grn_dtl_rec.free_qty				 
      ,  deal_cur			=   v_stk_grn_dtl_rec.deal_cur				 
      ,  deal_cur_ucost     =   v_stk_grn_dtl_rec.deal_cur_ucost    	 
      ,  deal_cur_tcost	    =   v_stk_grn_dtl_rec.deal_cur_tcost		 
      ,  cash_discount	    =   v_stk_grn_dtl_rec.cash_discount	    	 
      ,  exch_price		    =   v_stk_grn_dtl_rec.exch_price			 
      ,  prod_date		    =   v_stk_grn_dtl_rec.prod_date		    	 
      ,  expire_date		=   v_stk_grn_dtl_rec.expire_date			 
      ,  funder			    =   v_stk_grn_dtl_rec.funder				 
      ,  donor			    =   v_stk_grn_dtl_rec.donor			    	 
      ,  activity			=   v_stk_grn_dtl_rec.activity				 
      ,  account_code		=   v_stk_grn_dtl_rec.account_code			 
      ,  sale_policy		=   v_stk_grn_dtl_rec.sale_policy			 
      ,  shared_item		=   v_stk_grn_dtl_rec.shared_item			 
      ,  post_flag		    =   v_stk_grn_dtl_rec.post_flag		    	 
      ,  item_pos			=   v_stk_grn_dtl_rec.item_pos				 
      ,  updated   		    =   v_stk_grn_dtl_rec.updated   			 
      ,  data_source		=   v_stk_grn_dtl_rec.data_source			 
      ,  status			    =   v_stk_grn_dtl_rec.status				 
      ,  updated_by         =   v_stk_grn_dtl_rec.updated_by        	 
    where id         = a_id 
    and   storage_id =a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_grn_dtl_prc    (a_id                   in     number
                                    ,a_storage_id           in     number
                                    ,a_user_id              in     number
                                    ,a_trans_date           in     varchar2 default to_char(sysdate)
                                    ,a_data_source          in     number
                                    ,a_result               out    ref_cur
                                    ,a_status_code          out    number
                                    )
is 
   v_stk_grn_dtl_rec            stk_grn_dtl%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_grn_dtl(v_stk_grn_dtl_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_grn_dtl_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_grn_dtl 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_grn_dtl_ref       (a_data_column_json           varchar2 
                                      ,a_where                      varchar2  default null 
                                      ,a_lookup_json                varchar2  default null
                                      ,a_Page_no                    number    default 1 
                                      ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                      ,a_user_id                    number
                                      ,a_status_code          out   number
                                      ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_GRN_DTL
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_grn_dtl_prc      (   a_body                           in          blob 
                                  ,a_json                           in out      ref_cur                                    
                                  ,a_id                             in out      number
                                  ,a_status_code                    in out      number
                                  ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_grn_dtl_ref(     a_data_column_json                 => apex_json.get_varchar2(p_path => 'a_data_column_json')   
                                                               ,a_where                            => apex_json.get_varchar2(p_path => 'a_where')              
                                                               ,a_lookup_json                      => apex_json.get_varchar2(p_path => 'a_lookup_json')        
                                                               ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                               ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                               ,a_user_id                          => OWA_UTIL.get_cgi_env('a_user_id')                     
                                                               ,a_status_code                      => a_status_code                                           
                                                               ,a_result                           => a_result   
                                                               );
  end; 
else
    begin
    add_stk_grn_dtl_prc  (      a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                               ,a_doc_date			  => apex_json.get_varchar2(p_path => 'a_doc_date')
                               ,a_grn_id			  => apex_json.get_varchar2(p_path => 'a_grn_id')
                               ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                               ,a_item_id			  => apex_json.get_varchar2(p_path => 'a_item_id')
                               ,a_batch_no			  => apex_json.get_varchar2(p_path => 'a_batch_no')
                               ,a_deal_unit			  => apex_json.get_varchar2(p_path => 'a_deal_unit')
                               ,a_deal_qty		      => apex_json.get_varchar2(p_path => 'a_deal_qty')
                               ,a_bonus			      => apex_json.get_varchar2(p_path => 'a_bonus')
                               ,a_free_qty			  => apex_json.get_varchar2(p_path => 'a_free_qty')
                               ,a_deal_cur			  => apex_json.get_varchar2(p_path => 'a_deal_cur')
                               ,a_deal_cur_ucost	  => apex_json.get_varchar2(p_path => 'a_deal_cur_ucost')
                               ,a_deal_cur_tcost	  => apex_json.get_varchar2(p_path => 'a_deal_cur_tcost')
                               ,a_cash_discount	      => apex_json.get_varchar2(p_path => 'a_cash_discount')
                               ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                               ,a_prod_date		      => apex_json.get_varchar2(p_path => 'a_prod_date')
                               ,a_expire_date		  => apex_json.get_varchar2(p_path => 'a_expire_date')
                               ,a_funder			  => apex_json.get_varchar2(p_path => 'a_funder')
                               ,a_donor			      => apex_json.get_varchar2(p_path => 'a_donor')
                               ,a_activity			  => apex_json.get_varchar2(p_path => 'a_activity')
                               ,a_account_code		  => apex_json.get_varchar2(p_path => 'a_account_code')
                               ,a_sale_policy		  => apex_json.get_varchar2(p_path => 'a_sale_policy')
                               ,a_shared_item		  => apex_json.get_varchar2(p_path => 'a_shared_item')
                               ,a_post_flag		      => apex_json.get_varchar2(p_path => 'a_post_flag')
                               ,a_item_pos			  => apex_json.get_varchar2(p_path => 'a_item_pos')
                               ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                               ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                               ,a_status              => apex_json.get_varchar2(p_path => 'a_status')
                               ,a_user_id             => OWA_UTIL.get_cgi_env('a_user_id')
                               ,a_id				  => a_id                                                     
                               ,a_status_code         => a_status_code
                               ,a_result              => a_result  
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_grn_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_grn_dtl_prc    (      a_id				  => apex_json.get_varchar2(p_path => 'a_id') 
                               ,a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                               ,a_doc_date			  => apex_json.get_varchar2(p_path => 'a_doc_date')
                               ,a_grn_id			  => apex_json.get_varchar2(p_path => 'a_grn_id')
                               ,a_center_code		  => apex_json.get_varchar2(p_path => 'a_center_code')
                               ,a_item_id			  => apex_json.get_varchar2(p_path => 'a_item_id')
                               ,a_batch_no			  => apex_json.get_varchar2(p_path => 'a_batch_no')
                               ,a_deal_unit			  => apex_json.get_varchar2(p_path => 'a_deal_unit')
                               ,a_deal_qty		      => apex_json.get_varchar2(p_path => 'a_deal_qty')
                               ,a_bonus			      => apex_json.get_varchar2(p_path => 'a_bonus')
                               ,a_free_qty			  => apex_json.get_varchar2(p_path => 'a_free_qty')
                               ,a_deal_cur			  => apex_json.get_varchar2(p_path => 'a_deal_cur')
                               ,a_deal_cur_ucost	  => apex_json.get_varchar2(p_path => 'a_deal_cur_ucost')
                               ,a_deal_cur_tcost	  => apex_json.get_varchar2(p_path => 'a_deal_cur_tcost')
                               ,a_cash_discount	      => apex_json.get_varchar2(p_path => 'a_cash_discount')
                               ,a_exch_price		  => apex_json.get_varchar2(p_path => 'a_exch_price')
                               ,a_prod_date		      => apex_json.get_varchar2(p_path => 'a_prod_date')
                               ,a_expire_date		  => apex_json.get_varchar2(p_path => 'a_expire_date')
                               ,a_funder			  => apex_json.get_varchar2(p_path => 'a_funder')
                               ,a_donor			      => apex_json.get_varchar2(p_path => 'a_donor')
                               ,a_activity			  => apex_json.get_varchar2(p_path => 'a_activity')
                               ,a_account_code		  => apex_json.get_varchar2(p_path => 'a_account_code')
                               ,a_sale_policy		  => apex_json.get_varchar2(p_path => 'a_sale_policy')
                               ,a_shared_item		  => apex_json.get_varchar2(p_path => 'a_shared_item')
                               ,a_post_flag		      => apex_json.get_varchar2(p_path => 'a_post_flag')
                               ,a_item_pos			  => apex_json.get_varchar2(p_path => 'a_item_pos')
                               ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                               ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                               ,a_status              => apex_json.get_varchar2(p_path => 'a_status')
                               ,a_user_id             => OWA_UTIL.get_cgi_env('a_user_id')
                               ,a_status_code         => a_status_code
                               ,a_result              => a_result  
                            );                    
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_grn_dtl_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_grn_dtl_prc        ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                               ,a_storage_id	       => apex_json.get_varchar2(p_path => 'a_storage_id')
                               ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                               ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                               ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                               ,a_result               => a_result
                               ,a_status_code          => a_status_code
                               )   ;
end;  
--===================================================================================
-- stk_order_hdr 
--===================================================================================                             
 
    function validate_stk_order_hdr(v_stk_order_hdr_rec stk_order_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_order_hdr_prc  ( a_storage_id				in			number
                                  ,a_doc_type				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_center_code			in			varchar2
                                  ,a_spend_desc				in			varchar2
                                  ,a_activity				in			varchar2
                                  ,a_currency				in			number
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_id					    out			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  )
is 
    v_stk_order_hdr_rec            stk_order_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_order_hdr(v_stk_order_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_order_hdr_rec.storage_id	  :=  a_storage_id		                                                                                  ;
        v_stk_order_hdr_rec.doc_type	  :=  a_doc_type		                                                                                  ;
        v_stk_order_hdr_rec.doc_date	  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_hdr_rec.center_code   :=  a_center_code	                                                                                      ;
        v_stk_order_hdr_rec.spend_desc	  :=  a_spend_desc			                                                                              ;
        v_stk_order_hdr_rec.activity	  :=  a_activity		                                                                                  ;
        v_stk_order_hdr_rec.currency	  :=  a_currency		                                                                                  ;
        v_stk_order_hdr_rec.ins_date	  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_order_hdr_rec.status     	  :=  a_status	                                                                                          ;
        v_stk_order_hdr_rec.data_source	  :=  a_data_source		                                                                                  ;
        v_stk_order_hdr_rec.created_by    :=  a_user_id                                                                                           ;	
        

                -- Insert GRN Hdr record
            insert into stk_order_hdr values v_stk_order_hdr_rec 
            returning id into a_id
            ;
          
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
--                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
--                                                                 ,a_01          => sqlerrm
--                                                                 ,a_status_code => a_status_code
--                                                                 ,a_msg_cur     => a_result
--                                                                 );
RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_order_hdr_prc ( a_id					    in			number
                                  ,a_storage_id				in			number
                                  ,a_doc_type				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_center_code			in			varchar2
                                  ,a_spend_desc				in			varchar2
                                  ,a_activity				in			varchar2
                                  ,a_currency				in			number
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  )
is 
    v_stk_order_hdr_rec            stk_order_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_order_hdr(v_stk_order_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_order_hdr_rec.storage_id	  :=  a_storage_id		                                                                                  ;
        v_stk_order_hdr_rec.doc_type	  :=  a_doc_type		                                                                                  ;
        v_stk_order_hdr_rec.doc_date	  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_hdr_rec.center_code   :=  a_center_code	                                                                                      ;
        v_stk_order_hdr_rec.spend_desc	  :=  a_spend_desc			                                                                              ;
        v_stk_order_hdr_rec.activity	  :=  a_activity		                                                                                  ;
        v_stk_order_hdr_rec.currency	  :=  a_currency		                                                                                  ;
        v_stk_order_hdr_rec.updated  	  :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_order_hdr_rec.status     	  :=  a_status	                                                                                          ;
        v_stk_order_hdr_rec.data_source	  :=  a_data_source		                                                                                  ;
        v_stk_order_hdr_rec.updated_by    :=  a_user_id                                                                                           ;		
        
        -- update Open Balance Dtl record
    update stk_order_hdr 
    set   
         storage_id	     =   v_stk_order_hdr_rec.storage_id		 
      ,  doc_type	     =   v_stk_order_hdr_rec.doc_type	                  
      ,  doc_date	     =   v_stk_order_hdr_rec.doc_date	     
      ,  center_code     =   v_stk_order_hdr_rec.center_code     
      ,  spend_desc		 =   v_stk_order_hdr_rec.spend_desc	     
      ,  activity		 =   v_stk_order_hdr_rec.activity		 
      ,  currency	     =   v_stk_order_hdr_rec.currency		 
      ,  updated  		 =   v_stk_order_hdr_rec.updated  		 
      ,  status     	 =   v_stk_order_hdr_rec.status     	 
      ,  data_source	 =   v_stk_order_hdr_rec.data_source     
      ,  updated_by  	 =   v_stk_order_hdr_rec.updated_by      

    where id         = a_id 
    and   storage_id = a_storage_id; 
    
     
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_order_hdr_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_order_hdr_rec            stk_order_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_order_hdr(v_stk_order_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_order_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_order_hdr 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_order_hdr_ref   (a_data_column_json           varchar2 
                                    ,a_where                      varchar2  default null 
                                    ,a_lookup_json                varchar2  default null
                                    ,a_Page_no                    number    default 1 
                                    ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                    ,a_user_id                    number
                                    ,a_status_code          out   number
                                    ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_ORDER_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_order_hdr_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_order_hdr_ref( a_data_column_json                 => apex_json.get_varchar2      (p_path => 'a_data_column_json')   
                                                             ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                             ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                             ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                             ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                             ,a_user_id                          => OWA_UTIL.get_cgi_env('a_user_id')                     
                                                             ,a_status_code                      => a_status_code                                           
                                                             ,a_result                           => a_result   
                                                             );
  end; 
else
    begin
    add_stk_order_hdr_prc  (  a_storage_id	      => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_doc_type	      => apex_json.get_varchar2(p_path => 'a_doc_type')
                             ,a_doc_date	      => apex_json.get_varchar2(p_path => 'a_doc_date')
                             ,a_center_code       => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_spend_desc	      => apex_json.get_varchar2(p_path => 'a_spend_desc')
                             ,a_activity	      => apex_json.get_varchar2(p_path => 'a_activity')
                             ,a_currency	      => apex_json.get_varchar2(p_path => 'a_currency')
                             ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		  => OWA_UTIL.get_cgi_env('a_data_source')
                             ,a_status            => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id           => OWA_UTIL.get_cgi_env('a_user_id')
                             ,a_id				  => a_id                                                     
                             ,a_status_code       => a_status_code
                             ,a_result            => a_result  
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_order_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_order_hdr_prc    (  a_id				  => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	      => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_doc_type	      => apex_json.get_varchar2(p_path => 'a_doc_type')
                             ,a_doc_date	      => apex_json.get_varchar2(p_path => 'a_doc_date')
                             ,a_center_code       => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_spend_desc	      => apex_json.get_varchar2(p_path => 'a_spend_desc')
                             ,a_activity	      => apex_json.get_varchar2(p_path => 'a_activity')
                             ,a_currency	      => apex_json.get_varchar2(p_path => 'a_currency')
                             ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		  => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_status            => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id           => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_status_code       => a_status_code
                             ,a_result            => a_result  
                            );                    
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_order_hdr_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_order_hdr_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
--===================================================================================
-- stk_order_dtl 
--===================================================================================                             
 
    function validate_stk_order_dtl(v_stk_order_dtl_rec stk_order_dtl%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_order_dtl_prc  ( a_storage_id			    in			number
                                  ,a_order_id				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_to_center			    in			varchar2
                                  ,a_mov_stamp			    in			varchar2
                                  ,a_item_id				in			number
                                  ,a_deal_unit			    in			number
                                  ,a_deal_unit_qty		    in			number
                                  ,a_deal_cur				in			number
                                  ,a_to_activity			in			varchar2
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_id					    out			number
                                  ,a_msg_id                 in out      varchar2
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  )
is 
    v_stk_order_dtl_rec            stk_order_dtl%rowtype;
    v_stk_order_dtl_val_rec        stk_order_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if;
        
        -- Assign values     
        v_stk_order_dtl_val_rec.storage_id		 :=  a_storage_id		                                                                                  ;
        v_stk_order_dtl_val_rec.order_id		 :=  a_order_id     	                                                                                  ;
        v_stk_order_dtl_val_rec.doc_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_dtl_val_rec.to_center		 :=  a_to_center	                                                                                      ;
        v_stk_order_dtl_val_rec.mov_stamp		 :=  a_mov_stamp		                                                                                  ;
        v_stk_order_dtl_val_rec.item_id		     :=  a_item_id		                                                                                      ;
        v_stk_order_dtl_val_rec.deal_unit		 :=  a_deal_unit		                                                                                  ;
        v_stk_order_dtl_val_rec.deal_unit_qty	 :=  a_deal_unit_qty	                                                                                  ;
        v_stk_order_dtl_val_rec.deal_cur		 :=  a_deal_cur		                                                                                      ;
        v_stk_order_dtl_val_rec.to_activity	     :=  a_to_activity                                                                                        ;	
        v_stk_order_dtl_val_rec.ins_date 	     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_order_dtl_val_rec.status     	     :=  a_status	                                                                                          ;
        v_stk_order_dtl_val_rec.data_source	     :=  a_data_source		                                                                                  ;
        v_stk_order_dtl_val_rec.created_by       :=  a_user_id                                                                                            ;	
       


       -- delete action if a_status=0 before validation
        if    v_stk_order_dtl_val_rec.status =0 then
                delete from stk_order_dtl
                where storage_id = a_storage_id
                and   order_id   = a_order_id
                and   item_id    = a_item_id;
        elsif v_stk_order_dtl_val_rec.status =1 then
       -- Validate Order Dtl 
            if not MDL_STOCK.stock_pkg.validate_stk_order_dtl(a_stk_order_dtl_val_rec => v_stk_order_dtl_val_rec
                                                            ,a_msg_id                => a_msg_id
                                                            ,a_status_code           => a_status_code
                                                            ,a_result                => a_result) then 
                
            mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => a_msg_id
                                                     ,a_01          => v_stk_order_dtl_val_rec.item_id
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
            --RAISE_APPLICATION_ERROR (-200102,'ggggggggggggggggggg'); 
            end if;
        end if;
        
        delete from stk_order_dtl
            where storage_id = a_storage_id
            and   order_id   = a_order_id
            and   item_id    = a_item_id
            ;
           	
        FOR i IN
                (
                SELECT *
                FROM   TABLE(MDL_STOCK.stock_trans_pck.GET_ITEM_STAMP_ROW(a_item_id,a_deal_unit,a_storage_id,a_deal_unit_qty,a_mov_stamp))
                WHERE T_REMAIN_QTY>=0
                ) LOOP
        
        if a_status =1 then
        -- Assign values     
        v_stk_order_dtl_rec.storage_id		 :=  a_storage_id		                                                                                  ;
        v_stk_order_dtl_rec.order_id		 :=  a_order_id     	                                                                                  ;
        v_stk_order_dtl_rec.doc_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_dtl_rec.to_center		 :=  a_to_center	                                                                                      ;
        v_stk_order_dtl_rec.mov_stamp		 :=  i.T_MOV_STAMP		                                                                                  ;
        v_stk_order_dtl_rec.item_id		     :=  a_item_id		                                                                                      ;
        v_stk_order_dtl_rec.deal_unit		 :=  a_deal_unit		                                                                                  ;
        v_stk_order_dtl_rec.deal_unit_qty	 :=  i.T_DEAL_TAKEN_QTY	                                                                                      ;
        v_stk_order_dtl_rec.deal_cur_ucost	 :=  i.T_UNIT_COST	                                                                                      ;
         v_stk_order_dtl_rec.center_code	 :=  i.T_CENTER	                                                                                      ;
        v_stk_order_dtl_rec.deal_cur		 :=  a_deal_cur		                                                                                      ;
        v_stk_order_dtl_rec.to_activity	     :=  a_to_activity                                                                                        ;	
        v_stk_order_dtl_rec.ins_date	     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_order_dtl_rec.status     	     :=  a_status	                                                                                          ;
        v_stk_order_dtl_rec.data_source	     :=  a_data_source		                                                                                  ;
        v_stk_order_dtl_rec.created_by       :=  a_user_id                                                                                            ;
        
            -- Insert Order Dtl record
            
            insert into stk_order_dtl values v_stk_order_dtl_rec 
            returning id into a_id
            ;
	    end if;
        end loop;        
        
        
        

            
          
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
--                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
--                                                                 ,a_01          => sqlerrm
--                                                                 ,a_status_code => a_status_code
--                                                                 ,a_msg_cur     => a_result
--                                                                 );
RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_order_dtl_prc ( a_id					    in out      number
                                  ,a_storage_id			    in			number
                                  ,a_order_id				in			number
                                  ,a_doc_date				in			varchar2
                                  ,a_to_center			    in			varchar2
                                  ,a_mov_stamp			    in			varchar2
                                  ,a_item_id				in			number
                                  ,a_deal_unit			    in			number
                                  ,a_deal_unit_qty		    in			number
                                  ,a_deal_cur				in			number
                                  ,a_to_activity			in			varchar2
                                  ,a_trans_date    			in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status					in			number
                                  ,a_msg_id                 in out      varchar2
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  )
is 
    v_stk_order_dtl_rec            stk_order_dtl%rowtype;
    v_stk_order_dtl_val_rec        stk_order_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
              
       
        -- Assign values     
        v_stk_order_dtl_val_rec.storage_id		 :=  a_storage_id		                                                                                  ;
        v_stk_order_dtl_val_rec.order_id		 :=  a_order_id     	                                                                                  ;
        v_stk_order_dtl_val_rec.doc_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_dtl_val_rec.to_center		 :=  a_to_center	                                                                                      ;
        v_stk_order_dtl_val_rec.mov_stamp		 :=  a_mov_stamp		                                                                                  ;
        v_stk_order_dtl_val_rec.item_id		     :=  a_item_id		                                                                                      ;
        v_stk_order_dtl_val_rec.deal_unit		 :=  a_deal_unit		                                                                                  ;
        v_stk_order_dtl_val_rec.deal_unit_qty	 :=  a_deal_unit_qty	                                                                                  ;
        v_stk_order_dtl_val_rec.deal_cur		 :=  a_deal_cur		                                                                                      ;
        v_stk_order_dtl_val_rec.to_activity	     :=  a_to_activity                                                                                        ;	
        v_stk_order_dtl_val_rec.ins_date 	     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_order_dtl_val_rec.status     	     :=  a_status	                                                                                          ;
        v_stk_order_dtl_val_rec.data_source	     :=  a_data_source		                                                                                  ;
        v_stk_order_dtl_val_rec.created_by       :=  a_user_id                                                                                            ;	
        
        -- Validate Order Dtl 
        if not MDL_STOCK.stock_pkg.validate_stk_order_dtl(a_stk_order_dtl_val_rec => v_stk_order_dtl_val_rec
                                                         ,a_msg_id                => a_msg_id
                                                         ,a_status_code           => a_status_code
                                                         ,a_result                => a_result) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => a_msg_id
                                                     ,a_01          => v_stk_order_dtl_val_rec.item_id
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
            --RAISE_APPLICATION_ERROR (-200102,'ggggggggggggggggggg'); 
        end if;   	
 /*        
        -- update Open Balance Dtl record
    update stk_order_dtl 
    set   
         storage_id		 =   nvl(v_stk_order_dtl_rec.storage_id		 ,storage_id      )
      ,  order_id		 =   nvl(v_stk_order_dtl_rec.order_id		 ,order_id		  )             
      ,  doc_date		 =   nvl(v_stk_order_dtl_rec.doc_date		 ,doc_date		  )
      ,  to_center		 =   nvl(v_stk_order_dtl_rec.to_center		 ,to_center		  )
      ,  mov_stamp		 =   nvl(v_stk_order_dtl_rec.mov_stamp		 ,mov_stamp		  )
      ,  item_id		 =   nvl(v_stk_order_dtl_rec.item_id		 ,item_id		  )
      ,  deal_unit		 =   nvl(v_stk_order_dtl_rec.deal_unit		 ,deal_unit		  )
      ,  deal_unit_qty	 =   nvl(v_stk_order_dtl_rec.deal_unit_qty	 ,deal_unit_qty	  )
      ,  deal_cur		 =   nvl(v_stk_order_dtl_rec.deal_cur		 ,deal_cur		  )
      ,  to_activity	 =   nvl(v_stk_order_dtl_rec.to_activity	 ,to_activity	  )
      ,  updated 	     =   nvl(v_stk_order_dtl_rec.updated 	     ,updated 	      )
      ,  status     	 =   nvl(v_stk_order_dtl_rec.status     	 ,status     	  )   
      ,  data_source	 =   nvl(v_stk_order_dtl_rec.data_source	 ,data_source	  )   
      ,  updated_by      =   nvl(v_stk_order_dtl_rec.updated_by      ,updated_by      )
      

    where id         = a_id 
    and   storage_id =a_storage_id; 
    */
    -- delete old ones
    
    
    
     delete from stk_order_dtl
            where storage_id = a_storage_id
            and   order_id   = a_order_id
            and   item_id    = a_item_id
            ;
            
    FOR i IN
                (
                SELECT *
                FROM   TABLE(MDL_STOCK.stock_trans_pck.GET_ITEM_STAMP_ROW(a_item_id,a_deal_unit,a_storage_id,a_deal_unit_qty,a_mov_stamp))
                WHERE T_REMAIN_QTY>=0
                ) LOOP
        
        
        -- Assign values     
        v_stk_order_dtl_rec.storage_id		 :=  a_storage_id		                                                                                  ;
        v_stk_order_dtl_rec.order_id		 :=  a_order_id     	                                                                                  ;
        v_stk_order_dtl_rec.doc_date		 :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)	  ;
        v_stk_order_dtl_rec.to_center		 :=  a_to_center	                                                                                      ;
        v_stk_order_dtl_rec.mov_stamp		 :=  i.T_MOV_STAMP		                                                                                  ;
        v_stk_order_dtl_rec.item_id		     :=  a_item_id		                                                                                      ;
        v_stk_order_dtl_rec.deal_unit		 :=  a_deal_unit		                                                                                  ;
        v_stk_order_dtl_rec.deal_unit_qty	 :=  i.T_DEAL_TAKEN_QTY	                                                                                  ;
        v_stk_order_dtl_rec.deal_cur_ucost	 :=  i.T_UNIT_COST	                                                                                      ;
        v_stk_order_dtl_rec.center_code	     :=  i.T_CENTER	                                                                                          ;
        v_stk_order_dtl_rec.deal_cur		 :=  a_deal_cur		                                                                                      ;
        v_stk_order_dtl_rec.to_activity	     :=  a_to_activity                                                                                        ;	
        v_stk_order_dtl_rec.ins_date	     :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_order_dtl_rec.status     	     :=  a_status	                                                                                          ;
        v_stk_order_dtl_rec.data_source	     :=  a_data_source		                                                                                  ;
        v_stk_order_dtl_rec.created_by       :=  a_user_id                                                                                            ;
        

            -- Insert Order Dtl record
            insert into stk_order_dtl values v_stk_order_dtl_rec 
            returning id into a_id
            ;
        	
        end loop;
  
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_order_dtl_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_order_dtl_rec            stk_order_dtl%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_order_dtl(v_stk_order_dtl_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_order_dtl_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_order_dtl 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_order_dtl_ref   (a_data_column_json           varchar2 
                                    ,a_where                      varchar2  default null 
                                    ,a_lookup_json                varchar2  default null
                                    ,a_Page_no                    number    default 1 
                                    ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                    ,a_user_id                    number
                                    ,a_status_code          out   number
                                    ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.c_VW_STK_ORDER_DTL
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_order_dtl_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_order_dtl_ref( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                             ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                             ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                             ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                             ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                             ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                             ,a_status_code                      => a_status_code                                           
                                                             ,a_result                           => a_result   
                                                             );
  end; 
else
    begin
    add_stk_order_dtl_prc  (  a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_order_id		  => apex_json.get_varchar2(p_path => 'a_order_id')
                             ,a_doc_date		  => apex_json.get_varchar2(p_path => 'a_doc_date')
                             ,a_to_center		  => apex_json.get_varchar2(p_path => 'a_to_center')
                             ,a_mov_stamp		  => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                             ,a_item_id		      => apex_json.get_varchar2(p_path => 'a_item_id')
                             ,a_deal_unit		  => apex_json.get_varchar2(p_path => 'a_deal_unit')
                             ,a_deal_unit_qty	  => apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                             ,a_deal_cur		  => apex_json.get_varchar2(p_path => 'a_deal_cur')
                             ,a_to_activity	      => apex_json.get_varchar2(p_path => 'a_to_activity')
                             ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		  => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_status            => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id           => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_id				  => a_id  
                             ,a_msg_id            => a_msg_id                                                   
                             ,a_status_code       => a_status_code
                             ,a_result            => a_result  
                            );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_order_dtl_prc    ( a_body                           in          blob 
                                     ,a_id                             in out      number
                                     ,a_msg_id                         in out      varchar2
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                    ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_order_dtl_prc    (  a_id				  => a_id  
                             ,a_storage_id		  => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_order_id		  => apex_json.get_varchar2(p_path => 'a_order_id')
                             ,a_doc_date		  => apex_json.get_varchar2(p_path => 'a_doc_date')
                             ,a_to_center		  => apex_json.get_varchar2(p_path => 'a_to_center')
                             ,a_mov_stamp		  => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                             ,a_item_id		      => apex_json.get_varchar2(p_path => 'a_item_id')
                             ,a_deal_unit		  => apex_json.get_varchar2(p_path => 'a_deal_unit')
                             ,a_deal_unit_qty	  => apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                             ,a_deal_cur		  => apex_json.get_varchar2(p_path => 'a_deal_cur')
                             ,a_to_activity	      => apex_json.get_varchar2(p_path => 'a_to_activity')
                             ,a_trans_date		  => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		  => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_status            => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id           => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_msg_id            => a_msg_id
                             ,a_status_code       => a_status_code
                             ,a_result            => a_result  
                            );                   
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_order_dtl_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_order_dtl_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
--===================================================================================
-- stk_sales_hdr 
--===================================================================================                             
 
    function validate_stk_sales_hdr(v_stk_sales_hdr_rec stk_sales_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_sales_hdr_prc ( a_storage_id				in			number
                                 ,a_center_code				in			varchar2
                                 ,a_doc_type				in			number
                                 ,a_client_type				in			number
                                 ,a_bene_id				    in			number
                                 ,a_bene_name				in			varchar2
                                 ,a_client_age				in			number
                                 ,a_age_class				in			number
                                 ,a_client_sex				in			number
                                 ,a_dr_no					in			number
                                 ,a_sale_type				in			number
                                 ,a_pay_type				in			number
                                 ,a_inss_comp				in			number
                                 ,a_inss_client				in			number
                                 ,a_inss_no					in			varchar2
                                 ,a_pat_perc				in			number
                                 ,a_insurance_code			in			varchar2
                                 ,a_notes					in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_id					    out			number
                                 ,a_msg_id                  out         varchar2
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_sales_hdr_rec            stk_sales_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
                
        
        -- Assign values     
        v_stk_sales_hdr_rec.storage_id			       :=  a_storage_id		                                                                                   ;
        v_stk_sales_hdr_rec.center_code			       :=  a_center_code		                                                                               ;
        v_stk_sales_hdr_rec.doc_type			       :=  a_doc_type		                                                                                   ;
        v_stk_sales_hdr_rec.client_type			       :=  a_client_type		                                                                               ;
        v_stk_sales_hdr_rec.bene_id				       :=  a_bene_id			                                                                               ;
        v_stk_sales_hdr_rec.bene_name			       :=  a_bene_name		                                                                                   ;
        v_stk_sales_hdr_rec.client_age			       :=  a_client_age		                                                                                   ;
        v_stk_sales_hdr_rec.age_class			       :=  a_age_class		                                                                                   ;
        v_stk_sales_hdr_rec.client_sex			       :=  a_client_sex		                                                                                   ;
        v_stk_sales_hdr_rec.dr_no				       :=  a_dr_no			                                                                                   ;
        v_stk_sales_hdr_rec.sale_type			       :=  a_sale_type		                                                                                   ;
        v_stk_sales_hdr_rec.pay_type			       :=  a_pay_type		                                                                                   ;
        v_stk_sales_hdr_rec.inss_comp			       :=  a_inss_comp		                                                                                   ;
        v_stk_sales_hdr_rec.inss_client			       :=  a_inss_client		                                                                               ;
        v_stk_sales_hdr_rec.inss_no				       :=  a_inss_no			                                                                               ;
        v_stk_sales_hdr_rec.pat_perc			       :=  a_pat_perc		                                                                                   ;
        v_stk_sales_hdr_rec.insurance_code		       :=  a_insurance_code	                                                                                   ;
        v_stk_sales_hdr_rec.notes				       :=  a_notes			                                                                                   ;
        v_stk_sales_hdr_rec.ins_date	               :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_sales_hdr_rec.status     	               :=  a_status	                                                                                           ;
        v_stk_sales_hdr_rec.data_source	               :=  a_data_source		                                                                               ;
        v_stk_sales_hdr_rec.created_by                 :=  a_user_id                                                                                           ;	
        
        
        -- Validate open balance hdr (data)
        if not MDL_STOCK.STOCK_PKG.VALIDATE_STK_SALES_HDR( a_stk_sales_hdr_rec   => v_stk_sales_hdr_rec
                                                          ,a_status_code         => a_status_code
                                                          ,a_result              => a_result
                                                          ,a_msg_id              => a_msg_id
                                                          ) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc (
                                                      a_msg_id              => a_msg_id
--                                                     ,a_01                   => 
                                                     ,a_msg_cur             => a_result
                                                     ,a_status_code         => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if; 

                -- Insert stk_sales_hdr record
            insert into stk_sales_hdr values v_stk_sales_hdr_rec 
            returning id into a_id
            ;
            
        --update stk_sales_dtl
        
        update stk_sales_dtl
        set    pat_perc     = a_pat_perc    
        where  sale_id      = a_id
        and    storage_id   = a_storage_id
        ;
            
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_sales_hdr_prc   ( a_id					    in			number 
                                    ,a_storage_id				in			number
                                    ,a_center_code				in			varchar2
                                    ,a_doc_type				    in			number
                                    ,a_client_type				in			number
                                    ,a_bene_id				    in			number
                                    ,a_bene_name				in			varchar2
                                    ,a_client_age				in			number
                                    ,a_age_class				in			number
                                    ,a_client_sex				in			number
                                    ,a_dr_no					in			number
                                    ,a_sale_type				in			number
                                    ,a_pay_type				    in			number
                                    ,a_inss_comp				in			number
                                    ,a_inss_client				in			number
                                    ,a_inss_no					in			varchar2
                                    ,a_pat_perc				    in			number
                                    ,a_insurance_code			in			varchar2
                                    ,a_notes					in			varchar2
                                    ,a_trans_date    		    in			varchar2
                                    ,a_data_source			    in			number
                                    ,a_user_id                  in          number
                                    ,a_status				    in			number
                                    ,a_msg_id                   out         varchar2
                                    ,a_status_code              out         number
                                    ,a_result                   out         ref_cur
                                    )
is 
    v_stk_sales_hdr_rec            stk_sales_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
--        if not validate_stk_sales_hdr(v_stk_sales_hdr_rec) then 
--            
--        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
--                                                     ,a_msg_cur     => a_result
--                                                     ,a_status_code => a_status_code);
--            return;
----            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
--        end if;         
        
        -- Assign values     
        v_stk_sales_hdr_rec.id			               :=  a_id		                                                                                           ;
        v_stk_sales_hdr_rec.storage_id			       :=  a_storage_id		                                                                                   ;
        v_stk_sales_hdr_rec.center_code			       :=  a_center_code		                                                                               ;
        v_stk_sales_hdr_rec.doc_type			       :=  a_doc_type		                                                                                   ;
        v_stk_sales_hdr_rec.client_type			       :=  a_client_type		                                                                               ;
        v_stk_sales_hdr_rec.bene_id				       :=  a_bene_id			                                                                               ;
        v_stk_sales_hdr_rec.bene_name			       :=  a_bene_name		                                                                                   ;
        v_stk_sales_hdr_rec.client_age			       :=  a_client_age		                                                                                   ;
        v_stk_sales_hdr_rec.age_class			       :=  a_age_class		                                                                                   ;
        v_stk_sales_hdr_rec.client_sex			       :=  a_client_sex		                                                                                   ;
        v_stk_sales_hdr_rec.dr_no				       :=  a_dr_no			                                                                                   ;
        v_stk_sales_hdr_rec.sale_type			       :=  a_sale_type		                                                                                   ;
        v_stk_sales_hdr_rec.pay_type			       :=  a_pay_type		                                                                                   ;
        v_stk_sales_hdr_rec.inss_comp			       :=  a_inss_comp		                                                                                   ;
        v_stk_sales_hdr_rec.inss_client			       :=  a_inss_client		                                                                               ;
        v_stk_sales_hdr_rec.inss_no				       :=  a_inss_no			                                                                               ;
        v_stk_sales_hdr_rec.pat_perc			       :=  a_pat_perc		                                                                                   ;
        v_stk_sales_hdr_rec.insurance_code		       :=  a_insurance_code	                                                                                   ;
        v_stk_sales_hdr_rec.notes				       :=  a_notes			                                                                                   ;
        v_stk_sales_hdr_rec.updated 	               :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_sales_hdr_rec.status     	               :=  a_status	                                                                                           ;
        v_stk_sales_hdr_rec.data_source	               :=  a_data_source		                                                                               ;
        v_stk_sales_hdr_rec.updated_by                 :=  a_user_id                                                                                           ;
        
        

        -- Validate Sales hdr (data)
        if not MDL_STOCK.STOCK_PKG.VALIDATE_STK_SALES_HDR( a_stk_sales_hdr_rec   => v_stk_sales_hdr_rec
                                                          ,a_status_code         => a_status_code
                                                          ,a_result              => a_result
                                                          ,a_msg_id              => a_msg_id
                                                          ) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id              => a_msg_id
--                                                     ,a_01                   => 
                                                     ,a_msg_cur             => a_result
                                                     ,a_status_code         => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if; 
        
        -- update stk_sales_hdr record
    update stk_sales_hdr 
    set   
         storage_id			=   v_stk_sales_hdr_rec.storage_id		     
      ,  center_code	    =   v_stk_sales_hdr_rec.center_code		               
      ,  doc_type			=   v_stk_sales_hdr_rec.doc_type		     
      ,  client_type		=   v_stk_sales_hdr_rec.client_type			 
      ,  bene_id			=   v_stk_sales_hdr_rec.bene_id			     
      ,  bene_name		    =   v_stk_sales_hdr_rec.bene_name		     
      ,  client_age			=   v_stk_sales_hdr_rec.client_age		     
      ,  age_class			=   v_stk_sales_hdr_rec.age_class			 
      ,  client_sex			=   v_stk_sales_hdr_rec.client_sex		     
      ,  dr_no				=   v_stk_sales_hdr_rec.dr_no			     
      ,  sale_type			=   v_stk_sales_hdr_rec.sale_type		     
      ,  pay_type			=   v_stk_sales_hdr_rec.pay_type			 
      ,  inss_comp			=   v_stk_sales_hdr_rec.inss_comp			 
      ,  inss_client		=   v_stk_sales_hdr_rec.inss_client			 
      ,  inss_no			=   v_stk_sales_hdr_rec.inss_no				 
      ,  pat_perc			=   v_stk_sales_hdr_rec.pat_perc			 
      ,  insurance_code		=   v_stk_sales_hdr_rec.insurance_code		 
      ,  notes			    =   v_stk_sales_hdr_rec.notes			  
      ,  updated	        =   v_stk_sales_hdr_rec.updated 	       
      ,  status     	    =   v_stk_sales_hdr_rec.status     	        
      ,  data_source	    =   v_stk_sales_hdr_rec.data_source	        
      ,  updated_by         =   v_stk_sales_hdr_rec.updated_by          
      

    where id         = a_id 
    and   storage_id = a_storage_id; 
    
     --update stk_sales_dtl
        
        update stk_sales_dtl
        set    pat_perc     = a_pat_perc    
        where  sale_id      = a_id
        and    storage_id   = a_storage_id
        ;
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
--                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
--                                                                 ,a_01          => sqlerrm
--                                                                 ,a_status_code => a_status_code
--                                                                 ,a_msg_cur     => a_result
--                                                                 );
RAISE_APPLICATION_ERROR (-20103,'Unknown error'||SQLERRM); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_sales_hdr_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_sales_hdr_rec            stk_sales_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_sales_hdr(v_stk_sales_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_sales_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_sales_hdr 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_stk_sales_hdr_ref   (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.C_VW_STK_SALES_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_sales_hdr_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_stk_sales_hdr_ref( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                 ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                 ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                 ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                 ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                 ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                                 ,a_status_code                      => a_status_code                                           
                                                                 ,a_result                           => a_result   
                                                                 );
  end; 
else
    begin
    add_stk_sales_hdr_prc  (  a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_center_code		 => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_doc_type	     => apex_json.get_varchar2(p_path => 'a_doc_type')
                             ,a_client_type		 => apex_json.get_varchar2(p_path => 'a_client_type')
                             ,a_bene_id			 => apex_json.get_varchar2(p_path => 'a_bene_id')
                             ,a_bene_name		 => apex_json.get_varchar2(p_path => 'a_bene_name')
                             ,a_client_age		 => apex_json.get_varchar2(p_path => 'a_client_age')
                             ,a_age_class		 => apex_json.get_varchar2(p_path => 'a_age_class')
                             ,a_client_sex		 => apex_json.get_varchar2(p_path => 'a_client_sex')
                             ,a_dr_no			 => apex_json.get_varchar2(p_path => 'a_dr_no')
                             ,a_sale_type		 => apex_json.get_varchar2(p_path => 'a_sale_type')
                             ,a_pay_type	     => apex_json.get_varchar2(p_path => 'a_pay_type')
                             ,a_inss_comp		 => apex_json.get_varchar2(p_path => 'a_inss_comp')
                             ,a_inss_client		 => apex_json.get_varchar2(p_path => 'a_inss_client')
                             ,a_inss_no			 => apex_json.get_varchar2(p_path => 'a_inss_no')
                             ,a_pat_perc		 => apex_json.get_varchar2(p_path => 'a_pat_perc')	
                             ,a_insurance_code	 => apex_json.get_varchar2(p_path => 'a_insurance_code')
                             ,a_notes			 => apex_json.get_varchar2(p_path => 'a_notes')
                             ,a_trans_date		 => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_status           => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id          => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_id				 => a_id     
                             ,a_msg_id           => a_msg_id                                                
                             ,a_status_code      => a_status_code
                             ,a_result           => a_result  
                             );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_sales_hdr_prc    ( a_body                           in          blob 
                                     ,a_msg_id                         in out      varchar2
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_sales_hdr_prc    (  a_id				 => apex_json.get_varchar2(p_path => 'a_id')  
                             ,a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_center_code		 => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_doc_type	     => apex_json.get_varchar2(p_path => 'a_doc_type')
                             ,a_client_type		 => apex_json.get_varchar2(p_path => 'a_client_type')
                             ,a_bene_id			 => apex_json.get_varchar2(p_path => 'a_bene_id')
                             ,a_bene_name		 => apex_json.get_varchar2(p_path => 'a_bene_name')
                             ,a_client_age		 => apex_json.get_varchar2(p_path => 'a_client_age')
                             ,a_age_class		 => apex_json.get_varchar2(p_path => 'a_age_class')
                             ,a_client_sex		 => apex_json.get_varchar2(p_path => 'a_client_sex')
                             ,a_dr_no			 => apex_json.get_varchar2(p_path => 'a_dr_no')
                             ,a_sale_type		 => apex_json.get_varchar2(p_path => 'a_sale_type')
                             ,a_pay_type	     => apex_json.get_varchar2(p_path => 'a_pay_type')
                             ,a_inss_comp		 => apex_json.get_varchar2(p_path => 'a_inss_comp')
                             ,a_inss_client		 => apex_json.get_varchar2(p_path => 'a_inss_client')
                             ,a_inss_no			 => apex_json.get_varchar2(p_path => 'a_inss_no')
                             ,a_pat_perc		 => apex_json.get_varchar2(p_path => 'a_pat_perc')	
                             ,a_insurance_code	 => apex_json.get_varchar2(p_path => 'a_insurance_code')
                             ,a_notes			 => apex_json.get_varchar2(p_path => 'a_notes')
                             ,a_trans_date		 => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')
                             ,a_status           => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_user_id          => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_msg_id           => a_msg_id
                             ,a_status_code      => a_status_code
                             ,a_result           => a_result  
                             );              
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_sales_hdr_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_sales_hdr_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
--===================================================================================
-- stk_sales_dtl 
--===================================================================================                             
 
    function validate_stk_sales_dtl(v_stk_sales_dtl_rec stk_sales_dtl%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_sales_dtl_prc ( a_storage_id				in			number
                                 ,a_sale_id					in			number
                                 ,a_center_code				in			varchar2
                                 ,a_to_center				in			varchar2
                                 ,a_item_id					in			number
                                 ,a_mov_stamp				in			varchar2
                                 ,a_deal_unit				in			number
                                 ,a_deal_unit_qty			in			number
                                 ,a_deal_cur				in			number
                                 ,a_exch_rate				in			number
                                 ,a_deal_price				in			number
                                 ,a_pat_perc				in			number
                                 ,a_is_vaitamin				in			number
                                 ,a_notes					in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_id					    out			number
                                 ,a_msg_id                  in out      varchar2
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_sales_dtl_rec            stk_sales_dtl%rowtype;
    v_stk_sales_dtl_val_rec        stk_sales_dtl%rowtype;
    v_cash_amount                  number;
    v_debt_amount                  number;
    v_t_amount                     number;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        
       
        -- Assign values     
        v_stk_sales_dtl_val_rec.storage_id		       :=  a_storage_id		                                                                                   ;
        v_stk_sales_dtl_val_rec.sale_id			       :=  a_sale_id			                                                                               ;
        v_stk_sales_dtl_val_rec.center_code		       :=  a_center_code		                                                                               ;
        v_stk_sales_dtl_val_rec.to_center		       :=  a_to_center		                                                                                   ;
        v_stk_sales_dtl_val_rec.item_id			       :=  a_item_id			                                                                               ;
        v_stk_sales_dtl_val_rec.mov_stamp		       :=  a_mov_stamp		                                                                                   ;
        v_stk_sales_dtl_val_rec.deal_unit		       :=  a_deal_unit		                                                                                   ;
        v_stk_sales_dtl_val_rec.deal_unit_qty	       :=  a_deal_unit_qty	                                                                                   ;
        v_stk_sales_dtl_val_rec.deal_cur		       :=  a_deal_cur		                                                                                   ;
        v_stk_sales_dtl_val_rec.exch_rate		       :=  a_exch_rate		                                                                                   ;
        v_stk_sales_dtl_val_rec.deal_price		       :=  a_deal_price		                                                                                   ;
        v_stk_sales_dtl_val_rec.pat_perc		       :=  a_pat_perc		                                                                                   ;
        v_stk_sales_dtl_val_rec.is_vaitamin		       :=  a_is_vaitamin		                                                                               ;
        v_stk_sales_dtl_val_rec.notes			       :=  a_notes			                                                                                   ;
        v_stk_sales_dtl_val_rec.ins_date	           :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_sales_dtl_val_rec.status     	           :=  a_status	                                                                                           ;
        v_stk_sales_dtl_val_rec.data_source	           :=  a_data_source		                                                                               ;
        v_stk_sales_dtl_val_rec.created_by             :=  a_user_id                                                                                           ;
            -- delete action if a_status=0 before validation
            if v_stk_sales_dtl_val_rec.status=0 then
                delete from stk_sales_dtl
                where storage_id = a_storage_id
                and   sale_id    = a_sale_id
                and   item_id    = a_item_id ;
                
            elsif v_stk_sales_dtl_val_rec.status=1 then
           
        -- Validate open balance hdr (data)
        if not MDL_STOCK.stock_pkg.validate_stk_sales_dtl(a_stk_sales_dtl_val_rec => v_stk_sales_dtl_val_rec
                                                         ,a_msg_id                => a_msg_id
                                                         ,a_status_code           => a_status_code
                                                         ,a_result                => a_result) then   
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => a_msg_id
                                                     ,a_01          => v_stk_sales_dtl_val_rec.item_id
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        end if;
        
        delete from stk_sales_dtl
        where storage_id = a_storage_id
        and   sale_id    = a_sale_id
        and   item_id    = a_item_id ;
        
        FOR i IN
                (
                SELECT *
                FROM   TABLE(MDL_STOCK.stock_trans_pck.GET_ITEM_STAMP_ROW(a_item_id,a_deal_unit,a_storage_id,a_deal_unit_qty,a_mov_stamp))
                WHERE T_REMAIN_QTY>=0
                ) 
        LOOP
        
        --
        if a_status =1 then
        -- Assign values  only for enabled ones   
        v_stk_sales_dtl_rec.storage_id		       :=  a_storage_id		                                                                                   ;
        v_stk_sales_dtl_rec.sale_id			       :=  a_sale_id			                                                                               ;
        v_stk_sales_dtl_rec.center_code		       :=  i.T_CENTER   		                                                                               ;
        v_stk_sales_dtl_rec.to_center		       :=  a_to_center		                                                                                   ;
        v_stk_sales_dtl_rec.item_id			       :=  a_item_id			                                                                               ;
        v_stk_sales_dtl_rec.mov_stamp		       :=  i.T_MOV_STAMP                                                                                       ;
        v_stk_sales_dtl_rec.deal_unit		       :=  a_deal_unit		                                                                                   ;
        v_stk_sales_dtl_rec.deal_unit_qty	       :=  i.T_DEAL_TAKEN_QTY                                                                                  ;
        v_stk_sales_dtl_rec.deal_cur		       :=  nvl(a_deal_cur,1)                                                                                   ;
        v_stk_sales_dtl_rec.exch_rate		       :=  nvl(a_exch_rate,1)                                                                                  ;
        v_stk_sales_dtl_rec.deal_price		       :=  a_deal_price		                                                                                   ;
        v_stk_sales_dtl_rec.pat_perc		       :=  nvl(a_pat_perc,100)                                                                                 ;
        v_stk_sales_dtl_rec.is_vaitamin		       :=  a_is_vaitamin		                                                                               ;
        v_stk_sales_dtl_rec.notes			       :=  a_notes			                                                                                   ;
        v_stk_sales_dtl_rec.ins_date	           :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_sales_dtl_rec.status     	           :=  a_status	                                                                                           ;
        v_stk_sales_dtl_rec.data_source	           :=  a_data_source		                                                                               ;
        v_stk_sales_dtl_rec.created_by             :=  a_user_id                                                                                           ;	

               --  Insert stk_sales_dtl record
            insert into stk_sales_dtl values v_stk_sales_dtl_rec 
            returning id into a_id
            ;
        end if;
        end loop;
        select sum(cash_amount),sum(debit_amount),sum(t_amount)
        into   v_cash_amount,v_debt_amount,v_t_amount
        from stk_sales_dtl
        where sale_id    = a_sale_id
        and   storage_id = a_storage_id;
        
        --update header
        
        update stk_sales_hdr 
        set    cash_amount  = v_cash_amount
              ,debit_amount = v_debt_amount
              ,t_amount     = v_t_amount
        where  id           = a_sale_id
        and    storage_id   = a_storage_id
        ;
        
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
--                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
--                                                                 ,a_01          => sqlerrm
--                                                                 ,a_status_code => a_status_code
--                                                                 ,a_msg_cur     => a_result
--                                                                 );
RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_sales_dtl_prc ( a_id					    in			number
                                  ,a_storage_id				in			number
                                  ,a_sale_id				in			number
                                  ,a_center_code			in			varchar2
                                  ,a_to_center				in			varchar2
                                  ,a_item_id				in			number
                                  ,a_mov_stamp				in			varchar2
                                  ,a_deal_unit				in			number
                                  ,a_deal_unit_qty			in			number
                                  ,a_deal_cur				in			number
                                  ,a_exch_rate				in			number
                                  ,a_deal_price				in			number
                                  ,a_pat_perc				in			number
                                  ,a_is_vaitamin			in			number
                                  ,a_notes					in			varchar2
                                  ,a_trans_date    		    in			varchar2
                                  ,a_data_source			in			number
                                  ,a_user_id                in          number
                                  ,a_status				    in			number
                                  ,a_status_code            out         number
                                  ,a_result                 out         ref_cur
                                  )
is 
    v_stk_sales_dtl_rec            stk_sales_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_sales_dtl(v_stk_sales_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_sales_dtl_rec.storage_id		       :=  a_storage_id		                                                                                   ;
        v_stk_sales_dtl_rec.sale_id			       :=  a_sale_id			                                                                               ;
        v_stk_sales_dtl_rec.center_code		       :=  a_center_code		                                                                               ;
        v_stk_sales_dtl_rec.to_center		       :=  a_to_center		                                                                                   ;
        v_stk_sales_dtl_rec.item_id			       :=  a_item_id			                                                                               ;
        v_stk_sales_dtl_rec.mov_stamp		       :=  a_mov_stamp		                                                                                   ;
        v_stk_sales_dtl_rec.deal_unit		       :=  a_deal_unit		                                                                                   ;
        v_stk_sales_dtl_rec.deal_unit_qty	       :=  a_deal_unit_qty	                                                                                   ;
        v_stk_sales_dtl_rec.deal_cur		       :=  a_deal_cur		                                                                                   ;
        v_stk_sales_dtl_rec.exch_rate		       :=  a_exch_rate		                                                                                   ;
        v_stk_sales_dtl_rec.deal_price		       :=  a_deal_price		                                                                                   ;
        v_stk_sales_dtl_rec.pat_perc		       :=  a_pat_perc		                                                                                   ;
        v_stk_sales_dtl_rec.is_vaitamin		       :=  a_is_vaitamin		                                                                               ;
        v_stk_sales_dtl_rec.notes			       :=  a_notes			                                                                                   ;
        v_stk_sales_dtl_rec.updated 	           :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source) ;
        v_stk_sales_dtl_rec.status     	           :=  a_status	                                                                                           ;
        v_stk_sales_dtl_rec.data_source	           :=  a_data_source		                                                                               ;
        v_stk_sales_dtl_rec.updated_by             :=  a_user_id                                                                                           ;
        
        -- update Open Balance Dtl record
    update stk_sales_dtl 
    set   
         storage_id		    =   v_stk_sales_dtl_rec.storage_id		  
      ,  sale_id			=   v_stk_sales_dtl_rec.sale_id			              
      ,  center_code		=   v_stk_sales_dtl_rec.center_code		  
      ,  to_center		    =   v_stk_sales_dtl_rec.to_center		  
      ,  item_id			=   v_stk_sales_dtl_rec.item_id			  
      ,  mov_stamp		    =   v_stk_sales_dtl_rec.mov_stamp		  
      ,  deal_unit		    =   v_stk_sales_dtl_rec.deal_unit		  
      ,  deal_unit_qty	    =   v_stk_sales_dtl_rec.deal_unit_qty	  
      ,  deal_cur		    =   v_stk_sales_dtl_rec.deal_cur		  
      ,  exch_rate		    =   v_stk_sales_dtl_rec.exch_rate		  
      ,  deal_price		    =   v_stk_sales_dtl_rec.deal_price		  
      ,  pat_perc		    =   v_stk_sales_dtl_rec.pat_perc		  
      ,  is_vaitamin		=   v_stk_sales_dtl_rec.is_vaitamin		  
      ,  notes			    =   v_stk_sales_dtl_rec.notes			  
      ,  updated	        =   v_stk_sales_dtl_rec.updated 	      
      ,  status     	    =   v_stk_sales_dtl_rec.status     	      
      ,  data_source	    =   v_stk_sales_dtl_rec.data_source	      
      ,  updated_by         =   v_stk_sales_dtl_rec.updated_by        
      

    where id         = a_id 
    and   storage_id =a_storage_id; 
    
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_sales_dtl_prc    (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_sales_dtl_rec            stk_sales_dtl%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_sales_dtl(v_stk_sales_dtl_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_sales_dtl_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_sales_dtl 
            set status     = 0
               ,data_source= a_data_source
               ,updated    = a_trans_date
               ,updated_by = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_stk_sales_dtl_ref   (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.C_VW_STK_SALES_DTL
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_sales_dtl_prc    ( a_body                           in          blob 
                                ,a_json                           in out      ref_cur                                    
                                ,a_id                             in out      number
                                ,a_msg_id                         in out      varchar2
                                ,a_status_code                    in out      number
                                ,a_result                         in out      ref_cur
                               )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_stk_sales_dtl_ref( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                 ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                 ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                 ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                 ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                 ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                                 ,a_status_code                      => a_status_code                                           
                                                                 ,a_result                           => a_result   
                                                                 );
  end; 
else
    begin
    add_stk_sales_dtl_prc  (  a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_sale_id			 => apex_json.get_varchar2(p_path => 'a_sale_id')
                             ,a_center_code		 => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_to_center		 => apex_json.get_varchar2(p_path => 'a_to_center')
                             ,a_item_id			 => apex_json.get_varchar2(p_path => 'a_item_id')
                             ,a_mov_stamp		 => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                             ,a_deal_unit		 => apex_json.get_varchar2(p_path => 'a_deal_unit')
                             ,a_deal_unit_qty	 => apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                             ,a_deal_cur		 => apex_json.get_varchar2(p_path => 'a_deal_cur')
                             ,a_exch_rate		 => apex_json.get_varchar2(p_path => 'a_exch_rate')
                             ,a_deal_price		 => apex_json.get_varchar2(p_path => 'a_deal_price')
                             ,a_pat_perc		 => apex_json.get_varchar2(p_path => 'a_pat_perc')
                             ,a_is_vaitamin		 => apex_json.get_varchar2(p_path => 'a_is_vaitamin')
                             ,a_notes			 => apex_json.get_varchar2(p_path => 'a_notes')
                             ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                             ,a_user_id          => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_id				 => a_id
                             ,a_msg_id           => a_msg_id         
                             ,a_status_code      => a_status_code
                             ,a_result           => a_result  
                             );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_sales_dtl_prc    ( a_body                           in          blob 
                                     ,a_status_code                    in out      number
                                     ,a_result                         in out      ref_cur
                                     ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_sales_dtl_prc    (  a_id				 => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_sale_id			 => apex_json.get_varchar2(p_path => 'a_sale_id')
                             ,a_center_code		 => apex_json.get_varchar2(p_path => 'a_center_code')
                             ,a_to_center		 => apex_json.get_varchar2(p_path => 'a_to_center')
                             ,a_item_id			 => apex_json.get_varchar2(p_path => 'a_item_id')
                             ,a_mov_stamp		 => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                             ,a_deal_unit		 => apex_json.get_varchar2(p_path => 'a_deal_unit')
                             ,a_deal_unit_qty	 => apex_json.get_varchar2(p_path => 'a_deal_unit_qty')
                             ,a_deal_cur		 => apex_json.get_varchar2(p_path => 'a_deal_cur')
                             ,a_exch_rate		 => apex_json.get_varchar2(p_path => 'a_exch_rate')
                             ,a_deal_price		 => apex_json.get_varchar2(p_path => 'a_deal_price')
                             ,a_pat_perc		 => apex_json.get_varchar2(p_path => 'a_pat_perc')
                             ,a_is_vaitamin		 => apex_json.get_varchar2(p_path => 'a_is_vaitamin')
                             ,a_notes			 => apex_json.get_varchar2(p_path => 'a_notes')
                             ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                             ,a_user_id          => OWA_UTIL.get_cgi_env  ('a_user_id')
                             ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                             ,a_status_code      => a_status_code
                             ,a_result           => a_result  
                             );             
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_sales_dtl_prc    ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_sales_dtl_prc    ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
--===================================================================================
-- stk_inv_hdr 
--===================================================================================                             
 
    function validate_stk_inv_hdr(v_stk_inv_hdr_rec stk_inv_hdr%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_inv_hdr_prc ( a_storage_id		    in			number
                               ,a_doc_type				in			number
                               ,a_doc_date				in			varchar2
                               ,a_inv_type				in			number
                               ,a_storage_type			in			number
                               ,a_inv_desc				in			varchar2
                               ,a_trans_date    		in			varchar2
                               ,a_data_source			in			number
                               ,a_user_id               in          number
                               ,a_status				in			number
                               ,a_id					out			number
                               ,a_status_code           out         number
                               ,a_result                out         ref_cur
                               )
is 
    v_stk_inv_hdr_rec            stk_inv_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_inv_hdr(v_stk_inv_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_inv_hdr_rec.storage_id		  :=  a_storage_id	                                                                                       ;
        v_stk_inv_hdr_rec.doc_type		      :=  a_doc_type		                                                                                   ;
        v_stk_inv_hdr_rec.doc_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)    ;
        v_stk_inv_hdr_rec.inv_type	          :=  a_inv_type	                                                                                       ;
        v_stk_inv_hdr_rec.storage_type	      :=  a_storage_type	                                                                                   ;
        v_stk_inv_hdr_rec.inv_desc	          :=  a_inv_desc	                                                                                       ;
        v_stk_inv_hdr_rec.ins_date	          :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_inv_hdr_rec.status     	      :=  a_status	                                                                                           ;
        v_stk_inv_hdr_rec.data_source	      :=  a_data_source		                                                                                   ;
        v_stk_inv_hdr_rec.created_by          :=  a_user_id                                                                                            ;	

                -- Insert stk_inv_hdr record
            insert into stk_inv_hdr values v_stk_inv_hdr_rec 
            returning id into a_id
            ;
          
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_inv_hdr_prc (  a_id					    in			number
                                 ,a_storage_id				in			number
                                 ,a_doc_type				in			number
                                 ,a_doc_date				in			varchar2
                                 ,a_inv_type				in			number
                                 ,a_storage_type			in			number
                                 ,a_inv_desc				in			varchar2
                                 ,a_trans_date    		    in			varchar2
                                 ,a_data_source			    in			number
                                 ,a_user_id                 in          number
                                 ,a_status				    in			number
                                 ,a_status_code             out         number
                                 ,a_result                  out         ref_cur
                                 )
is 
    v_stk_inv_hdr_rec            stk_inv_hdr%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_inv_hdr(v_stk_inv_hdr_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_inv_hdr_rec.storage_id		  :=  a_storage_id	                                                                                       ;
        v_stk_inv_hdr_rec.doc_type		      :=  a_doc_type		                                                                                   ;
        v_stk_inv_hdr_rec.doc_date		      :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_doc_date,a_data_source => a_data_source)    ;
        v_stk_inv_hdr_rec.inv_type	          :=  a_inv_type	                                                                                       ;
        v_stk_inv_hdr_rec.storage_type	      :=  a_storage_type	                                                                                   ;
        v_stk_inv_hdr_rec.inv_desc	          :=  a_inv_desc	                                                                                       ;
        v_stk_inv_hdr_rec.updated	          :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source)  ;
        v_stk_inv_hdr_rec.status     	      :=  a_status	                                                                                           ;
        v_stk_inv_hdr_rec.data_source	      :=  a_data_source		                                                                                   ;
        v_stk_inv_hdr_rec.updated_by          :=  a_user_id                                                                                            ;
        
        -- update Open Balance Dtl record
    update stk_inv_hdr 
    set   
         storage_id	     =   v_stk_inv_hdr_rec.storage_id	      
      ,  doc_type		 =   v_stk_inv_hdr_rec.doc_type			         
      ,  doc_date		 =   v_stk_inv_hdr_rec.doc_date			  
      ,  inv_type	     =   v_stk_inv_hdr_rec.inv_type	    	  
      ,  storage_type	 =   v_stk_inv_hdr_rec.storage_type		  
      ,  inv_desc	     =   v_stk_inv_hdr_rec.inv_desc	    	  
      ,  updated	     =   v_stk_inv_hdr_rec.updated	    	  
      ,  status     	 =   v_stk_inv_hdr_rec.status     		  
      ,  data_source	 =   v_stk_inv_hdr_rec.data_source	      
      ,  updated_by      =   v_stk_inv_hdr_rec.updated_by     	  
      

    where id         = a_id 
    and   storage_id =a_storage_id; 
    
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_inv_hdr_prc      (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_inv_hdr_rec            stk_inv_hdr%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_inv_hdr(v_stk_inv_hdr_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_inv_hdr_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_inv_hdr 
            set status      = 0
               ,data_source = a_data_source
               ,updated     = a_trans_date
               ,updated_by  = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_stk_inv_hdr_ref     (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.C_VW_STK_INV_HDR
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_inv_hdr_prc    ( a_body                           in          blob 
                              ,a_json                           in out      ref_cur                                    
                              ,a_id                             in out      number
                              ,a_status_code                    in out      number
                              ,a_result                         in out      ref_cur
                             )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_stk_sales_dtl_ref( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                 ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                 ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                 ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                 ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                 ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                                 ,a_status_code                      => a_status_code                                           
                                                                 ,a_result                           => a_result   
                                                                 );
  end; 
else
    begin
    add_stk_inv_hdr_prc  (  a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_doc_type			 => apex_json.get_varchar2(p_path => 'a_doc_type')
                           ,a_doc_date			 => apex_json.get_varchar2(p_path => 'a_doc_date')
                           ,a_inv_type		     => apex_json.get_varchar2(p_path => 'a_inv_type')
                           ,a_storage_type		 => apex_json.get_varchar2(p_path => 'a_storage_type')
                           ,a_inv_desc		     => apex_json.get_varchar2(p_path => 'a_inv_desc')
                           ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                           ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')
                           ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                           ,a_id				 => a_id         
                           ,a_status_code        => a_status_code
                           ,a_result             => a_result  
                         );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_inv_hdr_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_inv_hdr_prc    (  a_id				 => apex_json.get_varchar2(p_path => 'a_id') 
                           ,a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_doc_type			 => apex_json.get_varchar2(p_path => 'a_doc_type')
                           ,a_doc_date			 => apex_json.get_varchar2(p_path => 'a_doc_date')
                           ,a_inv_type		     => apex_json.get_varchar2(p_path => 'a_inv_type')
                           ,a_storage_type		 => apex_json.get_varchar2(p_path => 'a_storage_type')
                           ,a_inv_desc		     => apex_json.get_varchar2(p_path => 'a_inv_desc')
                           ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                           ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')
                           ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                           ,a_status_code        => a_status_code
                           ,a_result             => a_result  
                         );          
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_inv_hdr_prc      ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_inv_hdr_prc      ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
--===================================================================================
-- stk_inv_dtl 
--===================================================================================                             
 
    function validate_stk_inv_dtl(v_stk_inv_dtl_rec stk_inv_dtl%rowtype) return boolean 
    is
    begin 
        return true;
    end;
--------------------------------------------------------------------------------    
procedure add_stk_inv_dtl_prc (a_storage_id				in			number
                              ,a_inv_id					in			number
                              ,a_storage_type			in			number
                              ,a_item_id				in			number
                              ,a_mov_stamp				in			varchar2
                              ,a_def_unit				in			number
                              ,a_qty					in			number
                              ,a_physical_qty			in			number
                              ,a_def_unit_cost			in			number
                              ,a_total_cost				in			number
                              ,a_item_pos				in			number
                              ,a_notes					in			varchar2
                              ,a_trans_date    		    in			varchar2
                              ,a_data_source			in			number
                              ,a_user_id                in          number
                              ,a_status				    in			number
                              ,a_id					    out			number
                              ,a_status_code            out         number
                              ,a_result                 out         ref_cur
                              )
is 
    v_stk_inv_dtl_rec            stk_inv_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_inv_dtl(v_stk_inv_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_inv_dtl_rec.storage_id		  :=  a_storage_id		                                                                                 ;
        v_stk_inv_dtl_rec.inv_id			  :=  a_inv_id			                                                                                 ;
        v_stk_inv_dtl_rec.storage_type	      :=  a_storage_type	                                                                                 ;
        v_stk_inv_dtl_rec.item_id		      :=  a_item_id		                                                                                     ;
        v_stk_inv_dtl_rec.mov_stamp		      :=  a_mov_stamp		                                                                                 ;
        v_stk_inv_dtl_rec.def_unit		      :=  a_def_unit		                                                                                 ;
        v_stk_inv_dtl_rec.qty			      :=  a_qty			                                                                                     ;
        v_stk_inv_dtl_rec.physical_qty	      :=  a_physical_qty	                                                                                 ;
        v_stk_inv_dtl_rec.def_unit_cost	      :=  a_def_unit_cost	                                                                                 ;
        v_stk_inv_dtl_rec.total_cost		  :=  a_total_cost		                                                                                 ;
        v_stk_inv_dtl_rec.item_pos		      :=  a_item_pos		                                                                                 ;
        v_stk_inv_dtl_rec.notes			      :=  a_notes			                                                                                 ;
        v_stk_inv_dtl_rec.ins_date	          :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source);
        v_stk_inv_dtl_rec.status     	      :=  a_status	                                                                                         ;
        v_stk_inv_dtl_rec.data_source	      :=  a_data_source		                                                                                 ;
        v_stk_inv_dtl_rec.created_by          :=  a_user_id                                                                                          ;	

                -- Insert stk_inv_dtl record
            insert into stk_inv_dtl values v_stk_inv_dtl_rec 
            returning id into a_id
            ;
          
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20000
                                                                 ,a_01          => a_id
                                                                 ,a_msg_cur     => a_result
                                                                 ,a_status_code => a_status_code
                                                                 );    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-20011,'Unknown error'||sqlerrm); 
--raise;
    end;
--------------------------------------------------------------------------------
procedure edit_stk_inv_dtl_prc (a_id					in			number
                               ,a_storage_id			in		    number
                               ,a_inv_id				in		    number
                               ,a_storage_type			in			number
                               ,a_item_id				in			number
                               ,a_mov_stamp				in			varchar2
                               ,a_def_unit				in			number
                               ,a_qty					in			number
                               ,a_physical_qty			in			number
                               ,a_def_unit_cost			in			number
                               ,a_total_cost			in			number
                               ,a_item_pos				in			number
                               ,a_notes					in			varchar2
                               ,a_trans_date    		in			varchar2
                               ,a_data_source			in			number
                               ,a_user_id               in          number
                               ,a_status				in			number
                               ,a_status_code           out         number
                               ,a_result                out         ref_cur
                               )
is 
    v_stk_inv_dtl_rec            stk_inv_dtl%rowtype;
    begin 
        -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result
                                                     );
            return;
--            RAISE_APPLICATION_ERROR (-200101,'User has no privliges');        
        end if; 
        -- Validate open balance hdr (data)
        if not validate_stk_inv_dtl(v_stk_inv_dtl_rec) then 
            
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_msg_cur     => a_result
                                                     ,a_status_code => a_status_code);
            return;
--            RAISE_APPLICATION_ERROR (-200102,'Validation error'); 
        end if;         
        
        -- Assign values     
        v_stk_inv_dtl_rec.storage_id		  :=  a_storage_id		                                                                                 ;
        v_stk_inv_dtl_rec.inv_id			  :=  a_inv_id			                                                                                 ;
        v_stk_inv_dtl_rec.storage_type	      :=  a_storage_type	                                                                                 ;
        v_stk_inv_dtl_rec.item_id		      :=  a_item_id		                                                                                     ;
        v_stk_inv_dtl_rec.mov_stamp		      :=  a_mov_stamp		                                                                                 ;
        v_stk_inv_dtl_rec.def_unit		      :=  a_def_unit		                                                                                 ;
        v_stk_inv_dtl_rec.qty			      :=  a_qty			                                                                                     ;
        v_stk_inv_dtl_rec.physical_qty	      :=  a_physical_qty	                                                                                 ;
        v_stk_inv_dtl_rec.def_unit_cost	      :=  a_def_unit_cost	                                                                                 ;
        v_stk_inv_dtl_rec.total_cost		  :=  a_total_cost		                                                                                 ;
        v_stk_inv_dtl_rec.item_pos		      :=  a_item_pos		                                                                                 ;
        v_stk_inv_dtl_rec.notes			      :=  a_notes			                                                                                 ;
        v_stk_inv_dtl_rec.updated	          :=  mdl_security.MSEC_format_PKG.get_date_format(a_date => a_trans_date,a_data_source => a_data_source);
        v_stk_inv_dtl_rec.status     	      :=  a_status	                                                                                         ;
        v_stk_inv_dtl_rec.data_source	      :=  a_data_source		                                                                                 ;
        v_stk_inv_dtl_rec.updated_by          :=  a_user_id                                                                                          ;	
        
        -- update Open Balance Dtl record
    update stk_inv_dtl 
    set   
         storage_id		    =   v_stk_inv_dtl_rec.storage_id		  
      ,  inv_id			    =   v_stk_inv_dtl_rec.inv_id			            
      ,  storage_type	    =   v_stk_inv_dtl_rec.storage_type		  
      ,  item_id		    =   v_stk_inv_dtl_rec.item_id			  
      ,  mov_stamp		    =   v_stk_inv_dtl_rec.mov_stamp			  
      ,  def_unit		    =   v_stk_inv_dtl_rec.def_unit			  
      ,  qty			    =   v_stk_inv_dtl_rec.qty				  
      ,  physical_qty	    =   v_stk_inv_dtl_rec.physical_qty		  
      ,  def_unit_cost	    =   v_stk_inv_dtl_rec.def_unit_cost	      
      ,  total_cost		    =   v_stk_inv_dtl_rec.total_cost		  
      ,  item_pos		    =   v_stk_inv_dtl_rec.item_pos			  
      ,  notes			    =   v_stk_inv_dtl_rec.notes				  
      ,  updated            =   v_stk_inv_dtl_rec.updated	    	        
      ,  status     	    =   v_stk_inv_dtl_rec.status     		  
      ,  data_source	    =   v_stk_inv_dtl_rec.data_source	      
      ,  updated_by         =   v_stk_inv_dtl_rec.updated_by     	  
      
      

    where id         = a_id 
    and   storage_id = a_storage_id; 
    
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20001
                                                                 ,a_01          => sql%ROWCOUNT
                                                                 ,a_02          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);    
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20100
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result
                                                                 );
--RAISE_APPLICATION_ERROR (-200103,'Unknown error'); 
    end;
-------------------------------------------------------------------------------- 
procedure delete_stk_inv_dtl_prc      (a_id                   in     number
                                      ,a_storage_id           in     number
                                      ,a_user_id              in     number
                                      ,a_trans_date           in     varchar2 default to_char(sysdate)
                                      ,a_data_source          in     number
                                      ,a_result               out    ref_cur
                                      ,a_status_code          out    number
                                      )
is 
   v_stk_inv_dtl_rec            stk_inv_dtl%rowtype;
    begin 
            -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return;        
        end if; 
            -- Validate Services 
           if not validate_stk_inv_dtl(v_stk_inv_dtl_rec) then 
                mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 99999
                                                             ,a_01          => v_stk_inv_dtl_rec.id
                                                             ,a_status_code => a_status_code
                                                             ,a_msg_cur     => a_result);     
                return;
            end if;         
        
          
        -- delete Services record
            update stk_inv_dtl 
            set status       = 0
               ,data_source  = a_data_source
               ,updated      = a_trans_date
               ,updated_by   = a_user_id
            where id         = a_id 
            and   storage_id = a_storage_id; 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20002
                                                                 ,a_01          => a_id
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);            
        exception 
                when others 
                    then 
                    mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 20102
                                                                 ,a_01          => sqlerrm
                                                                 ,a_status_code => a_status_code
                                                                 ,a_msg_cur     => a_result);   

    end; 
--------------------------------------------------------------------------------
function fn_collect_stk_inv_dtl_ref     (a_data_column_json           varchar2 
                                        ,a_where                      varchar2  default null 
                                        ,a_lookup_json                varchar2  default null
                                        ,a_Page_no                    number    default 1 
                                        ,a_Pagination_Size            number    default MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size
                                        ,a_user_id                    number
                                        ,a_status_code          out   number
                                        ,a_result               out   ref_cur)  return sys_refcursor
    is 
    v_ref_cur ref_cur;
    v_json_doc  clob;
    begin 
    -- Set user id
        if not mdl_security.msec_users_pkg.SET_user_id(a_user_id => a_user_id )
        then 
        mdl_security.MSEC_RESULT_PKG.get_result_prc ( a_msg_id      => 19998
                                                     ,a_status_code => a_status_code
                                                     ,a_msg_cur     => a_result);
            return null;        
        end if; 
    
    
    
v_json_doc := 
    MDL_BASIC_DATA.MBD_API_PKG.fn_global_collection_data(
                                    a_schema_name           => MDL_STOCK.STOCK_CONST_PKG.C_SCHEMA_NAME
                                   ,a_table_name            => MDL_STOCK.STOCK_CONST_PKG.C_VW_STK_INV_DTL
                                   ,a_data_column_json      => a_data_column_json
                                   ,a_where                 => a_where           
                                   ,a_lookup_json           => a_lookup_json     
                                   ,a_Page_no               => a_Page_no         
                                   ,a_Pagination_Size       => a_Pagination_Size 
                                   ,a_user_id               => a_user_id
                                   ,a_status_code           => a_status_code
                                   ,a_result                => a_result             
            );
    open v_ref_cur for 
             select v_json_doc json_doc -- The alias must be json_doc 
             from dual;
     
        return v_ref_cur;
        end; 
--------------------------------------------------------------------------------
-- POST & GET
procedure stk_inv_dtl_prc    ( a_body                           in          blob 
                              ,a_json                           in out      ref_cur                                    
                              ,a_id                             in out      number
                              ,a_status_code                    in out      number
                              ,a_result                         in out      ref_cur
                             )
    is    
    v_body      clob := to_clob (a_body);
    v_post_type varchar2(100);
    begin 
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON    
    apex_json.parse( v_body );
    v_post_type := apex_json.get_varchar2(p_path => 'a_post_type');

if v_post_type  = lower('get') then  
 
 begin
 a_json :=  MDL_STOCK.STOCK_API_PKG.fn_collect_stk_inv_dtl_ref  ( a_data_column_json                 => apex_json.get_varchar2    (p_path => 'a_data_column_json')   
                                                                 ,a_where                            => apex_json.get_varchar2    (p_path => 'a_where')              
                                                                 ,a_lookup_json                      => apex_json.get_varchar2    (p_path => 'a_lookup_json')        
                                                                 ,a_Page_no                          => nvl(apex_json.get_varchar2(p_path => 'a_page_no'),1)     
                                                                 ,a_Pagination_Size                  => nvl(apex_json.get_varchar2(p_path => 'a_pagination_size'),MDL_BASIC_DATA.MBD_CONST_PKG.c_Pagination_Size)      
                                                                 ,a_user_id                          => OWA_UTIL.get_cgi_env      ('a_user_id')                     
                                                                 ,a_status_code                      => a_status_code                                           
                                                                 ,a_result                           => a_result   
                                                                 );
  end; 
else
    begin
    add_stk_inv_dtl_prc  (  a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_inv_id			 => apex_json.get_varchar2(p_path => 'a_inv_id')
                           ,a_storage_type	     => apex_json.get_varchar2(p_path => 'a_storage_type')
                           ,a_item_id		     => apex_json.get_varchar2(p_path => 'a_item_id')
                           ,a_mov_stamp		     => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                           ,a_def_unit		     => apex_json.get_varchar2(p_path => 'a_def_unit')
                           ,a_qty			     => apex_json.get_varchar2(p_path => 'a_qty')
                           ,a_physical_qty	     => apex_json.get_varchar2(p_path => 'a_physical_qty')
                           ,a_def_unit_cost	     => apex_json.get_varchar2(p_path => 'a_def_unit_cost')
                           ,a_total_cost	     => apex_json.get_varchar2(p_path => 'a_total_cost')	
                           ,a_item_pos		     => apex_json.get_varchar2(p_path => 'a_item_pos')
                           ,a_notes			     => apex_json.get_varchar2(p_path => 'a_notes')
                           ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                           ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')
                           ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                           ,a_id				 => a_id         
                           ,a_status_code        => a_status_code
                           ,a_result             => a_result  
                         );
    end;
end if;    
    end;   
--------------------------------------------------------------------------------
-- PUT
procedure edit_stk_inv_dtl_prc    ( a_body                           in          blob 
                                   ,a_status_code                    in out      number
                                   ,a_result                         in out      ref_cur
                                  ) is
v_body            clob:=to_clob(a_body); 
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);
 edit_stk_inv_dtl_prc    (  a_id				 => apex_json.get_varchar2(p_path => 'a_id')     
                           ,a_storage_id		 => apex_json.get_varchar2(p_path => 'a_storage_id')
                           ,a_inv_id			 => apex_json.get_varchar2(p_path => 'a_inv_id')
                           ,a_storage_type	     => apex_json.get_varchar2(p_path => 'a_storage_type')
                           ,a_item_id		     => apex_json.get_varchar2(p_path => 'a_item_id')
                           ,a_mov_stamp		     => apex_json.get_varchar2(p_path => 'a_mov_stamp')
                           ,a_def_unit		     => apex_json.get_varchar2(p_path => 'a_def_unit')
                           ,a_qty			     => apex_json.get_varchar2(p_path => 'a_qty')
                           ,a_physical_qty	     => apex_json.get_varchar2(p_path => 'a_physical_qty')
                           ,a_def_unit_cost	     => apex_json.get_varchar2(p_path => 'a_def_unit_cost')
                           ,a_total_cost	     => apex_json.get_varchar2(p_path => 'a_total_cost')	
                           ,a_item_pos		     => apex_json.get_varchar2(p_path => 'a_item_pos')
                           ,a_notes			     => apex_json.get_varchar2(p_path => 'a_notes')
                           ,a_trans_date    	 => apex_json.get_varchar2(p_path => 'a_trans_date')
                           ,a_data_source		 => OWA_UTIL.get_cgi_env  ('a_data_source')	
                           ,a_user_id            => OWA_UTIL.get_cgi_env  ('a_user_id')
                           ,a_status			 => apex_json.get_varchar2(p_path => 'a_status')
                           ,a_status_code        => a_status_code
                           ,a_result             => a_result  
                         );         
end;   
--------------------------------------------------------------------------------
-- DELETE
procedure delete_stk_inv_dtl_prc      ( a_body                           in          blob 
                                       ,a_status_code                    in out      number
                                       ,a_result                         in out      ref_cur
                                       ) is
v_body  clob:=to_clob(a_body);                            
begin
    -- Set Body 
    MDL_SECURITY.MSEC_API_PKG.set_body(a_body=>v_body);   
    -- Parse JSON  
apex_json.parse(v_body);                           
delete_stk_inv_dtl_prc      ( a_id                   => apex_json.get_varchar2(p_path => 'a_id')
                             ,a_storage_id	         => apex_json.get_varchar2(p_path => 'a_storage_id')
                             ,a_user_id              => OWA_UTIL.get_cgi_env('a_user_id')
                             ,a_trans_date           => apex_json.get_varchar2(p_path => 'a_trans_date')
                             ,a_data_source          => OWA_UTIL.get_cgi_env('a_data_source')
                             ,a_result               => a_result
                             ,a_status_code          => a_status_code
                             )   ;
end; 
end;
/

