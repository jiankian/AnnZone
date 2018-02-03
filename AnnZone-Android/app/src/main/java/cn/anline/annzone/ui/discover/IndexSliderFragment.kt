package cn.anline.annzone.ui.discover

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import cn.anline.annzone.R

/**
 * 首页滑动列表 分类列表页面
 */
class IndexSliderFragment : Fragment() {
    private var cid: Int? = null
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
    }

    companion object {

        fun getInstance(cid: Int): IndexSliderFragment {
            val indexSliderFragment = IndexSliderFragment()
            indexSliderFragment.cid = cid
            return indexSliderFragment
        }
    }
}