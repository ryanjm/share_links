require 'spec_helper'

describe Comment do
  VALID_URL = "http://google.com"
  before :each do
    @w = WebLink.create(url: VALID_URL)
    @r = User.create(name: "Ryan")
  end

  context "#remove_archives" do
    it "removes archive links if there are any" do
      @w.archive(@r)
      @w.comments.create(body: "new comment")
      @w.archive_links.reload
      @w.archive_links.length.should eq(0)
    end
    it "unarchives a web link" do
      @w.archive(@r)
      @w.archived.should be_true
      @w.comments.create(body: "new comment")
      @w.reload
      @w.archived.should be_false
    end
  end
end
