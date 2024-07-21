{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}

addVectors :: [Int] -> [Int] -> [Int]
addVectors a b
  | null a || null b = []
  | otherwise = ((head a) + (head b)) : (addVectors (tail a) (tail b))

addVectorsPm :: [Int] -> [Int] -> [Int]
addVectorsPm [] _ = []
addVectorsPm _ [] = []
addVectorsPm (x:xs) (y:ys) = (x + y) : (addVectorsPm xs ys)

sumseries :: Int -> Int
sumseries n
  | n == 0 = 0
  | otherwise = n + (sumseries (n - 1))

sumseriesTR_helper :: Int -> Int -> Int
sumseriesTR_helper n res
  | n == 0 = res
  | otherwise = sumseriesTR_helper (n - 1) (n + res)

sumseriesTR :: Int -> Int
sumseriesTR n = sumseriesTR_helper n 0

-- Assuming that list will have at least one element
mymaximum :: (Ord a) => [a] -> a
-- mymaximum [] = error
mymaximum [x] = x
mymaximum (x1:x2:xs)
  | x1 > x2 = mymaximum (x1:xs)
  | otherwise = mymaximum (x2:xs)