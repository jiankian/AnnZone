package cn.anline.annzone.adapter

import android.widget.ImageView
import cn.anline.annzone.R
import cn.anline.annzone.bean.BlogBean
import cn.anline.annzone.bean.BlogDataItem
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.BaseViewHolder
import com.squareup.picasso.Picasso

/**
 * Created by jiankian on 2018/2/4.
 */
class DiscoverSliderListAdapter(layoutResId: Int, data: List<BlogDataItem>) : BaseQuickAdapter<BlogDataItem, BaseViewHolder>(layoutResId, data) {

    override fun convert(helper: BaseViewHolder?, item: BlogDataItem?) {
            helper!!.setText(R.id.tv_discover_slider_list_item_title,item!!.title)
        Picasso.get()
                .load("https://pic.36krcnd.com/avatar/201802/03125552/cochd9j1la7gzbtl.jpeg!1200")
                .into(helper.getView(R.id.iv_discover_slider_list_item_cover) as ImageView)
    }
}