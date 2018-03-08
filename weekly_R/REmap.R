install.packages("devtools")

devtools::install_github("lchiffon/REmap") 

library(REmap)

remap(mapdata, title = " ", 
      
      subtitle = "", 
      
      theme = get_theme("Dark"))


get_theme(theme = "Dark",
          
          lineColor = "Random",
          
          backgroundColor = "#1b1b1b",
          
          titleColor = "fff",
          
          borderColor = "rgba(100,149,237,1)",
          
          regionColor = "#1b1b1b",
          
          labelShow = T,
          
          pointShow = F,
          
          pointColor = "gold")



destination<-  rep("安庆") #终点

origin<- c("乌鲁木齐","齐齐哈尔","呵呵浩特","拉萨","兰州","宁夏","海南","台湾","厦门","成都","亳州","南京","阜阳","蚌埠","东营","四平","深圳","江门","北京","池州","滁州","六安",length(destination))          #起点


#合成数据框格式的起终点数据

map_data<- data.frame(origin,destination)     

head(map_data)
map_out<-remap(mapdata=map_data,   #流向地图的数据源（依次为起点、重点两列）
               
               title="祝左静王影新婚快乐",  col.main="red",        #设置主标题
               
               subtitle="宜人宜家、早生贵子、白头偕老",    #设置副标题
               
               theme =get_theme(theme="Bright")) #设置主题（默认主题一共有三套：“Dark”,“Bright,”Sky“）
plot(map_out)



origin<- c("beijing","tianjin","nanjing","hefei","chengdu")    #终点


destination<- rep("tianjing",length(destination))        #起点
map_data<- data.frame(origin,destination)     
map_out<-remap(mapdata=map_data,   #流向地图的数据源（依次为起点、重点两列）
               
               title="我是标题",         #设置主标题
               
               subtitle="我是副标题",    #设置副标题
               
               theme =get_theme(theme="Bright")) #设置主题（默认主题一共有三套：“Dark”,“Bright,"Bright"）



map_out3<-remap(mapdata=map_data,     #设计流向地图
                
                title="我是标题",                    #设置标题
                
                subtitle="我是副标题",               #设置副标题
                
                theme=get_theme(theme="none",        #设置主题     
                                
                                lineColor="blue",                    #设置线条颜色
                                
                                backgroundColor="white",             #设置背景颜色
                                
                                titleColor="red",                  #设置标题颜色
                                
                                borderColor="red",                  #设置地区边界颜色
                                
                                regionColor="SandyBrown")            #设置地区颜色
                
)

plot(map_out3)



origin<- c("tianjing","nanjing","hefei","bozhou")     #起点

destination<- c(origin[-1],origin[1])     #终点

map_data1<- data.frame(origin,destination)       #合成数据框格式的起终点数据

map_out1<- remap(mapdata = map_data1,        #详细设计行程地图
                 
                 title = "周运来春节行程地图",
                 
                 subtitle = "三个家",
                 
                 theme = get_theme(theme = "Sky")
                 
)

plot(map_out1)      #在web上展示图形


geo_data <- get_geo_position(unique(union(destination,origin)))  

map_out5 <- remapB(zoom=5,
                   
                   color = "Blue",
                   
                   title = "心型行程图",
                   
                   subtitle = "爱心哦",
                   
                   markLineData = map_data1,
                   
                   markPointData = map_data1[,2],
                   
                   markLineTheme = markLineControl(symbol = NA,
                                                   
                                                   symbolSize = c(0,4),
                                                   
                                                   smooth = T,
                                                   
                                                   smoothness = 0.2,
                                                   
                                                   effect = T,
                                                   
                                                   lineWidth = 2,
                                                   
                                                   lineType = "dotted",
                                                   
                                                   color = "Random"),
                   
                   markPointTheme = markPointControl(symbol = "heart",
                                                     
                                                     symbolSize = "Random",
                                                     
                                                     effect = T,
                                                     
                                                     effectType = "scale",
                                                     
                                                     color = "Random"),
                   
                   geoData = geo_data)

plot(map_out5)



cities <- mapNames("anhui")
cities
city_Geo <- get_geo_position(cities)
cities
city_Geo
percent <- runif(17,min=0.25,max = 0.9)
data_all <- data.frame(city_Geo[,1:2],percent)
result <- remapH(data_all,
                 maptype = "anhui",
                 theme = get_theme("Dark"),
                 blurSize = 35,
                 color = "red",
                 minAlpha = 10,
                 opacity = 1)
plot(result)

