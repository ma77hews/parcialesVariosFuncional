import Text.Show.Functions
import Data.Char

type Objeto = Barbaro -> Barbaro
data Barbaro = Barbaro { nombre :: String,
                         fuerza :: Int,
                         habilidades :: [String],
                         objetos :: [Objeto]
                        }deriving Show
dave = Barbaro { nombre = "dave",
                 fuerza = 100,
                 habilidades = ["tejer","escribirPoesia"],
                 objetos = [ardilla]
                }
faffy = Barbaro { nombre = "Faffy",
                 fuerza = 100,
                 habilidades = ["robar","escribir poesia atroz"],
                 objetos = [ardilla]
                }

{-consulta, esta parte del codigo tiene 3 veces logica repetida... como se elimina?-}
modificarFuerza funcion barbaro = barbaro {fuerza = (funcion.fuerza)barbaro}
modificarHabilidades funcion barbaro = barbaro {habilidades = (funcion.habilidades)barbaro}
--modificarObjetos funcion barbaro = barbaro {objetos = (funcion.objetos)barbaro}

espada peso = modificarFuerza (+(2*peso))
amuletoMistico habilidad = modificarHabilidades (++[habilidad])
agregarHacerMagia = amuletoMistico "hacerMagia"
vaciarObjetos barbaro = barbaro{objetos = []}
varitasDefectuosas = agregarHacerMagia.vaciarObjetos
ardilla = id
cuerda primerObjeto segundoObjeto = primerObjeto.segundoObjeto


-- punto 2

concatenarHabilidades barbaro = concat (habilidades barbaro)
concatMayusc barbaro = map toUpper (concatenarHabilidades barbaro)
megafono barbaro = barbaro{habilidades = [concatMayusc barbaro]}
megafonoBarbarico  = cuerda ardilla megafono

-- punto 3 Aventura = [Eventos]

esteViveEsteNo condicion = map condicion
sobrevivientes condicion = (filter (== True)).(esteViveEsteNo condicion)

sabe barbaro = elem "escribir poesia atroz" (habilidades barbaro)
invasionSuciosDuendes = sobrevivientes sabe

noTienePulgares barbaro = (nombre barbaro) == "Faffy" || (nombre barbaro) == "Astro"
cremalleraDelTiempo = sobrevivientes noTienePulgares


sabeRobar barbaro = elem "robar" (habilidades barbaro)
saqueo barbaro = sabeRobar barbaro && ((>80).fuerza)barbaro


gritoDeGuerra barbaro =
