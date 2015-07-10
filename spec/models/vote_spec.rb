require 'rails_helper'
describe Vote do
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
end