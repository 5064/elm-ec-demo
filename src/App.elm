module App exposing (main)

import Browser
import Cart
import Html exposing (button, div, h1, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Products



-- Model


type alias Session =
    { products : Products.Products
    , cart : Cart.Cart
    }


type Model
    = Loading
    | LoadedProducts Products.Products
    | LoadedAll Session
    | Purchased Session
