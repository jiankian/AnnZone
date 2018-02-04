package cn.anline.annzone.adapter

import android.widget.ImageView
import cn.anline.annzone.R
import cn.anline.annzone.bean.BlogDataItem
import cn.anline.annzone.bean.ProjectDataItem
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.BaseViewHolder
import com.squareup.picasso.Picasso

/**
 * Created by jiankian on 2018/2/4.
 */
class ProjectIndexListAdapter(layoutResId: Int, data: List<ProjectDataItem>) : BaseQuickAdapter<ProjectDataItem, BaseViewHolder>(layoutResId, data) {
    override fun convert(helper: BaseViewHolder?, item: ProjectDataItem?) {

    }

}