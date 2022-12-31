package kr.co.xicom.front.model;

public class CmpSttusVO {
    private String bizNo ="";
    private String base_year ="";
    private String index_dv ="";
    private String index_val ="";
    private String rgdate="";
    private String update ="";

    public String getBizNo() {
        return bizNo;
    }

    public void setBizNo(String bizNo) {
        this.bizNo = bizNo;
    }

    public String getBase_year() {
        return base_year;
    }

    public void setBase_year(String base_year) {
        this.base_year = base_year;
    }

    public String getIndex_dv() {
        return index_dv;
    }

    public void setIndex_dv(String index_dv) {
        this.index_dv = index_dv;
    }

    public String getIndex_val() {
        return index_val;
    }

    public void setIndex_val(String index_val) {
        this.index_val = index_val;
    }

    public String getRgdate() {
        return rgdate;
    }

    public void setRgdate(String rgdate) {
        this.rgdate = rgdate;
    }

    public String getUpdate() {
        return update;
    }

    public void setUpdate(String update) {
        this.update = update;
    }
}
