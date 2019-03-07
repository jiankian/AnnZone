package cn.anline.annzone.utils

import android.content.Context
import android.content.SharedPreferences

/**
 * 引导页SharedPreferences管理器封装
 * Created by jiankian on 2018/2/3.
 */
class IntroSharedPreferencesManager(var context: Context) {
    var sharedPreferences: SharedPreferences
    var editor: SharedPreferences.Editor
//    存储名称和字段名

//    引导页
//    如果升级APP后需要重新引导，在此修改版本号
    val INTRO_NAME: String = "intro_v1"
    val INTRO_IS_FIRST: String = "intro_is_first"
    val MODE_PRIVATE = 0

    init {
        this.sharedPreferences = context.getSharedPreferences(INTRO_NAME,MODE_PRIVATE)
        this.editor = sharedPreferences.edit()
    }

    fun setFirst(isFirstTime: Boolean): Unit {
        editor.putBoolean(INTRO_IS_FIRST,isFirstTime)
        editor.commit()
    }

    fun isIntro(): Boolean{
        return sharedPreferences.getBoolean(INTRO_IS_FIRST,true)
    }
}