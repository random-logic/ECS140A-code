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

-- Referential transparency means that function calls are like mathematical functions and are only affected by the parameters passed in, which means that for a given set of parameters, you are always guaranteed the same output from the same function (no side effects).
-- Functional programming considers referential transparency important because it helps boost programmer productivity and it's also what makes functional programming special over traditional languages. You give up side effects (state) for referential transparency. 
-- Off topic: Functional programming languages also made a huge contribution to traditional languages, called lambda functions.

{-
ChatGPT answer
In the context of functional programming, referential transparency refers to an expression [or function] that can be replaced with its corresponding value without changing the program's behavior, i.e. it always produces the same result given the same input and has no side effects

Benefits of functional programming (from notes)
1. Easier to prove correctness
2. Testing and debugging is easier
3. Elimination of side effects
4. Programs abstracted away
5. Concurrent programming easier
6. Functions as first class objects more concise
7. Less source code
-}
