class Tweet < ActiveRecord::Base

  belongs_to :account
  has_many :likes

  validates :account_id, :presence => true
  validates :text, :presence => true, :length => { :in => 1..140 }

  before_create :parse_hashtags

  private
    def parse_hashtags

      self.text.scan(/#\S+/).each do |hashtag|

        hashtag_query = Hashtag.where(hashtag: hashtag)

        if hashtag_query.first
          hashtag_query.increment_counter(:count, 1)
        else
          Hashtag.create(hashtag: hashtag)
        end
      end

    end
end
