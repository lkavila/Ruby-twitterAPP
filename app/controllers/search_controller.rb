class SearchController < ApplicationController
    def results
        @tweets = Tweet.buscador(params[:termino])
        @users = User.buscador(params[:termino])
    end
    def explore
        render 'search/explore'
    end
end