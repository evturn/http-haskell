{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Firefly
import qualified Data.Text as T

app :: App ()
app = do
  route "/hello" helloHandler

helloHandler :: Handler T.Text
helloHander = do
  name <- fromMaybe "Stranger" <$> getQuery "name"
  return $ "Hello " `T.append` name

main :: IO ()
main = run 3000 app
