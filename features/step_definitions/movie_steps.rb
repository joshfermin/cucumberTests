# Add a declarative step here for populating the DB with movies.

Given (/^the following movies exist:$/) do |movies_table|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  movies_table.hashes.each do |movie| # puts the movie table in features into a hash
    Movie.create!(movie) # create a movie object from the current movie.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then (/I should see "(.*)" before "(.*)"/) do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or un-checking several boxes at once
  #  "When I uncheck the following ratings: PG, G, R"
  #  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(", ")
    ratings.each do |rating|
      if uncheck then
        uncheck("ratings_#{rating}")
      else
        check("ratings_#{rating}")
      end
    end
end


