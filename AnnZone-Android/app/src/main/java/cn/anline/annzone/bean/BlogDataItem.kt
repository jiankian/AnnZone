package cn.anline.annzone.bean

import com.google.gson.annotations.SerializedName

data class BlogDataItem(var summary: String = "",
                        var uid: Int = 0,
                        @SerializedName("update_time")
                    val updateTime: Long = 0,
                        @SerializedName("create_time")
                        var createTime: Long = 0,
                        @SerializedName("http_info")
                    val httpInfo: String = "",
                        val ip: String = "",
                        val id: Int = 0,
                        var title: String = "",
                        val ua: String = "",
                        val content: String = "",
                        val url: String = "")