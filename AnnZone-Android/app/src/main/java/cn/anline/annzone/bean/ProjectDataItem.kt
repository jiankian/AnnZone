package cn.anline.annzone.bean

import com.google.gson.annotations.SerializedName

data class ProjectDataItem(@SerializedName("create_time")
                    val createTime: Int = 0,
                           val teams: String = "",
                           @SerializedName("end_time")
                    val endTime: Int = 0,
                           val description: String = "",
                           val content: String = "",
                           val cover: String = "",
                           @SerializedName("progress_times")
                    val progressTimes: String = "",
                           @SerializedName("start_time")
                    val startTime: Int = 0,
                           val uid: Int = 0,
                           @SerializedName("update_time")
                    val updateTime: Int = 0,
                           @SerializedName("out_url")
                    val outUrl: String = "",
                           val name: String = "",
                           val files: String = "",
                           val progress: Int = 0,
                           val id: Int = 0,
                           @SerializedName("git_url")
                    val gitUrl: String = "",
                           val status: Int = 0)