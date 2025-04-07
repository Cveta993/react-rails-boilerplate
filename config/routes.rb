Rails.application.routes.draw do
  namespace :api do
    get 'hotels/search', to: 'hotels#search'
  end

  get '*path', to: "static_pages#fallback_index_html", constraints: ->(request) {
    !request.xhr? && request.format.html?
  }
end

