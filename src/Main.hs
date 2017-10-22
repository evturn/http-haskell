{-# LANGUAGE OverloadedStrings #-}

import Web.Firefly
import qualified Data.Text as T
import Data.Maybe

app :: App ()
app = do
  route "/hello" helloHandler

helloHandler :: Handler T.Text
helloHandler = do
  name <- fromMaybe "Stranger" <$> getQuery "name"
  return $ "Hello " `T.append` name

main :: IO ()
main = run 3000 app
