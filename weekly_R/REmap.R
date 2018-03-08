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



destination<-  rep("����") #�յ�

origin<- c("��³ľ��","�������","�ǺǺ���","����","����","����","����","̨��","����","�ɶ�","����","�Ͼ�","����","����","��Ӫ","��ƽ","����","����","����","����","����","����",length(destination))          #���


#�ϳ����ݿ��ʽ�����յ�����

map_data<- data.frame(origin,destination)     

head(map_data)
map_out<-remap(mapdata=map_data,   #�����ͼ������Դ������Ϊ��㡢�ص����У�
               
               title="ף����Ӱ�»����",  col.main="red",        #����������
               
               subtitle="�����˼ҡ��������ӡ���ͷ����",    #���ø�����
               
               theme =get_theme(theme="Bright")) #�������⣨Ĭ������һ�������ף���Dark��,��Bright,��Sky����
plot(map_out)



origin<- c("beijing","tianjin","nanjing","hefei","chengdu")    #�յ�


destination<- rep("tianjing",length(destination))        #���
map_data<- data.frame(origin,destination)     
map_out<-remap(mapdata=map_data,   #�����ͼ������Դ������Ϊ��㡢�ص����У�
               
               title="���Ǳ���",         #����������
               
               subtitle="���Ǹ�����",    #���ø�����
               
               theme =get_theme(theme="Bright")) #�������⣨Ĭ������һ�������ף���Dark��,��Bright,"Bright"��



map_out3<-remap(mapdata=map_data,     #��������ͼ
                
                title="���Ǳ���",                    #���ñ���
                
                subtitle="���Ǹ�����",               #���ø�����
                
                theme=get_theme(theme="none",        #��������     
                                
                                lineColor="blue",                    #����������ɫ
                                
                                backgroundColor="white",             #���ñ�����ɫ
                                
                                titleColor="red",                  #���ñ�����ɫ
                                
                                borderColor="red",                  #���õ����߽���ɫ
                                
                                regionColor="SandyBrown")            #���õ�����ɫ
                
)

plot(map_out3)



origin<- c("tianjing","nanjing","hefei","bozhou")     #���

destination<- c(origin[-1],origin[1])     #�յ�

map_data1<- data.frame(origin,destination)       #�ϳ����ݿ��ʽ�����յ�����

map_out1<- remap(mapdata = map_data1,        #��ϸ����г̵�ͼ
                 
                 title = "�����������г̵�ͼ",
                 
                 subtitle = "������",
                 
                 theme = get_theme(theme = "Sky")
                 
)

plot(map_out1)      #��web��չʾͼ��


geo_data <- get_geo_position(unique(union(destination,origin)))  

map_out5 <- remapB(zoom=5,
                   
                   color = "Blue",
                   
                   title = "�����г�ͼ",
                   
                   subtitle = "����Ŷ",
                   
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
