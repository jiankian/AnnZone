package cn.anline.annzone.ui

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import cn.anline.annzone.R
import cn.anline.annzone.adapter.ProjectIndexListAdapter
import cn.anline.annzone.bean.ProjectDataItem
import com.gyf.barlibrary.ImmersionBar
import kotlinx.android.synthetic.main.fragment_project.*
import org.jetbrains.anko.topPadding


class ProjectFragment : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_project, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        rl_ProjectFragment.topPadding = ImmersionBar.getStatusBarHeight(activity)

        var projectDataItem:ArrayList<ProjectDataItem> = ArrayList<ProjectDataItem>()
        for (d in 1..30){
            projectDataItem.add(ProjectDataItem())
        }
        recycler_view.layoutManager = LinearLayoutManager(activity)
        recycler_view.adapter = ProjectIndexListAdapter(R.layout.project_index_list_item,projectDataItem)
    }

}
