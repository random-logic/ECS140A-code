-- vscode
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use foldl" #-}

{--
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.IO (readFile)
import Data.List (intercalate)
-- import Data.List.Split (splitOn)
import Text.Printf (printf)
--}


-- 1
-- without pattern matching
myremoveduplicates :: (Eq a) => [a] -> [a]
myremoveduplicates lst
  | null lst = []
  | head lst `elem` myremoveduplicates (tail lst) = myremoveduplicates (tail lst)
  | otherwise = head lst : myremoveduplicates (tail lst)

-- with pattern matching
myremoveduplicates_pm :: (Eq a) => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs)
  | x `elem` myremoveduplicates_pm xs = myremoveduplicates_pm xs
  | otherwise = x : myremoveduplicates_pm xs

-- 2
-- without pattern matching
myintersection :: (Eq a) => [a] -> [a] -> [a]
myintersection l1 l2
  | null l1 || null l2 = []
  | head l1 `elem` l2 = head l1 : myintersection (tail l1) l2
  | otherwise = myintersection (tail l1) l2

-- with pattern matching
myintersection_pm :: (Eq a) => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm _ [] = []
myintersection_pm (x:xs) l2
  | x `elem` l2 = x : myintersection_pm xs l2
  | otherwise = myintersection_pm xs l2

-- 3
-- without pattern matching
mynthtail :: Int -> [a] -> [a]
mynthtail n lst
  | n == 0 = lst
  | otherwise = mynthtail (n - 1) (tail lst)

-- with pattern matching
mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 lst = lst
mynthtail_pm n lst = mynthtail_pm (n - 1) (tail lst)

-- 4
-- without pattern matching
mylast :: [a] -> [a]
mylast lst
  | null lst = []
  | null (tail lst) = [head lst]
  | otherwise = mylast (tail lst)

-- with pattern matching
mylast_pm :: [a] -> [a]
mylast_pm [] = []
mylast_pm [x] = [x]
mylast_pm (_:xs) = mylast_pm xs

-- 5
-- without pattern matching
reversehelper :: [a] -> [a] -> [a]
reversehelper l1 l2
  | null l1 = l2
  | otherwise = reversehelper (tail l1) (head l1 : l2)

myreverse :: [a] -> [a]
myreverse lst = reversehelper lst []

-- with pattern matching
reversehelper_pm :: [a] -> [a] -> [a]
reversehelper_pm [] l2 = l2
reversehelper_pm (x:xs) l2 = reversehelper_pm xs (x:l2)

myreverse_pm :: [a] -> [a]
myreverse_pm lst = reversehelper_pm lst []

-- 6
-- without pattern matching
myreplaceall :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall x y lst
  | null lst = []
  | head lst == x = y : myreplaceall x y (tail lst)
  | otherwise = head lst : myreplaceall x y (tail lst)

-- with pattern matching
myreplaceall_pm :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm a b (x:xs)
  | x == a = b : myreplaceall_pm a b xs
  | otherwise = x : myreplaceall_pm a b xs

-- 7
-- without pattern matching
myorderedhelper :: (Ord a) => [a] -> a -> Bool
myorderedhelper lst x
  | null lst = True
  | head lst >= x = myorderedhelper (tail lst) (head lst)
  | otherwise = False

myordered :: (Ord a) => [a] -> Bool
myordered lst
  | null lst = True
  | otherwise = myorderedhelper (tail lst) (head lst)

-- with pattern matching
myorderedhelper_pm :: (Ord a) => [a] -> a -> Bool
myorderedhelper_pm [] _ = True
myorderedhelper_pm (x:xs) a
  | x >= a = myorderedhelper_pm xs x
  | otherwise = False

-- 8
-- no restriction

{--
-- Define the data structures
data Study = CS | EE | CE | ME | Unknown deriving (Eq, Show, Read)

data AcademicStanding = Freshman | Sophomore | Junior | Senior | UnknownStanding deriving (Eq, Show, Read)

data Student
  = DegreeSeekingStudent
      { id :: Int,
        firstName :: String,
        lastName :: String,
        age :: Int,
        credits :: Int,
        major :: Study,
        standing :: AcademicStanding
      }
  | StudentWithFinancialAid
      { id :: Int,
        firstName :: String,
        lastName :: String,
        age :: Int,
        credits :: Int,
        major :: Study,
        standing :: AcademicStanding,
        financialAid :: Double
      }
  | CertificateStudent
      { id :: Int,
        firstName :: String,
        lastName :: String,
        age :: Int,
        credits :: Int,
        certificate :: Study
      }
  | SeniorCitizen
      { id :: Int,
        firstName :: String,
        lastName :: String,
        age :: Int,
        credits :: Int
      }
  deriving (Eq, Show)

-- Helper functions to interpret input
interpretStudy :: String -> Study
interpretStudy "CS" = CS
interpretStudy "EE" = EE
interpretStudy "CE" = CE
interpretStudy "ME" = ME
interpretStudy _    = Unknown

interpretStanding :: String -> AcademicStanding
interpretStanding "Freshman" = Freshman
interpretStanding "Sophomore" = Sophomore
interpretStanding "Junior" = Junior
interpretStanding "Senior" = Senior
interpretStanding _         = UnknownStanding

-- Fee calculation based on student type
calculateFee :: Student -> Double
calculateFee (DegreeSeekingStudent _ _ _ _ credits _ _) = fromIntegral credits * 300
calculateFee (StudentWithFinancialAid _ _ _ _ credits _ _ financialAid) = (fromIntegral credits * 300) - financialAid
calculateFee (CertificateStudent _ _ _ _ credits _) = fromIntegral credits * 200
calculateFee (SeniorCitizen _ _ _ _ _) = 0

-- Read and parse the file
parseFile :: String -> IO [Student]
parseFile filename = do
  content <- readFile filename
  let linesOfFile = lines content
  return (map parseLine linesOfFile)

parseLine :: String -> Student
parseLine line =
  let [idStr, firstName, lastName, ageStr, creditsStr, isFullTimeStr, extra1, extra2, extra3] = splitOn ";" line
      id = read idStr
      age = read ageStr
      credits = read creditsStr
      isFullTime = isFullTimeStr == "Y"
  in if isFullTime
     then let major = interpretStudy extra1
              standing = interpretStanding extra2
              receivesFinancialAid = extra3 == "Y"
          in if receivesFinancialAid
             then let financialAid = read (splitOn ";" line !! 9)
                  in StudentWithFinancialAid id firstName lastName age credits major standing financialAid
             else DegreeSeekingStudent id firstName lastName age credits major standing
     else if extra1 == "C"
          then CertificateStudent id firstName lastName age credits (interpretStudy extra2)
          else if extra1 == "S"
               then SeniorCitizen id firstName lastName age credits
               else error "Invalid data"

-- Generate the report
generateReport :: IO String
generateReport = do
  students <- parseFile "hw2.txt"
  let reportBuilder = concat
        [ "Summary of each student's fees assessed: \n\n"
        , intercalate "\n" (map studentReport students)
        , "\n\nSummary of all student fees assessed: \n\n"
        , summaryReport students
        ]
  return reportBuilder

studentReport :: Student -> String
studentReport student = 
  let name = firstName student ++ " " ++ lastName student
      fee = calculateFee student
  in name ++ " has $" ++ printf "%,d" (round fee :: Int) ++ " fees assessed"

summaryReport :: [Student] -> String
summaryReport students =
  let (degreeNoFin, degreeFin, cert, senior, total) = foldr accumulate (0, 0, 0, 0, 0) students
  in concat
     [ "Degree-seeking students without financial assistance: $" ++ printf "%,d" (round degreeNoFin :: Int) ++ "\n"
     , "Degree-seeking students with financial assistance: $" ++ printf "%,d" (round degreeFin :: Int) ++ "\n"
     , "Certificate students: $" ++ printf "%,d" (round cert :: Int) ++ "\n"
     , "Senior citizens: $" ++ printf "%,d" (round senior :: Int) ++ "\n\n"
     , "Total fees assessed: $" ++ printf "%,d" (round total :: Int)
     ]

accumulate :: Student -> (Double, Double, Double, Double, Double) -> (Double, Double, Double, Double, Double)
accumulate student (degreeNoFin, degreeFin, cert, senior, total) =
  let fee = calculateFee student
  in case student of
       DegreeSeekingStudent{} -> (degreeNoFin + fee, degreeFin, cert, senior, total + fee)
       StudentWithFinancialAid{} -> (degreeNoFin, degreeFin + fee, cert, senior, total + fee)
       CertificateStudent{} -> (degreeNoFin, degreeFin, cert + fee, senior, total + fee)
       SeniorCitizen{} -> (degreeNoFin, degreeFin, cert, senior + fee, total + fee)

main :: IO ()
main = do
  report <- generateReport
  putStrLn report
--}