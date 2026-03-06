module Helper exposing (..)

import Browser
import Char
import Html.Events



-- 1. Grados


type GradeStatus
    = Approved
    | Failed
    | Pending


toStatus : Float -> GradeStatus
toStatus n =
    if n < 0 then
        Pending

    else if n >= 7 then
        Approved

    else
        Failed


categoricalGrade : List Float -> List GradeStatus
categoricalGrade calificaciones =
    List.map toStatus calificaciones



-- 2. Aviones


type AirplaneStatus
    = OnTime
    | Boarding
    | Delayed
    | Cancelled


airStatus : AirplaneStatus -> String
airStatus rango =
    case rango of
        Cancelled ->
            "Pedir reembolso"

        Delayed ->
            "Esperar"

        OnTime ->
            "Esperar"

        Boarding ->
            "Buscar boleto"


airplaneScheduleAction : AirplaneStatus -> String
airplaneScheduleAction status =
    airStatus status


airportAction : List AirplaneStatus -> List String
airportAction airplaneScheduleActions =
    List.map airStatus airplaneScheduleActions


type PackageStatus
    = InWarehouse
    | InTransit
    | Delivered
    | Lost


type alias Paquete =
    { id : Int, estado : PackageStatus }


statusMessage : PackageStatus -> String
statusMessage estatus =
    case estatus of
        InWarehouse ->
            "Estamos preparando tu paquete"

        InTransit ->
            "El repartidor va en camino"

        Delivered ->
            "Disfruta tu compra"

        Lost ->
            "Se perdio"


trackPackages : List PackageStatus -> List String
trackPackages paquete =
    List.map statusMessage paquete


getTransitIds : List Paquete -> List Int
getTransitIds lista =
    lista
        |> List.filter (\p -> p.estado == InTransit)
        |> List.map (\p -> p.id)
