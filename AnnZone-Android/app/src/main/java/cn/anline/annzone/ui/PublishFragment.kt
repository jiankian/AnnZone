package cn.anline.annzone.ui

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast

import cn.anline.annzone.R
import cn.anline.annzone.view.CircleMenuLayout
import kotlinx.android.synthetic.main.fragment_publish.*

class PublishFragment : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val view =  inflater.inflate(R.layout.fragment_publish, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val icons = intArrayOf(
                R.mipmap.publish_microblog,
                R.mipmap.publish_blog,
                R.mipmap.publish_note,
                R.mipmap.publish_project,
                R.mipmap.publish_task,
                R.mipmap.publish_account,
                R.mipmap.publish_space,
                R.mipmap.publish_health
        )
        val texts:Array<String> = arrayOf("微博","博客","笔记","项目","任务","记账","云盘","健康")
        circleMenuLayout!!.setMenuItemIconsAndTexts(icons,texts)
        circleMenuLayout!!.setOnMenuItemClickListener(object : CircleMenuLayout.OnMenuItemClickListener {

            override fun itemClick(view: View, pos: Int) {
                Toast.makeText(activity, texts[pos],
                        Toast.LENGTH_SHORT).show()

            }

            override fun itemCenterClick(view: View) {
                Toast.makeText(activity,
                        "中间按钮被点击",
                        Toast.LENGTH_SHORT).show()


            }
        })
    }

}
