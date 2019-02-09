package cn.anline.annzone.utils

import android.content.Context
import android.net.Uri
import android.widget.ImageView
import com.squareup.picasso.Picasso
import com.youth.banner.loader.ImageLoader

/**
 * Created by jiankian on 2018/2/4.
 */
class BannerPicassoImageLoader : ImageLoader() {
    override fun displayImage(context: Context?, path: Any?, imageView: ImageView?) {
        Picasso.get()
                .load(path as String)
                .fit()
                .into(imageView)
    }
}