package cn.anline.zone.serve.console.v1.bean;


import java.io.Serializable;

/**
 * Bean基类
 */
public class V1BaseBean implements Serializable {

    protected int status;

    protected int result;

    protected String msg;

    protected Object data;

    public V1BaseBean() {
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
