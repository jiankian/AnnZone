package cn.anline.annzone

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.design.widget.CoordinatorLayout
import android.support.v4.app.Fragment
import android.support.v4.view.ViewPager
import cn.anline.annzone.ui.*
import eu.long1.spacetablayout.SpaceTabLayout

class MainActivity : AppCompatActivity() {

    lateinit var spaceTabLayout: SpaceTabLayout
    lateinit var viewPager: ViewPager
    lateinit var coordinatorLayout: CoordinatorLayout
    lateinit var fragmentMutableList: MutableList<Fragment>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
//        绑定UI
        coordinatorLayout = findViewById(R.id.activity_main)
        viewPager = findViewById(R.id.viewPager)
        spaceTabLayout = findViewById(R.id.spaceTabLayout)
//        添加Fragment
        fragmentMutableList = ArrayList<Fragment>()
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
