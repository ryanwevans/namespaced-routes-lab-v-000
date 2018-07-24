class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Preference.first_or_create(artist_sort_order: "ASC", song_sort_order: "ASC", allow_create_artist: false, allow_create_song: false)
  end

  def update
    @preferences = Preference.update(params[preference_params])
  end

  private

  def preference_params
    params.require(:preference).permit(:artist_sort_order, :song_sort_order, :allow_create_artist, :allow_create_song)
  end

end
