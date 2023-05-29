package alexandra.kurganova.otus.hwkmmapp.Network

import alexandra.kurganova.otus.hwkmmapp.model.Person
import alexandra.kurganova.otus.hwkmmapp.model.Spell
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.timeout
import io.ktor.client.request.get
import io.ktor.client.request.parameter
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

class KtorClient {
    private val baseUrl = "https://hp-api.onrender.com/api"

    val client = HttpClient {
        install(ContentNegotiation) {
            json(
                Json {
                    prettyPrint
                    ignoreUnknownKeys
                }
            )
        }
        install(HttpTimeout )
    }

    suspend fun getAllCharacters(): ArrayList<Person> {
        return client.get(urlString = "$baseUrl/characters").body()
    }
}