package alexandra.kurganova.otus.hwkmmapp.model

import kotlinx.serialization.Required
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Wand(
    @SerialName(value = "wood") @Required val wood: kotlin.String = "",
    @SerialName(value = "core") @Required val core: kotlin.String = "",
    @SerialName(value = "length") @Required val length: kotlin.Double? = (0.0).toDouble()
)
