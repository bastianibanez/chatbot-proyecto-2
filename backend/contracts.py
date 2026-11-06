from typing import Literal
from pydantic import BaseModel, ConfigDict, Field, field_validator, model_validator

CONSULTAS = (
    "campeon",
    "subcampeon",
    "tercero",
    "sede",
    "equipos",
    "partidos",
    "goles",
    "goleador",
    "final",
    "titulos",
    "anios",
    "participaciones",
    "premio",
    "anfitriones_campeones",
)


class Query(BaseModel):
    model_config = ConfigDict(extra="forbid", strict=True)
    consulta: str
    anio: int | None = None
    seleccion: str | None = None
    premio: str | None = None

    @field_validator("consulta")
    @classmethod
    def query_conocida(cls, value):
        if value not in CONSULTAS:
            raise ValueError("Consulta no soportada")
        return value


class ChatRequest(BaseModel):
    model_config = ConfigDict(extra="forbid")
    modo: Literal["prolog", "llm"]
    pregunta: str = Field(min_length=1, max_length=500)
    sesion: str | None = Field(default=None, max_length=36)

    @model_validator(mode="after")
    def no_vacio(self):
        if not self.pregunta.strip():
            raise ValueError("La pregunta no puede estar vacía")
        return self


class RespuestaFinal(BaseModel):
    model_config = ConfigDict(extra="forbid")
    tipo: Literal["respuesta", "aclaracion", "fuera_alcance", "error"]
    texto: str = Field(min_length=1, max_length=4000)
