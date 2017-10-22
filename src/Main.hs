{-# LANGUAGE OverloadedStrings #-}

import Web.Firefly
import qualified Data.Text as T
import Data.Maybe

app :: App ()
app = do
  route "/hello" helloHandler
  route "/"      splatHandler

helloHandler :: Handler T.Text
helloHandler = do
  name <- fromMaybe "Stranger" <$> getQuery "name"
  return $ "Hello " `T.append` name

splatHandler :: Handler T.Text
splatHandler = do
  return $ "Sup " `T.append` "dog."

main :: IO ()
main = run 3000 app
