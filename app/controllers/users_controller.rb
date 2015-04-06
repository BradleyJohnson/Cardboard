class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comment = Comment.new

    sql = "CREATE OR REPLACE VIEW STATS AS
          SELECT Results.user_id, SUM(case Result when true then 1 else 0 end) AS wins, SUM(case Result when false then 1 else 0 end) AS losses, Mechanics.mechanic_type
          FROM (Results JOIN Mechanics ON Results.game_id=Mechanics.game_id)
          GROUP BY mechanic_type, user_id;

          Select * FROM stats where user_id=#{@user.id};"

    @results = ActiveRecord::Base.connection.execute(sql)
    
  end
end
