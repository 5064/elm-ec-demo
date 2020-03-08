module App exposing (main)

import Browser
import Cart
import Html exposing (button, div, h1, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Products



-- Model
-- アプリケーションの状態を表現


type alias Session =
    { products : Products.Products
    , cart : Cart.Cart
    }


type Model
    = Loading
    | LoadedProducts Products.Products
    | LoadedAll Session
    | Purchased Session


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, Products.fetch ProductFetched )



-- Update
-- メッセージをもとにアプリケーションの状態（Model）を更新する


type Msg
    = ProductFetched (Result Http.Error Products.Products)
    | AddProductToCart String
    | Purchase
    | BackToProducts
    | CartLoaded Cart.Cart
    | CartLoadingFailed
