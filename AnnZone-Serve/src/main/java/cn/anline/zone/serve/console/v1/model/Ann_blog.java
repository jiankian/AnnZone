package cn.anline.zone.serve.console.v1.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ann_blog {
  @Id
  private Long id;
  private Long uid;
  private String title;
  private Long cid;
  private String extra_cid;
  private String short_title;
  private String source;
  private String url;
  private String author;
  private String summary;
  private String content;
  private String cover;
  private String keyword;
  private String article_id_array;
  private Long click;
  private Long sort;
  private Long commend_flag;
  private Long comment_flag;
  private String attachment_path;
  private String tag;
  private Long comment_count;
  private Long share_count;
  private String publisher_name;
  private Long last_comment_time;
  private Long public_time;
  private String ip;
  private String ua;
  private String http_info;
  private Long origin;
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

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Long getCid() {
    return cid;
  }

  public void setCid(Long cid) {
    this.cid = cid;
  }

  public String getExtra_cid() {
    return extra_cid;
  }

  public void setExtra_cid(String extra_cid) {
    this.extra_cid = extra_cid;
  }

  public String getShort_title() {
    return short_title;
  }

  public void setShort_title(String short_title) {
    this.short_title = short_title;
  }

  public String getSource() {
    return source;
  }

  public void setSource(String source) {
    this.source = source;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getCover() {
    return cover;
  }

  public void setCover(String cover) {
    this.cover = cover;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public String getArticle_id_array() {
    return article_id_array;
  }

  public void setArticle_id_array(String article_id_array) {
    this.article_id_array = article_id_array;
  }

  public Long getClick() {
    return click;
  }

  public void setClick(Long click) {
    this.click = click;
  }

  public Long getSort() {
    return sort;
  }

  public void setSort(Long sort) {
    this.sort = sort;
  }

  public Long getCommend_flag() {
    return commend_flag;
  }

  public void setCommend_flag(Long commend_flag) {
    this.commend_flag = commend_flag;
  }

  public Long getComment_flag() {
    return comment_flag;
  }

  public void setComment_flag(Long comment_flag) {
    this.comment_flag = comment_flag;
  }

  public String getAttachment_path() {
    return attachment_path;
  }

  public void setAttachment_path(String attachment_path) {
    this.attachment_path = attachment_path;
  }

  public String getTag() {
    return tag;
  }

  public void setTag(String tag) {
    this.tag = tag;
  }

  public Long getComment_count() {
    return comment_count;
  }

  public void setComment_count(Long comment_count) {
    this.comment_count = comment_count;
  }

  public Long getShare_count() {
    return share_count;
  }

  public void setShare_count(Long share_count) {
    this.share_count = share_count;
  }

  public String getPublisher_name() {
    return publisher_name;
  }

  public void setPublisher_name(String publisher_name) {
    this.publisher_name = publisher_name;
  }

  public Long getLast_comment_time() {
    return last_comment_time;
  }

  public void setLast_comment_time(Long last_comment_time) {
    this.last_comment_time = last_comment_time;
  }

  public Long getPublic_time() {
    return public_time;
  }

  public void setPublic_time(Long public_time) {
    this.public_time = public_time;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getUa() {
    return ua;
  }

  public void setUa(String ua) {
    this.ua = ua;
  }

  public String getHttp_info() {
    return http_info;
  }

  public void setHttp_info(String http_info) {
    this.http_info = http_info;
  }

  public Long getOrigin() {
    return origin;
  }

  public void setOrigin(Long origin) {
    this.origin = origin;
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
