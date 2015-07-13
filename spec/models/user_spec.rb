 require 'rails_helper'
 
 describe User do
 
   include TestFactories
   
   before do
    @post = associated_post
    @user = authenticated_user(email_favorites: true)
   end

   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
      favorite = Favorite.create(user: @user, post: @post)
      expect(favorite).to eq(@user.favorited(@post))
     end

     it "returns `nil` if the user has favorited another post" do
      ##
     end

   end
 end