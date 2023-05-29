package alexandra.kurganova.otus.hwkmmapp.model

import kotlinx.serialization.Required
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Spell(
    @SerialName(value = "id") @Required val id: kotlin.String = "",
    @SerialName(value = "name") @Required val name: kotlin.String = "",
    @SerialName(value = "description") @Required val description: kotlin.String = ""
)
