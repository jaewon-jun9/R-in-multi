#실습2
hlibrary <-read.csv("지역별장애인도서관정보.csv")
lbmap <- get_map("seoul",maptype="roadmap",zoom=11)

ggmap(lbmap) +
geom_point(data=hlibrary,
           aes(x=hlibrary$LON,
               y=hlibrary$LAT),
               alpha=0.5, size=4, color="red") +
geom_text(data=hlibrary,
          aes(x=hlibrary$LON,
              y=hlibrary$LAT,
              label=hlibrary$도서관명))

ggsave("library.png")
