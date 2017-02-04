class BookmarkPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def create?
    !user.nil?
  end

  def update?
    !user.nil? and user.id == bookmark.user_id
  end

  def destroy?
    !user.nil? and user.id == bookmark.user_id
  end
end
