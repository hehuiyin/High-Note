# High-Note Analysis
* Objective:

   Given the higher profitability of premium subscribers, company wants to motivate users to go from “free to fee” that is to convert free accounts to premium subscribers. This case is to analyze the data for potential insight to inform a “free-to-fee” strategy.

   Peer influence and user engagement can affect users’ decisions to pay for a premium subscription. Using the High Note data, we can predict the decision to convert using different types of variables. The results will quantify how valuable a premium subscriber can be in a freemium social community.

# Summary Statistics:

  <img width="708" alt="Screen Shot 2021-08-26 at 15 12 29" src="https://user-images.githubusercontent.com/73683982/131042902-59b67c60-c41b-4117-b51a-83d1c6c950ed.png">
  
  Group 1 is the adopters and group 0 is the non-adopters. From the above statistics, we can see that compared with non-adopters, adopters are generally are older males with more friends and they are more likely from countries other than US, UK, and Germany. And adopters’ friends are also older and diversely from different countries. They also have more friends who are subscribers. They also are more active on the platform, listening to more songs, showing more loved tracks, posting more Q&A forum, receiving more shouts and staying on the site longer.
  
# Data Visulization:

## i.Demogepahics:
### Age:
<img width="332" alt="Screen Shot 2021-08-26 at 15 19 04" src="https://user-images.githubusercontent.com/73683982/131043484-64b63e4d-7386-4481-8577-30670fcc1198.png">

### male & good_country:
<img width="348" alt="Screen Shot 2021-08-26 at 15 19 35" src="https://user-images.githubusercontent.com/73683982/131043521-40691de9-c587-419c-9666-d111c5903167.png">

And thus, in terms of demographics, we can conclude that adopters are more likely to be older males who are not from US, UK or Germany. Because older people might have a higher income, it makes them more affordable to become premium users.

## ii.Peer Influence:
### friend_cnt:
<img width="356" alt="Screen Shot 2021-08-26 at 15 20 05" src="https://user-images.githubusercontent.com/73683982/131043564-0bf04698-39c9-4512-9c5f-2e03418a668e.png">

   * The horizontal lines represent the mean values of friend_cnt for two groups and we can see the yellow line (adopter) is above the grey line (non-adopter), meaning that on average, the group 1 (adopter) has more friends than group 0 (non-adopter). However, it’s interesting to see that there’s also non-adopter who has close to 5,000 friends. And also there are more non-adopters have friend number more than 1,000, compared with adopters. Even though there are some non-adopters have lots of friends, there are still a lots of them do not have significant amount of friends. Thus, the adopters still have more friends than non-adopters on average.

### avg_friend_age:
<img width="392" alt="Screen Shot 2021-08-26 at 15 21 41" src="https://user-images.githubusercontent.com/73683982/131043710-fd46dc72-e922-45ca-bdf4-fd65b8e871b8.png">

### subscriber_friend_cnt:
<img width="490" alt="Screen Shot 2021-08-26 at 15 23 03" src="https://user-images.githubusercontent.com/73683982/131043819-c4b7deac-cf59-4283-95a0-4a404739a3dd.png">

   * The horizontal lines shows the mean values of number of subscriber friends in two groups and we can see that yellow line is above the grey line, meaning that adopters have more subscriber friends than non-adopters on average. However, it’s also interesting to see that there is also non-adopter who has more than 300 subscriber friends and also compared with adopters, there are more non-adopters who have more than 50 subscriber friends. However, since there are still lots of non-adopters who have less subscriber friends, adopters have more subscriber friends on average.

Therefore, in terms of peer influence, adopters generally have more friends and subscriber friends and their friends are more likely to be older males and are diversely from different countries. Interestingly, we also find out the some non-adopters have many friends and subscriber friends but since they are only a few people, most non-adopters do not have lots of friends and subscriber friends. And thus, we can say that on average, adopters have more peer influence than non-adopters. The stronger peer influence is how it make them convert from free users to premium users.

## iii.User engagement:
### performance on the platform:
<img width="330" alt="Screen Shot 2021-08-26 at 15 29 34" src="https://user-images.githubusercontent.com/73683982/131044327-2a17c73f-3453-475b-8eab-858c6ebc055a.png">

### tenure (in months):
<img width="448" alt="Screen Shot 2021-08-26 at 15 30 03" src="https://user-images.githubusercontent.com/73683982/131044360-f28e8296-18ca-4f22-ae7d-e430ba81b50e.png">

To summarize, in terms of user engagement, adopters are more active and stay longer on the site, showing a better performance and engagement on interacting with the features including songsListened, lovedTracks, posts, playlists, shouts. Even though there are a few non-adopters who also stay with the platform for a long time, adopters still show a better performance in general. Because those people are more engaged with the platform, they are more likely to convert from free users to premium users.

# Propensity Score Matching:
* use PSM to test whether having subscriber friends affects the likelihood of becoming an adopter. For this purpose, we first divide the treatment and control based on the number of subscriber friendsTreatment group: 
   * subscriber_friend_cnt >=1
   * Control group: subscriber_friend_cnt =0

<img width="380" alt="Screen Shot 2021-08-26 at 15 42 07" src="https://user-images.githubusercontent.com/73683982/131045313-390e45dd-d0c9-4c78-842d-be7ae1554c78.png">

 From the t-test, the p-value is significant and thus, the means are different between two groups and that’s why matching is needed to balance the data.
 
<img width="641" alt="Screen Shot 2021-08-26 at 15 43 35" src="https://user-images.githubusercontent.com/73683982/131045426-8c90d96e-d1d7-40ad-a8aa-9214a4800d8f.png">

From the distribution graphs of each variable above, the following variables are highly right-skewed: friend_cnt, firend_country_cnt, songsListened, lovedTracks, posts, playlists, shouts. And thus, we will take log transformation on these variables in the following logistic regression model in order to eliminate the outlier effect on our results. And the logistic regression result is shown as following and we can see that all variables are significant:

<img width="350" alt="Screen Shot 2021-08-26 at 15 46 21" src="https://user-images.githubusercontent.com/73683982/131045652-348eac07-adfd-48cd-be04-5f94c705c753.png">

After calculating the propensity score using the above logiatic regression model, we can plot a histogram showing the distribution of propensity score by treatment status. The control group graph is right skewed with more propensity scores that are closer to 0 while the treatment group is more smooth with consistent distribution among all levels of scores.

<img width="396" alt="Screen Shot 2021-08-26 at 17 31 46" src="https://user-images.githubusercontent.com/73683982/131053013-644438a2-77c0-4f14-a2fc-5644d7e8e2ea.png">

And then, we can execute the matching using nearest method. The nearest method pair a treatment observation to the one in control group with the closest propensity score. 

We can see from the result below that the algorithm found 6,948 pairs of matched treatment and control observations. Before the matching, the propensity scores for treatment and control group is 0.4938 and 0.1462, respectively. After the matching, the scores become 0.3635 and 0.3629 with a difference of 0.0006 which is a lot lower than the previous difference of 0.3476, proving that the data balance has been improved by 99.8%.

<img width="548" alt="Screen Shot 2021-08-26 at 17 39 07" src="https://user-images.githubusercontent.com/73683982/131053479-55eecca7-72e4-4dc0-8d4d-d5a869ca2e31.png">

To assess the balance in the matched dataset, we can plot the means of each covariate based on propensity score for treatment and control group. If the means are really close to each other, that means that the matching is done well. And the graphs below shows nearly identical means for each covariate between two groups so our matching is good.

<img width="412" alt="Screen Shot 2021-08-26 at 17 41 22" src="https://user-images.githubusercontent.com/73683982/131053611-093fc299-9690-427a-931f-b7a18b69e2dc.png">
<img width="410" alt="Screen Shot 2021-08-26 at 17 41 35" src="https://user-images.githubusercontent.com/73683982/131053625-624d0a85-ca3f-46b4-bf55-41cbeb5bf4fb.png">

In order to make sure our means are really statistically indifferent in two groups, we can perform t-test on all the covariates to see if there is significant mean differences. And the result below shows that all of the p-values are insignificant which means that all the means of covariates are the same between treatment and control group, proving that our matching is done successfully and our matched data is now balanced.

<img width="233" alt="Screen Shot 2021-08-26 at 17 43 21" src="https://user-images.githubusercontent.com/73683982/131053752-714f6727-1be8-4ba7-9b19-49243803fb02.png">

After the matching is done, we can then use the matched dataset to run a logistic regression model to see the effect of treatment on adopter. The regression result below shows that treatment (subscriber friend>=1) has a positive effect on adopter (premium users), meaning that having more than one subscriber friends have a positive effect on converting users from free users to premium users.

<img width="372" alt="Screen Shot 2021-08-26 at 17 44 49" src="https://user-images.githubusercontent.com/73683982/131053833-afad257e-f3cf-4420-8ff4-2844f25bad73.png">

# Regression Analysis
   * use a logistic regression approach to test which variables are significant for explaining the likelihood of becoming an adopter

<img width="373" alt="Screen Shot 2021-08-26 at 17 48 38" src="https://user-images.githubusercontent.com/73683982/131054127-9e1f10c2-a2dc-443c-99a0-a77031b103b0.png">

In conclusion, age, male, friends’ age, subscriber friend amount, the number of songs listened, loved tracks, posts and playlists have a positive effect on converting users from free to premium which means that the higher these variables become, the higher the chance that free users will convert to a premium users. However, the number of shouts, the time spent on the site and whether users are from US, UK and Germany have a negative effect on becoming a premium users, meaning that the higher these variables are, the lower the probability of becoming premium users.





The complete analysis can be found on:
https://hehuiyin.github.io/High-Note/
