# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'sentinels#choose'
get '/sentinels', to: 'sentinels#choose'
get '/sentinels/:sentinel_name/pictures/days', to: 'sentinels#pictures_days',  as: :sentinel_pictures_days
get '/sentinels/:sentinel_name/pictures/days/:day', to: 'sentinels#pictures_day',  as: :sentinel_pictures_day
