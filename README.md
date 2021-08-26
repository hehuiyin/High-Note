# High-Note
* Objective:

   Given the higher profitability of premium subscribers, it is generally in the interest of company to motivate users to go from “free to fee”; that is, convert free accounts to premium subscribers. The task in regards to this case is to analyze the data for potential insight to inform a “free-to-fee” strategy.

   Peer influence and user engagement can affect users’ decisions to pay for a premium subscription. Using the High Note data, we can predict the decision to buy using both types of variables. The results will quantify the effect of social engagement on revenue, as well as how valuable a premium subscriber can be in a freemium social community.

# Summary Statistics:

  <img width="708" alt="Screen Shot 2021-08-26 at 15 12 29" src="https://user-images.githubusercontent.com/73683982/131042902-59b67c60-c41b-4117-b51a-83d1c6c950ed.png">
  
  Group 1 is the adopters and group 0 is the non-adopters. From the above statistics, we can see that compared with non-adopters, adopters are generally are older males with more friends and they are more likely from countries other than US, UK, and Germany. And adopters’ friends are also older and diversely from different countries. They also have more friends who are subscribers. They also are more active on the platform, listening to more songs, showing more loved tracks, posting more Q&A forum, receiving more shouts and staying on the site longer.
  
# Data Visulization:

## (i)Demogepahics:
### Age:
<img width="332" alt="Screen Shot 2021-08-26 at 15 19 04" src="https://user-images.githubusercontent.com/73683982/131043484-64b63e4d-7386-4481-8577-30670fcc1198.png">

### male & good_country:
<img width="348" alt="Screen Shot 2021-08-26 at 15 19 35" src="https://user-images.githubusercontent.com/73683982/131043521-40691de9-c587-419c-9666-d111c5903167.png">

And thus, in terms of demographics, we can conclude that adopters are more likely to be older males who are not from US, UK or Germany. Because older people might have a higher income, it makes them more affordable to become premium users.

## (ii)Peer Influence:
### friend_cnt:
<img width="356" alt="Screen Shot 2021-08-26 at 15 20 05" src="https://user-images.githubusercontent.com/73683982/131043564-0bf04698-39c9-4512-9c5f-2e03418a668e.png">

* The horizontal lines represent the mean values of friend_cnt for two groups and we can see the yellow line (adopter) is above the grey line (non-adopter), meaning that on average, the group 1 (adopter) has more friends than group 0 (non-adopter). However, it’s interesting to see that there’s also non-adopter who has close to 5,000 friends. And also there are more non-adopters have friend number more than 1,000, compared with adopters. Even though there are some non-adopters have lots of friends, there are still a lots of them do not have significant amount of friends. Thus, the adopters still have more friends than non-adopters on average.

### avg_friend_age:
<img width="392" alt="Screen Shot 2021-08-26 at 15 21 41" src="https://user-images.githubusercontent.com/73683982/131043710-fd46dc72-e922-45ca-bdf4-fd65b8e871b8.png">

### subscriber_friend_cnt:
<img width="490" alt="Screen Shot 2021-08-26 at 15 23 03" src="https://user-images.githubusercontent.com/73683982/131043819-c4b7deac-cf59-4283-95a0-4a404739a3dd.png">

* The horizontal lines shows the mean values of number of subscriber friends in two groups and we can see that yellow line is above the grey line, meaning that adopters have more subscriber friends than non-adopters on average. However, it’s also interesting to see that there is also non-adopter who has more than 300 subscriber friends and also compared with adopters, there are more non-adopters who have more than 50 subscriber friends. However, since there are still lots of non-adopters who have less subscriber friends, adopters have more subscriber friends on average.

Therefore, in terms of peer influence, adopters generally have more friends and subscriber friends and their friends are more likely to be older males and are diversely from different countries. Interestingly, we also find out the some non-adopters have many friends and subscriber friends but since they are only a few people, most non-adopters do not have lots of friends and subscriber friends. And thus, we can say that on average, adopters have more peer influence than non-adopters. The stronger peer influence is how it make them convert from free users to premium users.

## (iii)User engagement:
### performance on the platform:
<img width="330" alt="Screen Shot 2021-08-26 at 15 29 34" src="https://user-images.githubusercontent.com/73683982/131044327-2a17c73f-3453-475b-8eab-858c6ebc055a.png">

### tenure (in months):
<img width="448" alt="Screen Shot 2021-08-26 at 15 30 03" src="https://user-images.githubusercontent.com/73683982/131044360-f28e8296-18ca-4f22-ae7d-e430ba81b50e.png">

To summarize, in terms of user engagement, adopters are more active and stay longer on the site, showing a better performance and engagement on interacting with the features including songsListened, lovedTracks, posts, playlists, shouts. Even though there are a few non-adopters who also stay with the platform for a long time, adopters still show a better performance in general. Because those people are more engaged with the platform, they are more likely to convert from free users to premium users.

Propensity Score Matching:





Analysis can be seen:
https://hehuiyin.github.io/High-Note/
