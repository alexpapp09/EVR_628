#loaded packages
library(EVR628tools)
library(tidyverse)

data(data_lionfish)
glimpse(data_lionfish)
ggplot(data = data_lionfish)
ggplot(data=data_lionfish, 
       mapping= aes(x=depth_m, y = total_length_mm)) + 
  geom_point(shape = 21,
              fill = "purple",
              size = 2) +
  labs(x = "Depth (m)",
       y = "Total weight (gr)",
       title = "Body length and depth",
       subtitle = "Larger fish tend to live deeper",
       caption = "Source EVR628tools::data_lionfish")

# Making a bar plot with site

ggplot(data=data_lionfish, aes(x=site)) +
  geom_bar(data=data_lionfish) +
  coord_flip() +
  labs (x="Site", y="Number of Citings")

#Practicing with Histograms
ggplot(data=data_lionfish, aes(x=total_length_mm))+
  geom_histogram(data=data_lionfish, bins=15, fill="blue")+
  labs(x="Total Length (mm)", y="Count")

#Box Plots
ggplot(data=data_lionfish, aes(x=size_class, y=depth_m))+
  geom_boxplot(data=data_lionfish)+
  labs(x="Size Class", y="Depth(m)")

# Two categorical variables
ggplot(data = data_lionfish, aes(x = site, y = size_class)) +
  geom_bin2d() +
  coord_flip() +
  labs(x = "Site", y = "Number of fish", fill = "Size class")

#With 3 categorical variables
ggplot(data = data_lionfish, 
       aes(x= depth_m, y= total_length_mm, 
           size=total_weight_gr, color=temperature_C)) +
       geom_point() + 
  scale_size_continuous (range=c(1,5)) +
  labs(x="depth (m)", y="Total Length (mm)", size="Weight (gr)", color = "Temperature (ºC)") +
  scale_color_gradientn(colors=palette_IPCC(var="temp", type="seq"))
  
  #With 3 categorical variables
  ggplot(data = data_lionfish, 
         aes(x= depth_m, y= total_length_mm, 
             size=total_weight_gr, color=temperature_C)) +
    geom_point() + 
    scale_size_continuous (range=c(1,5)) +
    labs(x="depth (m)", y="Total Length (mm)", size="Weight (gr)", color = "Temperature (ºC)") +
    scale_color_gradient2(low= "green", mid="black", high="orange", midpoint=29) 

  #discrete scale coloring
r<-ggplot (data = data_milton, 
              aes(x=iso_time, y=pressure, color=sshs)) +
    geom_point() +
   scale_color_manual(values=palette_UM(n=10))
r

 #Manual color scale for discrete variables
p<- ggplot(data = data_lionfish, aes(x = site, fill = size_class)) +
   geom_bar(position="dodge") +
   scale_fill_manual(values = c("small" = "lightblue", "medium" = "blue", "large" = "darkblue")) +
   labs(x = "Site", y = "Number of fish", fill = "Size class")
 p
#save this plot to file
 ggsave("lionfish_site_sizeclass.png", p, width = 10, height=10, dpi=300)
 
 # Using facet wrap
 ggplot(data = data_lionfish, aes(x = depth_m, y = total_length_mm)) +
   geom_point() +
   facet_wrap(~size_class, ncol = 3) +
   labs(x = "Depth (m)", y = "Total length (mm)")+

#Making a Grid   
ggplot(data = data_lionfish, aes(x = depth_m, y = total_length_mm)) +
geom_point() +
facet_grid(size_class~site) +
labs(x = "Depth (m)", y = "Total length (mm)")
 
#Facet Wrap w/ different scales for each column, easier to compare distributions
 ggplot(data = data_lionfish, aes(x = depth_m, y = total_length_mm)) +
   geom_point() +
   facet_grid(size_class~site, ncol=3, scales="free_y") +
   labs(x = "Depth (m)", y = "Total length (mm)")
 
 
 
 
   
   
                  
 