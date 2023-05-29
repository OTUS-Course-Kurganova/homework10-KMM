package alexandra.kurganova.otus.hwkmmapp.model

import kotlinx.serialization.Required
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Person(
    @SerialName(value = "id") @Required val id: kotlin.String = "",
    @SerialName(value = "name") @Required val name: kotlin.String = "",
    @SerialName(value = "alternate_names") @Required val alternateNames: kotlin.collections.List<kotlin.String>,
    @SerialName(value = "species") @Required val species: kotlin.String = "",
    @SerialName(value = "gender") @Required val gender: kotlin.String = "",
    @SerialName(value = "house") @Required val house: kotlin.String = "",
    @SerialName(value = "dateOfBirth") @Required val dateOfBirth: kotlin.String? = "",
    @SerialName(value = "yearOfBirth") @Required val yearOfBirth: kotlin.Int? = 0,
    @SerialName(value = "wizard") @Required val wizard: kotlin.Boolean = true,
    @SerialName(value = "ancestry") @Required val ancestry: kotlin.String = "",
    @SerialName(value = "eyeColour") @Required val eyeColour: kotlin.String = "",
    @SerialName(value = "hairColour") @Required val hairColour: kotlin.String = "",
    @SerialName(value = "wand") @Required val wand: Wand,
    @SerialName(value = "patronus") @Required val patronus: kotlin.String = "",
    @SerialName(value = "hogwartsStudent") @Required val hogwartsStudent: kotlin.Boolean = true,
    @SerialName(value = "hogwartsStaff") @Required val hogwartsStaff: kotlin.Boolean = true,
    @SerialName(value = "actor") @Required val actor: kotlin.String = "",
    @SerialName(value = "alternate_actors") @Required val alternateActors: kotlin.collections.List<kotlin.String>,
    @SerialName(value = "alive") @Required val alive: kotlin.Boolean = true,
    @SerialName(value = "image") @Required val image: kotlin.String = ""
)