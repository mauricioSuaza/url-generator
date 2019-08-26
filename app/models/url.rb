class Url < ApplicationRecord

  URL_REGREX =  /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/

  before_validation :format_url
  after_validation :generate_shortened, on: :create
  after_create :increment_count

  validates :original, presence: true, 
    uniqueness: true, format: {with: URL_REGREX}

  def self.search(code)
    return unless url = Url.find_by(shortened: code)
    url.increment_count
  end

  def self.find_or_instantiate(requested_url)
    url = Url.new(original: requested_url) 
    old_url = Url.find_by(original: url.send(:format_url))

    return old_url.increment_count if old_url 
    url 
  end

  def increment_count
    self.increment!(:count)
  end

  private 
    def generate_shortened
      begin 
        self.shortened =  Array.new(6) {random_sample}.join
      end while Url.find_by(shortened: self.shortened)
    end

    def format_url
      unless self.original.blank? || URI.parse(self.original).scheme
        self.original = "http://#{self.original}" 
      end
    end

    def random_sample
      [Array('a'..'z'),Array('A'..'Z'),Array('0'..'9')].flatten.sample
    end
end
