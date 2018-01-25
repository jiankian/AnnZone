package cn.anline.zone.serve.console.v1.bean;


import javax.persistence.MappedSuperclass;

/**
 * Bean基类
 */
public class V1BaseBean {

    protected int status;

    protected int result;

    protected String msg;

    protected Object data;

    public V1BaseBean() {
        this.status = -1;
        this.result = 0;
        this.msg = "空白的接口请求结果！";
        this.data = new Object();
    }

    public V1BaseBean(int status, int result, String msg, Object data) {
        this.status = status;
        this.result = result;
        this.msg = msg;
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
