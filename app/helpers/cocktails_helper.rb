module CocktailsHelper
  def cocktail_url(cocktail)
    cocktail.photo.present? ? cocktail.photo.path : ""
  end
end
