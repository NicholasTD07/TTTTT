c :: String
c = "Curry is awesome"
reverseCurryIsAwesome = concat [ drop 9 c, take 4 $ drop 5 c, take 5 c ]
