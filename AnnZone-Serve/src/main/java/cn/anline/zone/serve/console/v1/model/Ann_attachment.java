package cn.anline.zone.serve.console.v1.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ann_attachment {
  @Id
  private Long id;
  private Long uid;
  private String name;
  private String module;
  private String path;
  private String thumb;
  private String ss_key;
  private String url;
  private String mime;
  private String ext;
  private Long size;
  private String md5;
  private String sha1;
  private String crc32;
  private String driver;
  private Long download;
  private Long origin;
  private String ua;
  private String ip;
  private String version;
  private String http_info;
  private Long sort;
  private Long status;
  private Long create_time;
  private Long update_time;

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

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getModule() {
    return module;
  }

  public void setModule(String module) {
    this.module = module;
  }

  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  public String getThumb() {
    return thumb;
  }

  public void setThumb(String thumb) {
    this.thumb = thumb;
  }

  public String getSs_key() {
    return ss_key;
  }

  public void setSs_key(String ss_key) {
    this.ss_key = ss_key;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getMime() {
    return mime;
  }

  public void setMime(String mime) {
    this.mime = mime;
  }

  public String getExt() {
    return ext;
  }

  public void setExt(String ext) {
    this.ext = ext;
  }

  public Long getSize() {
    return size;
  }

  public void setSize(Long size) {
    this.size = size;
  }

  public String getMd5() {
    return md5;
  }

  public void setMd5(String md5) {
    this.md5 = md5;
  }

  public String getSha1() {
    return sha1;
  }

  public void setSha1(String sha1) {
    this.sha1 = sha1;
  }

  public String getCrc32() {
    return crc32;
  }

  public void setCrc32(String crc32) {
    this.crc32 = crc32;
  }

  public String getDriver() {
    return driver;
  }

  public void setDriver(String driver) {
    this.driver = driver;
  }

  public Long getDownload() {
    return download;
  }

  public void setDownload(Long download) {
    this.download = download;
  }

  public Long getOrigin() {
    return origin;
  }

  public void setOrigin(Long origin) {
    this.origin = origin;
  }

  public String getUa() {
    return ua;
  }

  public void setUa(String ua) {
    this.ua = ua;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getVersion() {
    return version;
  }

  public void setVersion(String version) {
    this.version = version;
  }

  public String getHttp_info() {
    return http_info;
  }

  public void setHttp_info(String http_info) {
    this.http_info = http_info;
  }

  public Long getSort() {
    return sort;
  }

  public void setSort(Long sort) {
    this.sort = sort;
  }

  public Long getStatus() {
    return status;
  }

  public void setStatus(Long status) {
    this.status = status;
  }

  public Long getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Long create_time) {
    this.create_time = create_time;
  }

  public Long getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Long update_time) {
    this.update_time = update_time;
  }
}
