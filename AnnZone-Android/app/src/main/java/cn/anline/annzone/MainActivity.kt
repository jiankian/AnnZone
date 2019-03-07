package cn.anline.annzone

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import cn.anline.annzone.ui.*
import com.gyf.barlibrary.ImmersionBar
import kotlinx.android.synthetic.main.activity_main.*

/**
 * 主界面
 */
class MainActivity : AppCompatActivity() {

    lateinit var fragmentMutableList: MutableList<androidx.fragment.app.Fragment>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ImmersionBar.with(this)
                .transparentStatusBar()
                .navigationBarColor(R.color.colorTabbar)
                .init()
        setContentView(R.layout.activity_main)
//        添加Fragment
        fragmentMutableList = ArrayList<androidx.fragment.app.Fragment>()
        fragmentMutableList.add(DiscoverFragment())
        fragmentMutableList.add(ProjectFragment())
        fragmentMutableList.add(PublishFragment())
        fragmentMutableList.add(WorkFragment())
        fragmentMutableList.add(MeFragment())

        spaceTabLayout.initialize(viewPager,supportFragmentManager,fragmentMutableList,savedInstanceState)
        spaceTabLayout.setTabOneIcon(R.mipmap.tabbar_discover)
        spaceTabLayout.setTabTwoIcon(R.mipmap.tabbar_project)
        spaceTabLayout.setTabThreeIcon(R.mipmap.tabbar_publish)
        spaceTabLayout.setTabFourIcon(R.mipmap.tabbar_work)
        spaceTabLayout.setTabFiveIcon(R.mipmap.tabbar_me)
    }
}
