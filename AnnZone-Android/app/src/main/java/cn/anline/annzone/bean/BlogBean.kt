package cn.anline.annzone.bean

data class BlogBean(val msg: String = "",
                    val result: Int = 0,
                    val data: List<BlogDataItem>?,
                    val time: Long = 0,
                    val exp: Long = 0,
                    val status: Int = 0){
}