#실습1
nowsec <- format(Sys.time(),'%S')
type <- ifelse(nowsec<15,"terrain",
               ifelse(nowsec<30,"satellite",
                      ifelse(nowsec<45,"roadmap","hybrid")))
gc <- geocode(enc2utf8('상록구 광덕4로 460'), source="google")
cen <- c(gc$lon,gc$lat)

homemap <- get_googlemap(center = cen,
                         zoom = 12,
                         maptype = type,
                         marker = gc)
ggmap(homemap) + labs(title="유지수의 집", x="위도", y="경도")

ggsave("mymap.png")

