install.packages("tidyverse")
library("ggplot2")
library("dplyr")

data = read.csv("HOSE.csv",header=TRUE)
df = data.frame(data)


df <- mutate(df, Ngay = as.Date(Ngay, format = "%d/%m/%Y"))
df<- mutate(df, KL_Mua = as.numeric(gsub("\\.", "", KL_Mua)))
df<- mutate(df, KL_Ban = as.numeric(gsub("\\.", "", KL_Ban)))
df<- mutate(df, GT_Mua = as.numeric(gsub("\\.", "", GT_Mua)))
df<- mutate(df, GT_Ban = as.numeric(gsub("\\.", "", GT_Ban)))

ggplot(data=df,aes(x=Ngay))+
  geom_line(aes(y=KL_Mua,color="KL_Mua"))+
  geom_line(aes(y=KL_Ban,color="KL_Ban"))+
  geom_smooth(mapping = aes(x=Ngay, y=KL_Mua,color="KL_Mua"),linetype = "dashed",size=1.2)+
  geom_smooth(mapping = aes(x=Ngay, y=KL_Ban,color="KL_Ban"),linetype = "dashed",size=1.2)+
  scale_color_manual(values = c("red", "blue"), 
                     labels = c("Khối lượng mua", "Khối lượng bán"))+
  labs(title="Khối lượng giao dịch",x="Ngày", y="Khối lượng")

ggplot(data=df,aes(x=Ngay))+
  geom_line(aes(y=GT_Mua,color="GT_Mua"))+
  geom_line(aes(y=GT_Ban,color="GT_Ban"))+
  geom_smooth(mapping = aes(x=Ngay, y=GT_Mua,color="GT_Mua"),linetype = "dashed",size=1.2)+
  geom_smooth(mapping = aes(x=Ngay, y=GT_Ban,color="GT_Ban"),linetype = "dashed",size=1.2)+
  scale_color_manual(values = c("red", "blue"), 
                     labels = c("Giá trị mua", "Giá trị bán"))+
  labs(title="Giá trị giao dịch",x="Ngày", y="Giá trị")
