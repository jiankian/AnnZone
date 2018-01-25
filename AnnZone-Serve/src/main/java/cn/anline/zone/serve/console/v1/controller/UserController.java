package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.ebean2.EbeanDao;
import cn.anline.zone.serve.console.v1.bean.LoginBean;
import cn.anline.zone.serve.console.v1.bean.TokenBean;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_user;
import com.alibaba.fastjson.JSON;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.apache.commons.codec.binary.Base64;
import org.osgl.mvc.annotation.Action;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.annotation.PostAction;
import org.osgl.mvc.result.RenderJSON;
import org.osgl.util.Crypto;

import javax.inject.Inject;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用户接口
 */
@Controller("user")
public class UserController extends V1BaseController{

    /**
     * 用户表DAO
     */
    @Inject
    EbeanDao<Long,Ann_user> userEbeanDao;

    /**
     * 登录接口 暂定@Action 支持get和post数据
     * @param username
     * @param password
     * @return
     */
    @Action("signin")
    public RenderJSON signin(String username, String password){
        if (null == username || null == password){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或者密码不能为空！");
            throw Controller.Util.json(v1BaseBean);
        }
        Ann_user annUser = userEbeanDao.findOneBy("username",username);
        if (null == annUser){
            v1BaseBean.setStatus(4);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("登录的账号不存在或已封号，请检查用户名！");
            throw Controller.Util.json(v1BaseBean);
        }
        if (annUser.getPassword().equals(Crypto.passwordHash(password.trim()))){
            v1BaseBean.setStatus(0);
            v1BaseBean.setResult(1);
            v1BaseBean.setMsg("登录成功，给你返回了最新的Token请保存哈~");
//            v1BaseBean.setData(annUser);
            //开始封装Token以返回Token给客户端，而不是返回用户信息回去
            String token = Jwts.builder()
                    .signWith(SignatureAlgorithm.HS512,Base64.encodeBase64(Constant.key.getBytes()))
                    .setId(String.valueOf(annUser.getId()))//设置所属ID
                    .setIssuer("Jiankian")//签发者、
                    .setSubject(annUser.getUsername())//面向的用户
                    .claim("user",annUser)//装载对象
                    .claim("username",annUser.getUsername())//装载用户名
                    .setAudience(annUser.getEmail())//接收者
                    .setExpiration(new Date(System.currentTimeMillis()+Constant.exp))//过期时间
                    .setIssuedAt(new Date())//签发与何时
                    .setHeaderParam("app","AnnZone")//头部参数
                    .compact();
            LoginBean loginBean = new LoginBean(
                 annUser.getId(),
                 annUser.getRole_id(),
                 annUser.getUsername(),
                 annUser.getAvatar(),
                 annUser.getNickname(),
                 annUser.getEmail(),
                 annUser.getGender(),
                 annUser.getProfile(),
                 annUser.getCreate_time(),
                 annUser.getUpdate_time(),
                 token
            );
            v1BaseBean.setData(loginBean);
            return Controller.Util.json(v1BaseBean);
        }else {
            v1BaseBean.setStatus(2);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("您的密码不正确，请检查密码！");
            return Controller.Util.json(v1BaseBean);
        }

    }

    /**
     * 注册接口
     * @return
     */
    @Action("signup")
    public RenderJSON signup(){
        return Controller.Util.json(v1BaseBean);
    }

    /**
     * 注销接口
     * @return
     */
    @Action("signout")
    public RenderJSON logout(){
        //测试下全局的用户信息是否获取到了
        return Controller.Util.json(__user);
    }

    /**
     * Token验证接口
     * @return
     */
    @Action("verify")
    public RenderJSON verify(String username, String token){
        if (null == username || username.trim().equals("") || null == token || token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或Token不能为空！");
            throw Controller.Util.json(v1BaseBean);
        }
        try {
            Claims jwt = Jwts.parser()
                    .setSigningKey(Base64.encodeBase64(Constant.key.getBytes()))
                    .parseClaimsJws(token.trim())
                    .getBody();
            System.out.println("验证的过期时间！");
            System.out.println(jwt.getExpiration());
            System.out.println(jwt.get("username").toString());
            System.out.println("装载的对象：");
            System.out.println(JSON.toJSONString(jwt.get("user")));
            if (String.valueOf(jwt.get("username")).trim().equals(username.trim())){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("Token验证成功：合法！");
                return Controller.Util.json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(2);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("Token与用户名不匹配！");
                return Controller.Util.json(v1BaseBean);
            }
        }catch (Exception e)
        {
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("Token解析失败,Token无效或者已经过期，请检查Token或重新获取！");
            return Controller.Util.json(v1BaseBean);
        }

    }

    /**
     * 刷新Token 返回最新Token回去
     * @return
     */
    @Action("token")
    public RenderJSON  token(String username,String token){
        if (null == username || username.trim().equals("") || null == token ||token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或Token不能为空");
            throw Controller.Util.json(v1BaseBean);
        }

        try {
            Claims jwt = Jwts.parser()
                    .setSigningKey(Base64.encodeBase64(Constant.key.getBytes()))
                    .parseClaimsJws(token.trim())
                    .getBody();
            System.out.println("签发前的过期时间");
            System.out.println(jwt.getExpiration());
            System.out.println("装载的对象：");
            System.out.println(JSON.toJSONString(jwt.get("user")));
            if (String.valueOf(jwt.get("username")).trim().equals(username.trim())){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("Token验证成功，且派发了最新Token数据！");
                String jws = Jwts.builder()
                        .signWith(SignatureAlgorithm.HS512,Base64.encodeBase64(Constant.key.getBytes()))
                        .setId(String.valueOf(jwt.getId()))//设置所属ID
                        .setIssuer("Jiankian")//签发者、
                        .setSubject(username)//面向的用户
                        .claim("user",jwt.get("user"))//装载对象
                        .claim("username",username)//装载用户名
                        .setAudience(jwt.getAudience())//接收者
                        .setExpiration(new Date(System.currentTimeMillis()+Constant.exp))//过期时间
                        .setIssuedAt(new Date())//签发于何时
                        .setHeaderParam("app","AnnZone")//头部参数
                        .compact();
                v1BaseBean.setData(new TokenBean(jws));
                return Controller.Util.json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(2);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("Token与用户名不匹配！");
                return Controller.Util.json(v1BaseBean);
            }
        }catch (Exception e)
        {
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("Token解析失败,Token无效或者已经过期，请检查Token或重新获取！");
            return Controller.Util.json(v1BaseBean);
        }

    }


}
