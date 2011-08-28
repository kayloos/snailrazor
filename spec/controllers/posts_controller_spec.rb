require "spec_helper"

describe PostsController do
  render_views

  before(:each) do
    @attr = { :email => Factory.next(:email),
              :password => "foobar",
              :password_confirmation => "foobar"}
    @user = User.create!(@attr)
    sign_in @user
  end

  describe "GET 'index'" do
    it "should have the correct title" do
      get "index"
      response.should have_selector("title", :content => "Posts")
    end

    it "should display title of posts" do
      @p1 = Factory(:post, :user => @user)
      @p2 = Factory(:post, :user => @user, :title => "Test title")
      get :index
      response.should have_selector("h2.post_title", :content => @p1.title)
      response.should have_selector("h2.post_title", :content => @p2.title)
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @post = Factory(:post, :user => @user)
    end

    it "should respond" do
      get :show, :id => @post
    end

    it "should have the right title" do
      get :show, :id => @post
      response.should have_selector("title", :content => "Show")
    end

    it "should display post title" do
      get :show, :id => @post
      response.should have_selector("h2.post_title", :content => @post.title)
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = {}
      end

      it "should not create a post" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end

      it "should render the home page" do
        post :create, :post => @attr
        response.should render_template("posts/new")
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :title => "Post title", :body => "Post body" }
      end
      it "should add a post" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end

      it "should redirect to posts path" do
        post :create, :post => @attr
        response.should redirect_to posts_path
      end

      it "should have a flash message" do
        post :create, :post => @attr
        flash[:success].should =~ /post saved/i
      end
    end
  end
end
