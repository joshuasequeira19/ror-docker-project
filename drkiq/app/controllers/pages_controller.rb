class PagesController < ApplicationController
  @meaning_of_life = CounterJob.perform_now
end
