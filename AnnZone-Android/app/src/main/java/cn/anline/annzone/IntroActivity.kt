package cn.anline.annzone

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.util.Log
import cn.anline.annzone.ui.intro.*
import cn.anline.annzone.utils.IntroSharedPreferencesManager
import com.github.paolorotolo.appintro.AppIntro

/**
 * 引导页
 */
class IntroActivity : AppIntro() {
    val TAG: String = "引导页"
    private lateinit var introPref: IntroSharedPreferencesManager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_intro)
        introPref = IntroSharedPreferencesManager(this)

//        添加引导页 按照自己的需求和设计去做吧~
        addSlide(Intro1Fragment())
        addSlide(Intro2Fragment())
        addSlide(Intro3Fragment())
        addSlide(Intro4Fragment())
        addSlide(Intro5Fragment())

    }

    /**
     * 引导页被点击完成事件
     */
    override fun onDonePressed(currentFragment: androidx.fragment.app.Fragment?) {
        super.onDonePressed(currentFragment)
        Log.d(TAG,"完成")
//        存储已启动数据
        introPref.setFirst(false)
        startActivity(Intent(this,MainActivity::class.java))
        finish()
    }

    /**
     * 引导页被跳过事件
     */
    override fun onSkipPressed(currentFragment: androidx.fragment.app.Fragment?) {
        super.onSkipPressed(currentFragment)
        Log.d(TAG,"跳过")
//        存储引导过数据
        introPref.setFirst(false)
        startActivity(Intent(this,MainActivity::class.java))
        finish()
    }

    /**
     * 引导页发生翻页变化
     */
    override fun onSlideChanged(oldFragment: androidx.fragment.app.Fragment?, newFragment: androidx.fragment.app.Fragment?) {
        super.onSlideChanged(oldFragment, newFragment)
        Log.d(TAG,"滑动")
    }
}
