sumNOdd :: Integer -> Integer
sumNOdd n = foldr ((+) . (+ 1) . (* 2)) 0 [0 .. n - 1]

main :: IO ()
main = print $ sumNOdd 10
