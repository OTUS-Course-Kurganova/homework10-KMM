package alexandra.kurganova.otus.hwkmmapp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform