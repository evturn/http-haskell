{-# LANGUAGE OverloadedStrings #-}

import           Data.Maybe
import qualified Data.Text   as T
import           Web.Firefly

app :: App ()
app = do
  route "/hello" helloHandler
  route "/"      splatHandler

helloHandler :: Handler T.Text
helloHandler = do
  name <- fromMaybe "anonymous client" <$> getQuery "name"
  return $ "Hello " `T.append` name

splatHandler :: Handler T.Text
splatHandler = do
  return $ "Sup " `T.append` "dog."

main :: IO ()
main = run 3000 app
