package cn.anline.zone.serve.console.v1.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ann_project {
  @Id
  private Long id;
  private Long uid;
  private String name;
  private String cover;
  private String teams;
  private String description;
  private String content;
  private Long start_time;
  private Long end_time;
  private Long progress;
  private String progress_times;
  private String out_url;
  private String git_url;
  private String files;
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

  public String getCover() {
    return cover;
  }

  public void setCover(String cover) {
    this.cover = cover;
  }

  public String getTeams() {
    return teams;
  }

  public void setTeams(String teams) {
    this.teams = teams;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Long getStart_time() {
    return start_time;
  }

  public void setStart_time(Long start_time) {
    this.start_time = start_time;
  }

  public Long getEnd_time() {
    return end_time;
  }

  public void setEnd_time(Long end_time) {
    this.end_time = end_time;
  }

  public Long getProgress() {
    return progress;
  }

  public void setProgress(Long progress) {
    this.progress = progress;
  }

  public String getProgress_times() {
    return progress_times;
  }

  public void setProgress_times(String progress_times) {
    this.progress_times = progress_times;
  }

  public String getOut_url() {
    return out_url;
  }

  public void setOut_url(String out_url) {
    this.out_url = out_url;
  }

  public String getGit_url() {
    return git_url;
  }

  public void setGit_url(String git_url) {
    this.git_url = git_url;
  }

  public String getFiles() {
    return files;
  }

  public void setFiles(String files) {
    this.files = files;
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
