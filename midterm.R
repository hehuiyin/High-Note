library(dplyr)
library(ggplot2)
library(psych)
library(wesanderson)
library(gridExtra)
library(MatchIt)

data=read.csv('HighNote Data Midterm.csv')
# Q1. Statistics ####
  #statistics
stat_summary=describeBy(data, data$adopter)
stat_summary

data_col=colnames(data)[2:ncol(data)]
stat=data%>%
  group_by(adopter) %>%
  select(one_of(data_col)) %>%
  summarise_all(funs(mean(.,na.rm = T),
                     sd(.,na.rm=T),
                     max(.,na.rm = T),
                     min(.,na.rm = T)))
stat

#t-test
var=c("age","male","friend_cnt","avg_friend_age","avg_friend_male",
      "friend_country_cnt","subscriber_friend_cnt","songsListened",
      "lovedTracks","posts", "playlists","shouts",
      "tenure","good_country")
lapply(data[,var],function(v){t.test(v~data$adopter)})

# Q2. Visuals####
  #to draw graphs
data_g=data
data_g$adopter=as.character(data_g$adopter)
stat$adopter=as.character(stat$adopter)
  
#(i). Demographics ####
#age
ggplot(data_g,aes(x=age,group=adopter,fill=adopter))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="Age")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  geom_vline(data = stat, aes(xintercept = age_mean, colour = adopter),
             linetype = "longdash", size=1)+
  theme_bw()

#male
p1=ggplot(data_g, aes(x=adopter, y = male, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="male")

#good_country
p2=ggplot(data_g, aes(x=adopter, y = good_country, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="good_country")

#Combined: male+good_country
grid.arrange(p1, p2,nrow = 2)

  #(ii). Peer influence ####
#friend_cnt
ggplot(data_g, aes(x=age, y=friend_cnt, col=adopter))+
  labs(title="friend_cnt")+
  scale_color_manual(values=wes_palette(name="Chevalier1"))+
  geom_point(alpha=0.5)+
  geom_hline(data = stat, aes(yintercept = friend_cnt_mean, colour = adopter),
             linetype = "longdash", size=1)

#avg_friend_age
ggplot(data_g,aes(x=avg_friend_age,group=adopter,fill=adopter))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="avg_friend_age")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  geom_vline(data = stat, aes(xintercept = avg_friend_age_mean, colour = adopter),
             linetype = "longdash", size=1)+
  theme_bw()

#avg_friend_male
p3=ggplot(data_g, aes(x=adopter, y = avg_friend_male, fill = adopter))+ 
  geom_bar(stat = 'summary', fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="avg_friend_male")

#friend_country_cnt
p4=ggplot(data_g, aes(x=adopter, y = friend_country_cnt, fill = adopter))+ 
  geom_bar(stat = 'summary', fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="friend_country_cnt")

#Combined: avg_friend_male+friend_country_cnt
grid.arrange(p3,p4,nrow=2)

#subscriber_friend_cnt
ggplot(data_g, aes(x=age, y=subscriber_friend_cnt, col=adopter))+
  labs(title="Subscriber friends")+
  scale_color_manual(values=wes_palette(name="Chevalier1"))+
  geom_point(alpha=0.3)+
  geom_hline(data = stat, aes(yintercept = subscriber_friend_cnt_mean, 
                              colour = adopter),
             linetype = "longdash", size=1)

  #(iii). User engagement####
#songsListened
p5=ggplot(data_g, aes(x=adopter, y = songsListened, fill = adopter))+ 
  geom_bar(stat = 'summary', fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="songsListened")

#lovedTracks
p6=ggplot(data_g, aes(x=adopter, y = lovedTracks, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="lovedTracks")

#posts
p7=ggplot(data_g, aes(x=adopter, y = posts, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="posts")

#playlists
p8=ggplot(data_g, aes(x=adopter, y = playlists, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="playlists")

#shouts
p9=ggplot(data_g, aes(x=adopter, y = shouts, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="shouts")

#tenure
p10=ggplot(data_g, aes(x=adopter, y = tenure, fill = adopter))+ 
  geom_bar(stat = 'summary',fun=mean)+
  xlab("adopter")+
  scale_fill_manual(values=wes_palette(name="Chevalier1"))+
  labs(title="tenure")

ggplot(data_g, aes(x=age, y=tenure, col=adopter))+
  labs(title="tenure")+
  scale_color_manual(values=wes_palette(name="Chevalier1"))+
  geom_point(alpha=0.5)+
  geom_hline(data = stat, aes(yintercept = tenure_mean, colour = adopter),
             linetype = "longdash", size=1)
  

#Combined:
grid.arrange(p5,p6,p7,p8,p9,p10,nrow=2)

# Q3.PSM####
  #control & treatment group
data$treatment=ifelse(data$subscriber_friend_cnt>=1,1,0)

#step 1. Pre-analysis using non-matched data ####
  ##1.1 Difference-in-means:outcome variables ####
t.test(data$adopter~data$treatment)
#means are different and that's why matching is needed to balance the data

  ##1.2 Difference-in-means: covariates ####
#the independent variables
var=c("age","male","friend_cnt","avg_friend_age","avg_friend_male",
      "friend_country_cnt","songsListened",
      "lovedTracks","posts", "playlists","shouts",
      "tenure","good_country")

#the difference in means
data%>%
  group_by(treatment) %>%
  select(one_of(var)) %>%
  summarise_all(funs(mean(.,na.rm = T))) #different means

#t-test to the significance
lapply(data[,var],function(v1){t.test(v1~data$treatment)})

#t-test table
test1 = NULL
for (i in 1:13){
  variable = var[i]
  p_value = t.test(data[, var[i]] ~ data$treatment)$p.value
  test1 <- rbind(test1, data.frame(variable, p_value))
}
test1 #result shows male is not significantly different in two group 

#step 2. Propensity score estimation ####
#look at the distribution of the continuous variables 
g1=ggplot(data_g,aes(x=age))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="Age")
g2=ggplot(data_g,aes(x=friend_cnt))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="friend_cnt")
g3=ggplot(data_g,aes(x=avg_friend_age))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="avg_friend_age")
g4=ggplot(data_g,aes(x=friend_country_cnt))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="friend_country_cnt")
g5=ggplot(data_g,aes(x=songsListened))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1000)+
  labs(title="songsListened")
g6=ggplot(data_g,aes(x=lovedTracks))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=100)+
  labs(title="lovedTracks")
g7=ggplot(data_g,aes(x=posts))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=100)+
  labs(title="posts")
g8=ggplot(data_g,aes(x=playlists))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=1)+
  labs(title="playlists")
g9=ggplot(data_g,aes(x=shouts))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=100)+
  labs(title="shouts")
g10=ggplot(data_g,aes(x=tenure))+
  geom_histogram(position="stack",colour='grey',alpha=3,binwidth=10)+
  labs(title="tenure")
grid.arrange(g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,nrow=5)
#friend_cnt, firend_country_cnt, songsListened, lovedTracks, 
#posts, playlists, shouts are right skewed so log them

#logistic regression
ps=glm(treatment~age +male+log(1+friend_cnt)+avg_friend_age+
         avg_friend_male+log(1+friend_country_cnt)+
         log(1+songsListened) + log(1+lovedTracks)+
         log(1+posts)+log(1+playlists) + log(1+shouts)+
         tenure + good_country,
       data=data,family = binomial())
summary(ps)

#calculate propensity scores
ps_df=data.frame(pr_score = predict(ps, type = "response"),
           treatment = ps$model$treatment)
head(ps_df)

#plot the scores
ps_df %>%
  mutate(treatment = ifelse(treatment == 1, 'treatment', 'control')) %>%
  ggplot(aes(x = pr_score)) +
  geom_histogram(color = "white",bins=20) +
  facet_wrap(~treatment) +
  xlab("Probability of treatment") +
  theme_bw()

#step 3. propensity score matching####
#check na
anyNA(data) #FALSE

#matching
match <- matchit(treatment ~ age +male+log(1+friend_cnt)+avg_friend_age+
                   avg_friend_male+log(1+friend_country_cnt)+
                   log(1+songsListened) +log(1+lovedTracks) + 
                   log(1+posts)+log(1+playlists) + log(1+shouts)+
                   log(1+tenure) + good_country,
                 data = data, method = 'nearest',caliper=0.01)
summary(match)

#create datafame only with matched data
data_m <- match.data(match)
dim(data_m)

#step 4. assess covariate balance####
#4.1. plots ####
plot_fun <- function(data, variable) {
  data$variable <- data[, variable]
  data$treatment <- as.factor(data$treatment)
  support <- c(min(data$variable), max(data$variable))
  ggplot(data, aes(x = distance, y = variable, color = treatment)) +
    geom_point(alpha = 0.2, size = 1.3) +
    geom_smooth(method = "loess", se = F) +
    xlab("Propensity score") +
    ylab(variable) +
    theme_bw() +
    ylim(support)
}
grid.arrange(
  plot_fun(data_m,'age'),
  plot_fun(data_m,'male'),
  plot_fun(data_m,'friend_cnt'),
  plot_fun(data_m,'avg_friend_age'),
  plot_fun(data_m,'avg_friend_male'),
  plot_fun(data_m,'friend_country_cnt'),
  nrow = 3, widths = c(1, 0.8)
)
grid.arrange(
  plot_fun(data_m,'songsListened'),
  plot_fun(data_m,'lovedTracks'),
  plot_fun(data_m,'posts'),
  plot_fun(data_m,'playlists'),
  plot_fun(data_m,'shouts'),
  plot_fun(data_m,'tenure'),
  plot_fun(data_m,'good_country'),
  nrow = 4, widths = c(1, 0.8)
)

#4.2. t-test####
#t-test
lapply(data_m[,var],function(v2){t.test(v2~data_m$treatment)})

#t-test table
test2 = NULL
for (i in 1:13){
  variable = var[i]
  p_value = t.test(data_m[, var[i]] ~ data_m$treatment)$p.value
  test2 <- rbind(test2, data.frame(variable, p_value))
}
test2 #results show the mean differences are insignificant

#step 5. Estimating treatment effect####
#regression to see the effect
log_reg=glm(adopter~treatment,data=data_m,binomial())
summary(log_reg)

#Q4. Logistic Regression ####
log_reg1=glm(adopter~age +male+log(1+friend_cnt)+avg_friend_age+
              avg_friend_male+log(1+friend_country_cnt)+
               log(1+subscriber_friend_cnt)+
              log(1+songsListened) +log(1+lovedTracks) + 
              log(1+posts)+log(1+playlists) + log(1+shouts)+
              log(1+tenure) + good_country,
            data=data_m,family = binomial())
summary(log_reg1)

#reduced model with only the significant variables
log_reg2=glm(adopter~age +male+avg_friend_age+
               log(1 + subscriber_friend_cnt)+
               log(1+songsListened) +log(1+lovedTracks) + 
               log(1+posts)+log(1+playlists) + log(1+shouts)+
               log(1+tenure) + good_country,
            data=data_m,family = binomial())
summary(log_reg2)

#exponential coeff
coeff_exp=exp(log_reg2$coefficients)
coeff=log_reg2$coefficients

#odd ratio table
odd_r=NULL
for (i in 2:12){
  if (i%in% c(5:11)){
    odd_ratio=exp(coeff[i]/100)
    odd_r=rbind(odd_r,data.frame(odd_ratio))
  }
  else{
    odd_ratio=coeff_exp[i]
    odd_r=rbind(odd_r,data.frame(odd_ratio))
  }
}

#change the format of the table
odd_r <- cbind(variable = rownames(odd_r), odd_r)
rownames(odd_r) <- 1:nrow(odd_r)
odd_r$variable=c('age',"male","avg_friend_age","subscriber_friend_cnt", "songsListened",
                 "lovedTracks","posts","playlists","shouts","tenure","good_country")
odd_r

