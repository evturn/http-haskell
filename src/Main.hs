{-# LANGUAGE OverloadedStrings #-}

import           Data.Maybe
import qualified Data.Text   as T
import           Web.Firefly

app :: App ()
app = do
  route "/hello" hello
  route "/"      splat

hello :: Handler T.Text
hello = do
  name <- fromMaybe "anonymous client" <$> getQuery "name"
  return $ "Hello " `T.append` name

splat :: Handler T.Text
splat = do
  return $ "Sup " `T.append` "dog."

main :: IO ()
main = run 3000 app
