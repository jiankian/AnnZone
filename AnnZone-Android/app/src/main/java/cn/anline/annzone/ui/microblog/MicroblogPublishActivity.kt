package cn.anline.annzone.ui.microblog

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import cn.anline.annzone.R

/**
 * 微博发布/编辑界面
 */
class MicroblogPublishActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_microblog_publish)
    }
}
