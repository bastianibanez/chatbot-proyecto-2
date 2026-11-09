from typing import Literal
from pydantic import BaseModel, ConfigDict, Field, field_validator, model_validator

class Query(BaseModel):
    model_config = ConfigDict(extra="forbid", strict=True)
    descripcion: str = Field(default="Consultar datos de mundiales", min_length=1, max_length=100,
                             description="Título breve en español de la acción, de 3 a 8 palabras. "
                                         "Ejemplo: Contar mundiales en Europa.")
    consulta: str = Field(min_length=1, max_length=6000,
                          description="Objetivo Prolog, sin ?-. Se devuelven sus variables nombradas.")
    limite: int = Field(default=50, ge=1, le=100,
                        description="Máximo de soluciones; no limita los datos usados en agregaciones.")

    @field_validator("consulta", "descripcion")
    @classmethod
    def no_vacia(cls, value):
        if not value.strip():
            raise ValueError("El texto no puede estar vacío")
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
    tipo: Literal["respuesta", "conversacion", "aclaracion", "fuera_alcance", "error"]
    texto: str = Field(min_length=1, max_length=4000)
