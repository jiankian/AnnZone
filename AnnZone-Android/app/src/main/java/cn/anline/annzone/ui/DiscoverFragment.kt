package cn.anline.annzone.ui

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentPagerAdapter
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import cn.anline.annzone.R
import cn.anline.annzone.ui.discover.IndexFragment
import cn.anline.annzone.ui.discover.IndexSliderFragment
import com.flyco.tablayout.listener.OnTabSelectListener
import com.gyf.barlibrary.ImmersionBar
import kotlinx.android.synthetic.main.fragment_discover.*
import org.jetbrains.anko.topPadding
import java.util.ArrayList


class DiscoverFragment : Fragment() {
    private var mFragments: ArrayList<Fragment>? = null
    private  var tabTitles: Array<String>? = null;
    private  var tabCids: Array<Int>? = null;
    private var mAdapter: MyPagerAdapter? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_discover, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        rl_top_wrapper.topPadding = ImmersionBar.getStatusBarHeight(activity)

//        具体从服务器获取分类内容
        tabCids = arrayOf(2,3,21,43,11,25,21)
        tabTitles = arrayOf("推荐","Android","iOS","前端","后端","人工智能","设计","工具资源")
        mFragments = ArrayList<Fragment>()
//        首页
        mFragments!!.add(IndexFragment.getInstance(0))
//        加载分类页面
        for (id in tabCids!!){
            mFragments!!.add(IndexSliderFragment.getInstance(id))
        }
        discover_viewPager.adapter = MyPagerAdapter(fragmentManager)
        flyco_tab.setOnTabSelectListener(object : OnTabSelectListener{
            override fun onTabSelect(position: Int) {
                Toast.makeText(activity,"选择了"+position,Toast.LENGTH_SHORT).show()
            }

            override fun onTabReselect(position: Int) {
                Toast.makeText(activity,"re选择了"+position,Toast.LENGTH_SHORT).show()
            }
        })
        flyco_tab.setViewPager(discover_viewPager)
    }


    /**
     * 文章列表ViewPager转换器
     */
    private inner class MyPagerAdapter(fm: FragmentManager?) : FragmentPagerAdapter(fm) {

        override fun getCount(): Int {
            return mFragments!!.size
        }

        override fun getPageTitle(position: Int): CharSequence? {
            return tabTitles!![position]
        }

        override fun getItem(position: Int): Fragment {
            return mFragments!![position]
        }
    }
}
