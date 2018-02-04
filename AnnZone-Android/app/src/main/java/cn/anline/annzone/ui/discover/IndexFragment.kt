package cn.anline.annzone.ui.discover

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast

import cn.anline.annzone.R
import cn.anline.annzone.adapter.DiscoverIndexListAdapter
import cn.anline.annzone.bean.BlogDataItem
import cn.anline.annzone.utils.BannerPicassoImageLoader
import com.youth.banner.BannerConfig
import kotlinx.android.synthetic.main.fragment_index.*

/**
 * 首页列表 带有Banner
 */
class IndexFragment : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_index, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val urls: List<String> = listOf(
                "http://ww4.sinaimg.cn/large/006uZZy8jw1faic1xjab4j30ci08cjrv.jpg",
                "http://ww4.sinaimg.cn/large/006uZZy8jw1faic21363tj30ci08ct96.jpg",
                "http://ww4.sinaimg.cn/large/006uZZy8jw1faic259ohaj30ci08c74r.jpg",
                "http://ww4.sinaimg.cn/large/006uZZy8jw1faic2b16zuj30ci08cwf4.jpg",
                "http://ww4.sinaimg.cn/large/006uZZy8jw1faic2e7vsaj30ci08cglz.jpg"
                )
        val titles: List<String> = listOf("51巅峰钜惠",
                "十大星级品牌联盟，全场2折起",
                "生命不是要超越别人，而是要超越自己。",
                "己所不欲，勿施于人。——孔子",
                "嗨购5折不要停"
                )
        banner.setImages(urls)
                .setBannerTitles(titles)
                .setBannerStyle(BannerConfig.CIRCLE_INDICATOR_TITLE_INSIDE)
                .setImageLoader(BannerPicassoImageLoader())
                .start()

        banner.setOnBannerListener {
            Toast.makeText(activity,"Banner："+titles[it],Toast.LENGTH_SHORT).show()
        }
//        装载RecyclerView数据
        var listBlogDataItem: ArrayList<BlogDataItem> = ArrayList<BlogDataItem>()
        for (i in 1..20){
            var blogDataItem: BlogDataItem = BlogDataItem()
            blogDataItem.title = "博客第"+i+"篇"+":都不知道取什么标题哦！呵呵呵，😄"
            blogDataItem.summary= "博客"+i+"的描述"
            blogDataItem.uid = 1
            blogDataItem.createTime = 1517731912688L
            listBlogDataItem.add(blogDataItem)
        }
        recycler_view.adapter = DiscoverIndexListAdapter(R.layout.discover_index_list_item,listBlogDataItem)
        recycler_view.layoutManager = LinearLayoutManager(activity)

    }

    companion object {

        fun getInstance(): IndexFragment {
            val indexFragment = IndexFragment()
            return indexFragment
        }
    }
}
