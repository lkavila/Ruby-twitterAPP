module TweetsHelper
    def FormatDate(date)
        t = Time.now() 
        if t-date < 3600.minute
            formatDate = date.strftime("%kh ") 
            if t-date < 60.minute
                formatDate = date.strftime("%Mm") 
                if t-date < 1.minute
                    formatDate = date.strftime("%Ss") 
                end
            end
        else
            formatDate = date.strftime("%b %e")
        end

        return formatDate
    end

    def getUserName(tweet)
        users = User.all
        users.each do |user|
            if(user.tweets.find(tweet.id))
                return user
            end
        end
    end
end
