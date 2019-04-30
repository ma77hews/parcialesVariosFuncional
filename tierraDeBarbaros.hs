import Text.Show.Functions
import Data.Char

type Objeto = Barbaro -> Barbaro
data Barbaro = Barbaro { nombre :: String,
                         fuerza :: Int,
                         habilidades :: [String]
--                         objetos :: [Objeto]
                        }deriving Show
dave = Barbaro { nombre = "dave",
                 fuerza = 100,
                 habilidades = ["tejer","escribirPoesia"]
--                 objetos = [ardilla, libroPedking]
                }

{-consulta, esta parte del codigo tiene 3 veces logica repetida... como se elimina?-}
modificarFuerza funcion barbaro = barbaro {fuerza = (funcion.fuerza)barbaro}
modificarHabilidades funcion barbaro = barbaro {fuerza = (funcion.fuerza)barbaro}
modificarObjetos funcion barbaro = barbaro {fuerza = (funcion.fuerza)barbaro}

espada peso = modificarFuerza (+(2*peso))
