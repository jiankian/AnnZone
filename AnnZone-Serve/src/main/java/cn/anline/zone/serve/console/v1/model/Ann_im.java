package cn.anline.zone.serve.console.v1.model;

public class Ann_im {
  private Long id;
  private Long uid;
  private Long r_uid;
  private String uid_nickname;
  private String rid_nickname;
  private Long status;
  private String content;
  private Long type;
  private Long file;
  private Long create_time;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getUid() {
    return uid;
  }

  public void setUid(Long uid) {
    this.uid = uid;
  }

  public Long getR_uid() {
    return r_uid;
  }

  public void setR_uid(Long r_uid) {
    this.r_uid = r_uid;
  }

  public String getUid_nickname() {
    return uid_nickname;
  }

  public void setUid_nickname(String uid_nickname) {
    this.uid_nickname = uid_nickname;
  }

  public String getRid_nickname() {
    return rid_nickname;
  }

  public void setRid_nickname(String rid_nickname) {
    this.rid_nickname = rid_nickname;
  }

  public Long getStatus() {
    return status;
  }

  public void setStatus(Long status) {
    this.status = status;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Long getType() {
    return type;
  }

  public void setType(Long type) {
    this.type = type;
  }

  public Long getFile() {
    return file;
  }

  public void setFile(Long file) {
    this.file = file;
  }

  public Long getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Long create_time) {
    this.create_time = create_time;
  }
}
