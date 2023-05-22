-- Einfache Funktionen
xor :: Bool -> Bool -> Bool
xor True y = not y
xor False y = y

{-
ghci> xor True False
True
ghci> xor True True
False
ghci> xor False True
True
ghci> xor False False
False
-}

-- Rekursive Funktionen
factorial :: (Eq t, Num t) => t -> t
factorial n = if n == 0 then 1 else n * factorial (n - 1)

-- Rekursive Funktionen und Listen

rev1 :: [a] -> [a]
rev1 (l : t) = if null t then [l] else (rev1 t) ++ [l]

rev2 :: [a] -> [a]
rev2 [] = []
rev2 l = last l : rev2 (init l)

swap :: [a] -> a -> [a]
swap x y = (y : x)

rev3 :: Foldable t => t a -> [a]
rev3 l = foldl swap [] l

-- Umgang mit Listen
{-
x = [1,2,3]
x !! 1

ghci> x !! 1
2
ghci> x !! 0
1
ghci> x !! 2
3
ghci> x !! 3
\*** Exception: Prelude.!!: index too large
-}

-- Umgang mit Listen

lastButOne :: [a] -> a
lastButOne l = head (tail (rev1 l))

{-
ghci> lastButOne [1,2,3,4,5]
4
ghci> lastButOne [1,2,3,4]
3
-}

-- Umgang mit Listen: List Comprehensions

len :: Num a => [t] -> a
len l = sum [1 | x <- l]

-- Umgang mit Listen: Listenfunktionen und List Comprehensions
allEven :: (Foldable t, Integral a) => t a -> Bool
allEven l = foldl (\x y -> mod y 2 == 0) True l

{-
ghci> allEven [2,4,6,8,10]
True
ghci> allEven [2,4,6,8,10,11]
False
-}

-- Strings als Listen
contains :: Eq t => t -> [t] -> Bool
contains _ [] = False
contains x (h : t) = h == x || contains x t

isLower :: Char -> Bool
isLower x = contains x alph
  where
    alph = "abcdefghijklmnopqrstuvwxyzäöüß"

isUpper :: Char -> Bool
isUpper x = not (isLower x)

removeSmol :: [Char] -> [Char]
removeSmol l = filter isUpper l

{-
ghci> removeSmol "ABcDe"
"ABD"
-}
