import Html exposing(program)
import Collage exposing (..)
import Keyboard exposing (..)
import AnimationFrame
import Time exposing (..)
import Window
import Color exposing(blue)
import Element exposing (..)

--shape -> form -> elemnt -> Html
--fill style collage toHtml

type Msg = KeyMsg Key | Tick Time
type Key = KeyUp Int | KeyDown Int

initialModel = { x = 0, vx = 0,
                 y = 0, vy = 0 }
main = program
 { init = (initialModel, Cmd.none),
   view = view,
   subscriptions = subscriptions,
   update = updateWithCommand }

subscriptions model =
    Sub.batch
    [ Keyboard.downs (KeyDown >> KeyMsg)
    , Keyboard.ups (KeyUp >> KeyMsg)
    ]

update msg model =
    case msg of
      Tick time -> tick model
      KeyMsg k -> key k model

updateWithCommand msg model =
  (update msg model, Cmd.none)


view model =
    toHtml(
      collage 500 500 [(
        toForm (image 100 100 "tank.png") )]


        )



key msg model =
    model
        |> case msg of
            KeyDown 37 -> 
            KeyUp   37 -> moveX 0 model

            KeyDown 39 -> moveX -10 model
            KeyUp   39 -> moveX 0 model
