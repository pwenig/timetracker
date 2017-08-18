json.extract! timecard, :id, :time_in, :time_out, :tasks, :notes, :created_at, :updated_at
json.url timecard_url(timecard, format: :json)
