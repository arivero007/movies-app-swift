# movies-app-swift
TMDB movies listing app

Se trata de una aplicación que muestra una lista actualizada de las peliculas más populares contenidas en la base de datos de TMDB.
La carga de peliculas se hace de forma progresiva mediante paginación para no perjudicar a la experiencia de usuario.

Se ha implementado una arquitectura MVVM + Coordinador para mejorar la escalabilidad del proyecto y facilitar el flujo entre vistas.

Se ha trabajado casi todo en la rama develop a excepción de los teses que se han generado en otra rama aparte. Finalemntese ha mergeado todo a la main.

El proyecto incluye también teses unitarios.

Librerías de terceros:

  * Alamofire
  * SDWebImage
  
Para la solicitud de datos se hace uso de la librería "Alamofire".
La carga de los carteles de las peliculas se gestionan con la librería "SDWebImage", que permite almacenar en cache todas las imágenes ya procesadas.

## CAPTURAS

<a href="url"><img src="https://github.com/arivero007/movies-app-swift/blob/main/movieList.png" align="left" width="400" ></a>
<a href="url"><img src="https://github.com/arivero007/movies-app-swift/blob/main/movieDetail.png" align="left" width="400" ></a>
