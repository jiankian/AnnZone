package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.DbBind;
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
import org.osgl.mvc.annotation.PostAction;
import org.osgl.mvc.result.RenderJSON;
import org.osgl.util.Crypto;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;
import java.util.Date;

import static act.controller.Controller.Util.*;

/**
 * 用户接口
 */
@Controller("user")
public class UserController extends V1BaseController{

//    /**
//     * 用户表DAO
//     */
//    @Inject
//    EbeanDao<Long,Ann_user> userEbeanDao;

    /**
     * 登录接口 暂定@PostAction 支持get和post数据
     * @param username
     * @param password
     * @return
     */
    @PostAction("signin")
    public RenderJSON signin(@NotNull String username, @NotNull String password){
        if (null == username || null == password){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或者密码不能为空！");
            throw json(v1BaseBean);
        }
        Ann_user annUser = userEbeanDao.findOneBy("username",username);
        if (null == annUser){
            v1BaseBean.setStatus(4);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("登录的账号不存在或已封号，请检查用户名！");
            throw json(v1BaseBean);
        }
        if (annUser.getPassword().equals(Crypto.passwordHash(password.trim()))){
            v1BaseBean.setStatus(0);
            v1BaseBean.setResult(1);
            v1BaseBean.setMsg("登录成功，给你返回了最新的Token请保存哈~");
//            v1BaseBean.setData(annUser);
            //开始封装Token以返回Token给客户端，而不是返回用户信息回去
            annUser.setPassword(null);//屏蔽密码信息
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
            return json(v1BaseBean);
        }else {
            v1BaseBean.setStatus(2);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("您的密码不正确，请检查密码！");
            return json(v1BaseBean);
        }

    }

    /**
     * 注册接口
     * @return
     */
    @PostAction("signup")
    public RenderJSON signup(Ann_user ann_user){
        if (null == ann_user || null == ann_user.getUsername() || String.valueOf(ann_user.getUsername()).equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名不能为空，请输入用户名！");
            throw json(v1BaseBean);
        }
        if (null == ann_user || null == ann_user.getEmail() || String.valueOf(ann_user.getEmail()).equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("邮箱号不能为空，请输入邮箱！");
            throw json(v1BaseBean);
        }
        if (null == ann_user || null == ann_user.getPassword() || String.valueOf(ann_user.getPassword()).equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("密码不能为空，请输入密码！");
            throw json(v1BaseBean);
        }
        if (null != userEbeanDao.findOneBy("username",ann_user.getUsername())){
            v1BaseBean.setStatus(6);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户"+String.valueOf(ann_user.getUsername())+"已注册,请换一个用户名！");
            throw json(v1BaseBean);
        }
        if (null != userEbeanDao.findOneBy("email",ann_user.getEmail())){
            v1BaseBean.setStatus(6);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("邮箱号"+String.valueOf(ann_user.getEmail())+"已注册,请换一个邮箱号！");
            throw json(v1BaseBean);
        }
        ann_user.setPassword(Crypto.passwordHash(ann_user.getPassword().trim()));
        ann_user.setStatus(Long.valueOf(0));
        ann_user.setCreate_time(new Date().getTime());
        ann_user.setUpdate_time(new Date().getTime());
        try {
            Ann_user newUser = userEbeanDao.save(ann_user);
            if (null != newUser){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("新用户注册成功");
                v1BaseBean.setData(newUser);
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(7);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("新用户注册失败！请检查填写的数据是否完整");
                return json(v1BaseBean);
            }
        }catch (Exception e){
            v1BaseBean.setStatus(7);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("新用户注册失败！请检查填写的数据是否完整");
            return json(v1BaseBean);
        }

    }

    /**
     * 注销接口
     * @return
     */
    @PostAction("signout")
    public RenderJSON signout(){
        /**
         * 调试下 如果把Token保存在数据库请在这里删除注销，比如token没有过期时间的时候，从数据库删除从而控制从前就登录的用户
         */
        //测试下全局的用户信息是否获取到了
        v1BaseBean.setStatus(0);
        v1BaseBean.setResult(1);
        v1BaseBean.setMsg("已注销当前登录");
        System.out.println("当前用户ID：");
        System.out.println(__uid);
        System.out.println("当前用户名：");
        System.out.println(__username);
        System.out.println("当前用户对象：");
        System.out.println(JSON.toJSONString(__user));

        System.out.println("ctx 用户名：");
        System.out.println(context.username());
        System.out.println("ctx参数用户ID：");
        System.out.println(context.paramVal("uid"));
        System.out.println("ctx缓存的当前用户对象：");
        System.out.println(JSON.toJSONString(context.cached("user")));
        System.out.println("ctx标签的当前用户对象：");
        System.out.println(JSON.toJSONString(context.attribute("user")));
        //进行注销操作
        this.set__uid(0);
        this.set__username(null);
        this.set__user(null);

        context.logout();
        context.param("uid",null);
        context.cache("user",null);
        context.removeAttribute("user");
        //检测注销结果
        System.out.println("注销后用户ID：");
        System.out.println(__uid);
        System.out.println("注销后当前用户名：");
        System.out.println(__username);
        System.out.println("注销后当前用户对象：");
        System.out.println(JSON.toJSONString(__user));

        System.out.println("注销后ctx 用户名：");
        System.out.println(context.username());
        System.out.println("注销后ctx参数用户ID：");
        System.out.println(context.paramVal("uid"));
        System.out.println("注销后ctx缓存的当前用户对象：");
        System.out.println(JSON.toJSONString(context.cached("user")));
        System.out.println("注销后ctx标签的当前用户对象：");
        System.out.println(JSON.toJSONString(context.attribute("user")));
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setExp(-1);
        return json(v1BaseBean);
    }

    /**
     * Token验证接口
     * @return
     */
    @PostAction("verify")
    public RenderJSON verify(String username, String token){
        if (null == username || username.trim().equals("") || null == token || token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或Token不能为空！");
            throw json(v1BaseBean);
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
                v1BaseBean.setExp(Constant.exp+new Date().getTime());
                v1BaseBean.setMsg("Token验证成功：合法！");
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(2);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("Token与用户名不匹配！");
                return json(v1BaseBean);
            }
        }catch (Exception e)
        {
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("Token解析失败,Token无效或者已经过期，请检查Token或重新获取！");
            return json(v1BaseBean);
        }

    }

    /**
     * 刷新Token 返回最新Token回去
     * @return
     */
    @PostAction("token")
    public RenderJSON  token(String username,String token){
        if (null == username || username.trim().equals("") || null == token ||token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("用户名或Token不能为空");
            throw json(v1BaseBean);
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




                try {
                    Ann_user newUser = userEbeanDao.findOneBy("username",username);
                    newUser.setPassword(null);//不返回密码信息
                    String newJWT = Jwts.builder()
                            .signWith(SignatureAlgorithm.HS512,Base64.encodeBase64(Constant.key.getBytes()))
                            .setId(String.valueOf(jwt.getId()))//设置所属ID
                            .setIssuer("Jiankian")//签发者、
                            .setSubject(username)//面向的用户
                            .claim("user",newUser)//装载对象
                            .claim("username",username)//装载用户名
                            .setAudience(jwt.getAudience())//接收者
                            .setExpiration(new Date(System.currentTimeMillis()+Constant.exp))//过期时间
                            .setIssuedAt(new Date())//签发于何时
                            .setHeaderParam("app","AnnZone")//头部参数
                            .compact();
                    if (null == newUser){
                        v1BaseBean.setStatus(4);
                        v1BaseBean.setResult(0);
                        v1BaseBean.setMsg("Token正确，但Token登录的账号不存在，请检查用户名！");
                        throw json(v1BaseBean);
                    }
                    LoginBean refreshLoginBean = new LoginBean(
                            newUser.getId(),
                            newUser.getRole_id(),
                            newUser.getUsername(),
                            newUser.getAvatar(),
                            newUser.getNickname(),
                            newUser.getEmail(),
                            newUser.getGender(),
                            newUser.getProfile(),
                            newUser.getCreate_time(),
                            newUser.getUpdate_time(),
                            newJWT
                    );
                    v1BaseBean.setStatus(0);
                    v1BaseBean.setResult(1);
                    v1BaseBean.setTime(new Date().getTime());
                    v1BaseBean.setExp(new Date().getTime()+Constant.exp);
                    v1BaseBean.setData(refreshLoginBean);
                    v1BaseBean.setMsg("Token验证成功，且派发了最新用户信息(+Token)数据！");
                    return json(v1BaseBean);
                }catch (Exception e){
//                    e.printStackTrace();
                    v1BaseBean.setStatus(4);
                    v1BaseBean.setResult(1);
                    v1BaseBean.setExp(-1);
                    v1BaseBean.setTime(new Date().getTime());
                    v1BaseBean.setMsg("Token所属的用户不存在");
//                    v1BaseBean.setData(new TokenBean(newJWT));
                    return json(v1BaseBean);
                }
            }else {
                v1BaseBean.setStatus(2);
                v1BaseBean.setResult(0);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setExp(-1);
                v1BaseBean.setMsg("Token与用户名不匹配！");
                return json(v1BaseBean);
            }
        }catch (Exception e)
        {
//            e.printStackTrace();
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setExp(-1);
            v1BaseBean.setMsg("Token解析失败,Token无效或者已经过期，请检查Token或重新获取！");
            return json(v1BaseBean);
        }

    }

    /**
     * 更新用户信息
     * @param user 需要更新的用户 传id主键
     * @param ann_user 新的用户信息
     * @return
     */
    @PostAction("update")
    public RenderJSON update(@DbBind @NotNull Ann_user user,Ann_user ann_user){
        if (null == user || user.equals("") || null == ann_user){
            v1BaseBean.setStatus(2);
            v1BaseBean.setResult(0);
            v1BaseBean.setExp(-1);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setMsg("更新参数不正确，请检查数据以重试！");
            throw json(v1BaseBean);
        }

        //写入需要的更新项 具体更新项目具体去开发....
        user.setNickname(ann_user.getNickname());
        user.setUpdate_time(new Date().getTime());
        user.setUsername(ann_user.getUsername());
        user.setEmail(ann_user.getEmail());
        user.setPassword(Crypto.passwordHash(ann_user.getPassword()));
        try{
            Ann_user afterUser = userEbeanDao.save(user);
            if (null != afterUser){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("用户信息更新成功！");
                v1BaseBean.setData(afterUser);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setExp(new Date().getTime()+Constant.exp);
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(7);
                v1BaseBean.setResult(0);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setExp(-1);
                v1BaseBean.setMsg("用户信息数据库更新失败，请检查数据！");
                return json(v1BaseBean);
            }
        }catch (Exception e){
            v1BaseBean.setStatus(7);
            v1BaseBean.setResult(0);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setExp(-1);
            v1BaseBean.setMsg("用户更新数据写入数据库失败，请检查数据是否正确！");
            return json(v1BaseBean);
        }

    }

    /**
     * 修改用户密码
     * @param username 用户名
     * @param old_password 旧密码
     * @param new_password 新密码
     * @return
     */
    @PostAction("password/modify")
    public RenderJSON passwordModify(String username, String old_password, String new_password){
        /**
         * 修改参数只是密码，其它信息不动！！！！
         */
        if (null == username || username.isEmpty() ){
            v1BaseBean.setExp(-1);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setResult(0);
            v1BaseBean.setStatus(1);
            v1BaseBean.setMsg("用户名不能为空！");
            throw json(v1BaseBean);
        }
        if (null == old_password || old_password.isEmpty()){
            v1BaseBean.setExp(-1);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setResult(0);
            v1BaseBean.setStatus(1);
            v1BaseBean.setMsg("旧密码不能为空！");
            throw json(v1BaseBean);
        }
        if (null == new_password || new_password.isEmpty()){
            v1BaseBean.setExp(-1);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setResult(0);
            v1BaseBean.setStatus(1);
            v1BaseBean.setMsg("新密码不能为空！");
            throw json(v1BaseBean);
        }
        try {
            Ann_user ann_user = userEbeanDao.findOneBy("username",username);
            if (null == ann_user) {
                v1BaseBean.setStatus(8);
                v1BaseBean.setMsg("用户："+username+"不存在或者已被封号或删除！");
                v1BaseBean.setResult(0);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setExp(-1);
                return   json(v1BaseBean);
            }else {
                 if (Crypto.passwordHash(old_password).equals(ann_user.getPassword())){
                    ann_user.setPassword(Crypto.passwordHash(new_password));
                    try {
                        Ann_user ann_user_new = userEbeanDao.save(ann_user);
                        if (null != ann_user_new){
                            v1BaseBean.setResult(1);
                            v1BaseBean.setTime(new Date().getTime());
                            v1BaseBean.setStatus(0);
                            v1BaseBean.setMsg("密码修改成功！");
                            v1BaseBean.setExp(new Date().getTime() +Constant.exp);
                            v1BaseBean.setData(ann_user_new);
                            return json(v1BaseBean);
                        }else {
                            v1BaseBean.setStatus(7);
                            v1BaseBean.setExp(-1);
                            v1BaseBean.setMsg("密码保存失败，数据库写入错误！");
                            v1BaseBean.setTime(new Date().getTime());
                            v1BaseBean.setResult(0);
                            return json(v1BaseBean);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                        v1BaseBean.setStatus(2);
                        v1BaseBean.setExp(-1);
                        v1BaseBean.setMsg("旧密码不正确！");
                        v1BaseBean.setTime(new Date().getTime());
                        v1BaseBean.setResult(0);
                        return json(v1BaseBean);
                    }
                 }else {
                     v1BaseBean.setStatus(2);
                     v1BaseBean.setExp(-1);
                     v1BaseBean.setMsg("旧密码不正确！");
                     v1BaseBean.setTime(new Date().getTime());
                     v1BaseBean.setResult(0);
                     return json(v1BaseBean);
                 }
            }
        }catch (Exception e){
            e.printStackTrace();
            v1BaseBean.setStatus(8);
            v1BaseBean.setMsg("密码修改失败，未知异常！");
            v1BaseBean.setResult(0);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setExp(-1);
            return  json(v1BaseBean);
        }

    }

    /**
     * 邮箱找回密码接口
     * @param email
     * @return
     */
    @PostAction("password/forget")
    public RenderJSON passwordForget(String email){
        if (null == email || email.isEmpty() || email.equals("")){
            v1BaseBean.setResult(0);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setExp(-1);
            v1BaseBean.setStatus(1);
            v1BaseBean.setMsg("邮箱不能为空！");
            throw json(v1BaseBean);
        }
        //设置邮箱找回相关操作 现在暂时不是多用户系统，自己用，不作密码自助找回功能
        v1BaseBean.setStatus(0);
        v1BaseBean.setResult(1);
        v1BaseBean.setMsg("密码找回方法已经发送到邮箱"+email);
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setExp(Constant.exp + new Date().getTime());
        return json(v1BaseBean);
    }

    /**
     * 用户点击邮箱找回密码链接操作接口 此处应该返回一个网页链接才行  再考虑下吧！！！！！！！
     * @param token
     * @return
     */
    @PostAction("password/reset")
    public RenderJSON passwordReset(String token){
        //邮箱点击后链接操作，token为修改的令牌，从邮箱中获取！
        /**
         * 暂时不写了，等做了多用户功能再做此功能
         */
        v1BaseBean.setStatus(1);
        v1BaseBean.setMsg("暂不支持自助修改修改，因为你也是管理员啊，暂时还没有普通前台用户~");
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setExp(-1);
        v1BaseBean.setResult(0);
        return json(v1BaseBean);
    }

}
