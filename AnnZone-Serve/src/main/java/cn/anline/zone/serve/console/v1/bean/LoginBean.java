package cn.anline.zone.serve.console.v1.bean;

/**
 * 带Token的用户信息Bean
 */
public class LoginBean {
    private Long id;
    private Long role_id;
    private String username;
    private String avatar;
    private String nickname;
    private String email;
    private Long gender;
    private String profile;
    private Long create_time;
    private Long update_time;
    private String token;

    public LoginBean() {
    }

    public LoginBean(Long id, Long role_id, String username, String avatar, String nickname, String email, Long gender, String profile, Long create_time, Long update_time, String token) {
        this.id = id;
        this.role_id = role_id;
        this.username = username;
        this.avatar = avatar;
        this.nickname = nickname;
        this.email = email;
        this.gender = gender;
        this.profile = profile;
        this.create_time = create_time;
        this.update_time = update_time;
        this.token = token;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRole_id() {
        return role_id;
    }

    public void setRole_id(Long role_id) {
        this.role_id = role_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getGender() {
        return gender;
    }

    public void setGender(Long gender) {
        this.gender = gender;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
