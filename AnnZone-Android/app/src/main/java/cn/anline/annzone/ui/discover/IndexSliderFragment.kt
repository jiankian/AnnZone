package cn.anline.annzone.ui.discover

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import cn.anline.annzone.R
import cn.anline.annzone.adapter.DiscoverIndexListAdapter
import cn.anline.annzone.bean.BlogDataItem
import kotlinx.android.synthetic.main.fragment_index_slider.*

/**
 * 首页滑动列表 分类列表页面
 */
class IndexSliderFragment : androidx.fragment.app.Fragment() {
    private var cid: Int? = null
    private var title: String? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_index_slider, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        //        装载RecyclerView数据
        var listBlogDataItem: ArrayList<BlogDataItem> = ArrayList<BlogDataItem>()
        for (i in 1..20){
            var blogDataItem: BlogDataItem = BlogDataItem()
            blogDataItem.title = title+"第"+i+"篇"+":都不知道取什么标题哦！呵呵呵，😄"
            blogDataItem.summary= title+i+"的描述"
            blogDataItem.uid = 1
            blogDataItem.createTime = 1517731912688L
            listBlogDataItem.add(blogDataItem)
        }
        recycler_view.adapter = DiscoverIndexListAdapter(R.layout.discover_index_list_item,listBlogDataItem)
        recycler_view.layoutManager = androidx.recyclerview.widget.LinearLayoutManager(activity)
    }

    companion object {

        fun getInstance(cid: Int,title: String): IndexSliderFragment {
            val indexSliderFragment = IndexSliderFragment()
            indexSliderFragment.cid = cid
            indexSliderFragment.title = title
            return indexSliderFragment
        }
    }
}