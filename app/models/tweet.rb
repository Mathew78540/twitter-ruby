class Tweet < ActiveRecord::Base

  belongs_to :account
  has_many :likes

  validates :account_id, :presence => true
  validates :text, :presence => true, :length => { :in => 1..140 }

  before_create :parse_hashtags

  private
    def parse_hashtags

      self.text.scan(/#\S+/).each do |hashtag|

        the_good_hashtag = Hashtag.where(hashtag: hashtag).first

        if the_good_hashtag
          the_good_hashtag.count = the_good_hashtag.count + 1
          the_good_hashtag.save
        else
          Hashtag.create(hashtag: hashtag)
        end

      end

    end
end
