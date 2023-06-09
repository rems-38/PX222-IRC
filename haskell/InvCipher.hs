{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

module InvCipher where

import Structure_algebrique
import Math_preliminaries
import Cipher


-----------------------------------------------------------------
------------------------- InvCipher -----------------------------
-----------------------------------------------------------------
invCipher :: Int -> Block -> Block -> Block
invCipher n input word = aux (addRoundKey input (last16 (keyExpansion word nk nr))) (tail16 (keyExpansion word nk nr)) nr
                       where (nk, nr) | n == 128 = (4, 10)
                                      | n == 192 = (6, 12)
                                      | n == 256 = (8, 14)
                                      | otherwise = error "Chiffrements possible : AES-128, AES-192, AES-256"
                             aux input word nr | nr == 1 = addRoundKey (invSubBytes $ invShiftRows input) (last16 word)
                                               | otherwise = aux (invMixColumns (addRoundKey (invSubBytes $ invShiftRows input) (last16 word))) (tail16 word) (nr - 1)

last16 :: Block -> Block
last16 b= drop (length b - 16) b

tail16 :: Block -> Block
tail16 b = take (length b - 16) b
-----------------------------------------------------------------



-----------------------------------------------------------------
------------------------- invShiftRows --------------------------
-----------------------------------------------------------------
invShiftRows :: Block -> Block
invShiftRows b = shiftRows_aux b 4 0 (-1)
-----------------------------------------------------------------



-----------------------------------------------------------------
-------------------------- invSubByes ---------------------------
-----------------------------------------------------------------
invSubBytes :: Block -> Block
invSubBytes b = subBytes_aux b invSBox

-- InvSbox donnée dans le FIPS 197
invSBox :: [[String]]
invSBox = [["52","7c","54","08","72","6c","90","d0","3a","96","47","fc","1f","60","a0","17"],
           ["09","e3","7b","2e","f8","70","d8","2c","91","ac","f1","56","dd","51","e0","2b"],
           ["6a","39","94","a1","f6","48","ab","1e","11","74","1a","3e","a8","7f","3b","04"],
           ["d5","82","32","66","64","50","00","8f","41","22","71","4b","33","a9","4d","7e"],
           ["30","9b","a6","28","86","fd","8c","ca","4f","e7","1d","c6","88","19","ae","ba"],
           ["36","2f","c2","d9","68","ed","bc","3f","67","ad","29","d2","07","b5","2a","77"],
           ["a5","ff","23","24","98","b9","d3","0f","dc","35","c5","79","c7","4a","f5","d6"],
           ["38","87","3d","b2","16","da","0a","02","ea","85","89","20","31","0d","b0","26"],
           ["bf","34","ee","76","d4","5e","f7","c1","97","e2","6f","9a","b1","2d","c8","e1"],
           ["40","8e","4c","5b","a4","15","e4","af","f2","f9","b7","db","12","e5","eb","69"],
           ["a3","43","95","a2","5c","46","58","bd","cf","37","62","c0","10","7a","bb","14"],
           ["9e","44","0b","49","cc","57","05","03","ce","e8","0e","fe","59","9f","3c","63"],
           ["81","c4","42","6d","5d","a7","b8","01","f0","1c","aa","78","27","93","83","55"],
           ["f3","de","fa","8b","65","8d","b3","13","b4","75","18","cd","80","c9","53","21"],
           ["d7","e9","c3","d1","b6","9d","45","8a","e6","df","be","5a","ec","9c","99","0c"],
           ["fb","cb","4e","25","92","84","06","6b","73","6e","1b","f4","5f","ef","61","7d"]]
-----------------------------------------------------------------



-----------------------------------------------------------------
------------------------- invMixColumns -------------------------
-----------------------------------------------------------------
invMixColumns :: Block -> Block
invMixColumns b = mixColumns_aux b a_x_invMixColumns

a_x_invMixColumns :: Block
a_x_invMixColumns = toBlock "0e 0b 0d 09"
-----------------------------------------------------------------