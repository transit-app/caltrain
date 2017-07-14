class Stop < ApplicationRecord
  # if we don't have 'optional: true', every stop will be required to have a station & train.
  belongs_to :station, optional: true
  belongs_to :train, optional: true
end
