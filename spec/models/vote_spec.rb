require 'rails_helper'
describe Vote do
  include TestFactories

  describe "validations" do
    let(:post) { Post.create(title: 'post title', body: 'Post bodies must be pretty long.') }
    let(:vote) { Vote.new(value: vote_value, post: post) }

    describe "when value is 1" do
      let(:vote_value) { 1 }

      it "successfully saves" do
        expect(vote.save).to eq(true)
      end
    end

    describe "when value is -1" do
      let(:vote_value) { -1 }

      it "successfully saves" do
        expect(vote.save).to eq(true)
      end
    end

    describe "when value is 0" do
      let(:vote_value) { 0 }

      it "does not save" do
        expect(vote.save).to eq(false)
      end
    end
  end
     describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
end