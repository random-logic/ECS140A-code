-- vscode
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use foldl" #-}

import Text.Read (readMaybe)

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
myreplaceall y x lst
  | null lst = []
  | head lst == x = y : myreplaceall x y (tail lst)
  | otherwise = head lst : myreplaceall x y (tail lst)

-- with pattern matching
myreplaceall_pm :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm b a (x:xs)
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

myordered_pm :: (Ord a) => [a] -> Bool
myordered_pm [] = True
myordered_pm lst = myorderedhelper (tail lst) (head lst)

-- 8
-- helpers
splitOn :: Char -> String -> [String]
splitOn _ [] = [""]
splitOn delimiter (c:cs)
    | c == delimiter = "" : rest
    | otherwise = (c : head rest) : tail rest
    where
        rest = splitOn delimiter cs

stringToDouble :: String -> Double
stringToDouble s = case reads s :: [(Double, String)] of
    [(n, "")] -> n
    _         -> error "Invalid input"

-- degree student
recAndAthleticsFee :: Double
recAndAthleticsFee = 100

studentUnionFee :: Double
studentUnionFee = 50

costPerCreditForDegreeStudent :: Double
costPerCreditForDegreeStudent = 275

maxCreditsForDegreeStudent :: Double
maxCreditsForDegreeStudent = 12

computeFeesForStudentWithAid :: [String] -> Double
computeFeesForStudentWithAid [credits, aid] = computeFeesForDegreeStudent [credits] - stringToDouble aid

computeFeesForDegreeStudent :: [String] -> Double
computeFeesForDegreeStudent [credits]
  | stringToDouble credits >= maxCreditsForDegreeStudent = recAndAthleticsFee + studentUnionFee + costPerCreditForDegreeStudent * maxCreditsForDegreeStudent
  | otherwise = recAndAthleticsFee + studentUnionFee + costPerCreditForDegreeStudent * stringToDouble credits
computeFeesForDegreeStudent (credits:_:_:hasFinancialAid:xs)
  | hasFinancialAid == "Y" = computeFeesForStudentWithAid (credits:xs)
  | otherwise = computeFeesForDegreeStudent [credits]

-- non degree student
fixedFeeForCertificateStudent :: Double
fixedFeeForCertificateStudent = 700

costPerCreditForCertificateStudent :: Double
costPerCreditForCertificateStudent = 300

computeFeesForCertificateStudent :: [String] -> Double
computeFeesForCertificateStudent [credits] = fixedFeeForCertificateStudent + costPerCreditForCertificateStudent * stringToDouble credits

fixedFeeForSeniorStudents :: Double
fixedFeeForSeniorStudents = 100

creditsIncludedForSeniorStudents :: Double
creditsIncludedForSeniorStudents = 6

additionalFeePerCreditForSeniorStudents :: Double
additionalFeePerCreditForSeniorStudents = 50

computeFeesForSeniorStudent :: [String] -> Double
computeFeesForSeniorStudent [credits]
  | stringToDouble credits <= creditsIncludedForSeniorStudents = fixedFeeForSeniorStudents
  | otherwise = fixedFeeForSeniorStudents + (stringToDouble credits - creditsIncludedForSeniorStudents) * additionalFeePerCreditForSeniorStudents

computeFeesForNonDegreeStudent :: [String] -> Double
computeFeesForNonDegreeStudent (credits:certificateOrSenior:_)
  | certificateOrSenior == "C" = computeFeesForCertificateStudent [credits]
  | otherwise = computeFeesForSeniorStudent [credits]

computeFeesFromData :: [String] -> Double
computeFeesFromData (_:_:_:_:credits:isDegreeStudent:xs)
  | isDegreeStudent == "Y" = computeFeesForDegreeStudent (credits:xs)
  | otherwise = computeFeesForNonDegreeStudent (credits:xs)

-- function to implement
computeFees :: String -> Double
computeFees input = computeFeesFromData (splitOn ';' input)