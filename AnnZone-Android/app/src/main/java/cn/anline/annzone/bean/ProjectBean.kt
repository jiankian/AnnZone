package cn.anline.annzone.bean

data class ProjectBean(val msg: String = "",
                       val result: Int = 0,
                       val data: List<ProjectDataItem>?,
                       val time: Long = 0,
                       val exp: Long = 0,
                       val status: Int = 0)