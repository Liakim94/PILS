package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class AgreementVO extends DefaultVO{

    private String id="";
    private String name ="";
    private String prmy_mat="";
    private String prmy_mat_std="";
    private String std_point="";
    private String change_point="";
    private String rqrm_ust="";
    private String rqrm_cycl ="";
    private String rqrm_date="";
    private String  reflect_point="";
    private String formula="";
    private String ratio="";
    private String etc="";
    private String type_cd="";
    private String ex_nm="";
    private String regist_dt="";
    private Integer seq;

}
