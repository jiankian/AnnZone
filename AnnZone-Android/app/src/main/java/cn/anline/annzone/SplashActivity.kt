package cn.anline.annzone

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import cn.anline.annzone.utils.IntroSharedPreferencesManager

/**
 * 启动画面页面 请在此判断是否使用引导页！！！
 */
class SplashActivity : AppCompatActivity() {

    private lateinit var introPref: IntroSharedPreferencesManager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        introPref = IntroSharedPreferencesManager(this)

        val introApphandler:Handler = Handler()
        introApphandler.postDelayed({
            if (introPref.isIntro()){
                startActivity(Intent(this,IntroActivity::class.java))
                finish()
            }else{
                startActivity(Intent(this,MainActivity::class.java))
                finish()
            }
        },3000)
    }
}
