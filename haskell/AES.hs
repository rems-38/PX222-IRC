{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

module AES where

import Cipher
import InvCipher
import Data.Char (ord, intToDigit, chr, digitToInt)


-----------------------------------------------------------------
---------------------------- Parser -----------------------------
-----------------------------------------------------------------
stringHex :: String -> Block
stringHex = map (hexPol . decToHex . ord)

hexString :: Block -> String
hexString = map (chr . hexToDec . polHex)

decToHex :: Int -> String
decToHex 0 = "0"
decToHex n = reverse (hexChars n)
   where
      hexChars 0 = ""
      hexChars x = intToDigit (x `mod` 16) : hexChars (x `div` 16)

hexToDec :: String -> Int
hexToDec = foldl (\acc x -> acc * 16 + digitToInt x) 0
-----------------------------------------------------------------



-----------------------------------------------------------------
---------------------------- Encode -----------------------------
-----------------------------------------------------------------
-- Pour la clé : utiliser une string héxadécimale sans espaces
-- Ex : "2b7e151628aed2a6abf7158809cf4f3c" (pour du 128 bits)
encode :: String -> String -> String
encode _ [] = ""
encode key msg | length msg `mod` 16 == 0 = hexString (cipher n (take 16 (stringHex msg)) (toBlock $ space key)) ++ encode key (drop 16 msg)
               | otherwise = encode key (msg ++ [' '])
               where n = length (toBlock $ space key) * 8

space :: String -> String
space [] = []
space [x] = [x]
space (x:y:xs) = x:y:' ':space xs
-----------------------------------------------------------------



-----------------------------------------------------------------
---------------------------- Decode -----------------------------
-----------------------------------------------------------------
decode :: String -> String -> String
decode _ [] = ""
decode key msg = removeEndSpace (hexString (invCipher n (take 16 (stringHex msg)) (toBlock $ space key)) ++ decode key (drop 16 msg))
                   where n = length (toBlock $ space key) * 8
                         removeEndSpace x = reverse $ dropWhile (== ' ') $ reverse x
-----------------------------------------------------------------